//
//  DSSkillPointSettingViewController.m
//  dqxSkillSmltr
//
//  Created by HANSHAOWEN on 16/12/12.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZNSegmentedControl.h"
#import "View+MASAdditions.h"
#import "DSTableSkillPointSettingCell.h"
#import "DSTableSkillPointSettingUnusedCell.h"
#import "DSTableSkillPointSettingFooterCell.h"
#import "DSTableSkillPointSettingCellItem.h"
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>
#import "DSSkillPointSettingViewController.h"
#import "GoogleMobileAds/GoogleMobileAds.h"

@interface DSSkillPointSettingViewController () <UITableViewDataSource, UITableViewDelegate, DZNEmptyDataSetSource>

@property (strong, nonatomic) NSString* jobName;
@property (strong, nonatomic) NSString *skillType;
@property (strong, nonatomic) DZNSegmentedControl *segmentedControl;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIActivityIndicatorView *activityIndicatorView;
@property (strong, nonatomic) UIStepper *pointStepper;
@property (strong, nonatomic) GADBannerView  *bannerView;

@end

@implementation DSSkillPointSettingViewController {
    NSMutableDictionary *dataSource;
    AppDelegate *appDelegate;
}

#pragma mark - Lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initDatas];
    [self setupViews];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

#pragma mark - Private Method

- (void)initDatas {
    dataSource = [NSMutableDictionary dictionaryWithCapacity:5];
    DSGlobalJobInfo *jobInfo = appDelegate.gJobInfo[_jobName];
    _skillType = jobInfo.skillJob;
}

- (void)setupViews {
    DSGlobalJobInfo *jobInfo = appDelegate.gJobInfo[_jobName];
    NSString *titleStr = [[NSString alloc] initWithFormat:@"%@剩余点数:%i", _jobName, (int)jobInfo.unusePoint/*, (int)jobInfo.totelPoint*/];
    self.navigationItem.title = titleStr;
    
    _pointStepper = [[UIStepper alloc] init];
    
    _segmentedControl = ({
        DSGlobalJobInfo *jobInfo = appDelegate.gJobInfo[_jobName];
        
        DZNSegmentedControl *segmentedControl = [[DZNSegmentedControl alloc] initWithItems:@[jobInfo.skillJob, jobInfo.skillWeapon1, jobInfo.skillWeapon2, jobInfo.skillWeapon3, jobInfo.skillWeapon4]];
        segmentedControl.backgroundColor = [UIColor whiteColor];
        segmentedControl.frame = CGRectMake(0, 0, SCREEN_WIDTH, 35);
        segmentedControl.showsCount = NO;
        segmentedControl.font = FontWithSize(12);
        [segmentedControl setTitleColor:[UIColor colorWithWhite:127 / 255.0 alpha:1] forState:UIControlStateNormal];
        segmentedControl.tintColor = DSAppThemeColor;
        segmentedControl.hairlineColor = nil;
        [segmentedControl addTarget:self action:@selector(selectedSegment:) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:segmentedControl];
        [segmentedControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@35);
            make.left.top.right.equalTo(self.view).insets(UIEdgeInsetsMake(64, 0, 0, 0));
        }];
        
        segmentedControl;
    });
    
    _tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        tableView.backgroundColor = [UIColor whiteColor];
        tableView.dataSource = self;
        tableView.delegate = self;
        [tableView registerClass:[DSTableSkillPointSettingCell class] forCellReuseIdentifier:kDSTableSkillPointSettingCellID];
        [tableView registerClass:[DSTableSkillPointSettingUnusedCell class] forCellReuseIdentifier:kDSTableSkillPointSettingUnusedCellID];
        [tableView registerClass:[DSTableSkillPointSettingFooterCell class] forHeaderFooterViewReuseIdentifier:kDSTableSkillPointSettingFooterCellID];
        
        tableView.tableFooterView = [UIView new];
        tableView.emptyDataSetSource = self;
        [self.view addSubview:tableView];
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_segmentedControl.mas_bottom);
            make.left.bottom.right.equalTo(self.view);
        }];
        
        tableView;
    });
    
    
    _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _activityIndicatorView.hidesWhenStopped = YES;
    [self.view addSubview:_activityIndicatorView];
    [_activityIndicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
    
    //特技点设定详情页最下方常驻的Google广告
    NSMutableArray *history;
    NSString *docPath =  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [docPath stringByAppendingPathComponent:@"RecipeHistory"];
    
    history = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if (ISNULL(history))
        history = [[NSMutableArray alloc] init];
    
    _bannerView = [[GADBannerView alloc] initWithFrame:CGRectMake(0.0,
                                                                  self.view.frame.size.height -
                                                                  GAD_SIZE_320x50.height,
                                                                  self.view.frame.size.width,
                                                                  GAD_SIZE_320x50.height)];
    NSLog(@"Google Mobile Ads SDK version: %@", [GADRequest sdkVersion]);
    //2号横幅广告位
    self.bannerView.adUnitID = @"ca-app-pub-9308902363520222/7218630190";
    //Google AdMob提供的测试广告ID
    //self.bannerView.adUnitID = @"ca-app-pub-3940256099942544/2934735716";
    self.bannerView.rootViewController = self;
    GADRequest *request = [GADRequest request];
    //request.testDevices = @[ @"66fc40441247f9df253bbcaa32f528bb" ];
    [self.bannerView loadRequest:request];
    
    [self.view addSubview:_bannerView];
    [_bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(self.view.frame.size.width));
        make.height.equalTo(@50);
        make.bottom.left.equalTo(self.view);
    }];
}



#pragma mark - Public Method



#pragma mark - Action

- (void)selectedSegment:(DZNSegmentedControl *)control {
    DSGlobalJobInfo *jobInfo = appDelegate.gJobInfo[_jobName];
    if (control.selectedSegmentIndex == 0) {
        _skillType = jobInfo.skillJob;
    } else if (control.selectedSegmentIndex == 1) {
        _skillType = jobInfo.skillWeapon1;
    } else if (control.selectedSegmentIndex == 2) {
        _skillType = jobInfo.skillWeapon2;
    } else if (control.selectedSegmentIndex == 3) {
        _skillType = jobInfo.skillWeapon3;
    } else if (control.selectedSegmentIndex == 4) {
        _skillType = jobInfo.skillWeapon4;
    }
    [self updateCurrentView];
}


#pragma mark - DZNEmptyDataSetSource

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"search_null_image"];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    int index = 0;
    NSArray *aName = appDelegate.gSkillInfo.skillName;
    for (;index < aName.count; index++)
    {
        NSString *type = appDelegate.gSkillInfo.typeName[index];
        if ([type isEqualToString:_skillType])
            break;
    }
    
    NSArray *array = appDelegate.gSkillInfo.skillDesc[index];
    
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DSTableSkillPointSettingCellItem *model = [self getSelectSkillPointItemInfo:indexPath];
    NSInteger otherJobPoint = [appDelegate getUsedPointOfOtherJob:_jobName skillType:_skillType];
    NSInteger currentJobPoint = [appDelegate getUsedPointOfCurrentJob:_jobName skillType:_skillType];
    if (otherJobPoint + currentJobPoint >= [model.skillPoint intValue]){
        return [tableView dequeueReusableCellWithIdentifier:kDSTableSkillPointSettingCellID forIndexPath:indexPath];
    }
    else{
        return [tableView dequeueReusableCellWithIdentifier:kDSTableSkillPointSettingUnusedCellID forIndexPath:indexPath];
    }
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return [DSTableSkillPointSettingFooterCell viewHeight];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [DSTableSkillPointSettingCell cellHeight];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    DSTableSkillPointSettingFooterCell *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kDSTableSkillPointSettingFooterCellID];
    NSArray *strList = [self getPointSourceStr];
    for (NSInteger i = 0; i < view.labelArray.count; i++)
    {
        if (i < strList.count)
            ((UILabel*)view.labelArray[i]).text = strList[i];
        else
            ((UILabel*)view.labelArray[i]).text = @"";
    }
    DSGlobalJobInfo *jobInfo = [[DSGlobalJobInfo alloc] init];
    jobInfo = appDelegate.gJobInfo[_jobName];
    NSInteger curNeedToFull = CURRENT_MAX_SKILL_POINT_OF_SKILL_TYPE - [appDelegate getUsedPointOfOtherJob:_jobName skillType:_skillType];
    NSInteger curJobSkillUnusedPoint = jobInfo.unusePoint + [appDelegate getUsedPointOfCurrentJob:_jobName skillType:_skillType];
    view.step.maximumValue = curNeedToFull > curJobSkillUnusedPoint ? curJobSkillUnusedPoint : curNeedToFull;
    view.step.value = [appDelegate getUsedPointOfCurrentJob:_jobName skillType:_skillType];
    
    return view;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    int index = 0;
    for (;index < appDelegate.gSkillInfo.skillName.count; index++)
    {
        NSString *type = appDelegate.gSkillInfo.typeName[index];
        if ([type isEqualToString:_skillType])
            break;
    }
    
    NSArray *arrayName = appDelegate.gSkillInfo.skillName[index];
    NSArray *arrayPoint = appDelegate.gSkillInfo.skillPoint[index];
    NSArray *arrayDesc = appDelegate.gSkillInfo.skillDesc[index];
    
    
    DSTableSkillPointSettingCellItem *model = [[DSTableSkillPointSettingCellItem alloc] init];//[self dataByCurrentSearchType][indexPath.row];
    model.skillName = arrayName[indexPath.row];
    model.skillPoint = arrayPoint[indexPath.row];
    model.skillDesc = arrayDesc[indexPath.row];
    
    [(DSTableSkillPointSettingCell *)cell configureCellWithSkillPointItem:(DSTableSkillPointSettingCellItem *)model];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //职业名称  特技类型  特技点数  剩余点数
    DSGlobalJobInfo *jobInfo = [[DSGlobalJobInfo alloc] init];
    jobInfo = appDelegate.gJobInfo[_jobName];
    DSTableSkillPointSettingCellItem *model = [self getSelectSkillPointItemInfo:indexPath];
    NSInteger usedPointOfOtherJob = [appDelegate getUsedPointOfOtherJob:_jobName skillType:_skillType];
    NSInteger usedPointOfCurrentJob = [appDelegate getUsedPointOfCurrentJob:_jobName skillType:_skillType];
    NSInteger needPoint = [model.skillPoint intValue] - usedPointOfOtherJob - usedPointOfCurrentJob;
    if (jobInfo.unusePoint >= needPoint && (needPoint + usedPointOfCurrentJob) >= 0)
    {
        //这里有个奇怪的BUG，求指导，哪位大侠看到了，解决方案请发送以下邮箱：
        //hsw625728@163.com
        //感激不尽
        //--崩溃代码--
        //[jobInfo.skillPointSetting setObject:model.skillPoint forKey:skillTypeStr];
        //--以下是一个笨的解决方案
        NSMutableDictionary *temp = [[NSMutableDictionary alloc] initWithDictionary:jobInfo.skillPointSetting];
        [temp setObject:[NSString stringWithFormat:@"%i", ((int)needPoint + (int)usedPointOfCurrentJob)] forKey:_skillType];
        jobInfo.skillPointSetting = temp;
        //----------------------
        [jobInfo updateSkillPoint];
        
        [appDelegate.gJobInfo setObject:jobInfo forKey:_jobName];
        
        NSString *docPath =  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        NSString *path = [docPath stringByAppendingPathComponent:@"globalJobInfo"];
        [NSKeyedArchiver archiveRootObject:appDelegate.gJobInfo toFile:path];
    }
    else if ((needPoint + usedPointOfCurrentJob)  >= 0){
        //这里需要提示框：技能点数不足！
        [self showHUDWithText:@"技能点数不足！" delay:2];
    }
    
    NSString *titleStr = [[NSString alloc] initWithFormat:@"%@剩余点数:%i", _jobName, (int)jobInfo.unusePoint/*, (int)jobInfo.totelPoint*/];
    self.navigationItem.title = titleStr;
    [self updateCurrentView];
}

-(DSTableSkillPointSettingCellItem*)getSelectSkillPointItemInfo:(NSIndexPath *)indexPath {
    
    int index = 0;
    for (;index < appDelegate.gSkillInfo.skillName.count; index++)
    {
        NSString *type = appDelegate.gSkillInfo.typeName[index];
        if ([type isEqualToString:_skillType])
            break;
    }
    
    NSArray *arrayName = appDelegate.gSkillInfo.skillName[index];
    NSArray *arrayPoint = appDelegate.gSkillInfo.skillPoint[index];
    NSArray *arrayDesc = appDelegate.gSkillInfo.skillDesc[index];
    
    
    DSTableSkillPointSettingCellItem *model = [[DSTableSkillPointSettingCellItem alloc] init];//[self dataByCurrentSearchType][indexPath.row];
    model.skillName = arrayName[indexPath.row];
    model.skillPoint = arrayPoint[indexPath.row];
    model.skillDesc = arrayDesc[indexPath.row];
    
    return model;
}
-(void)setJobForPointSetting:(NSString*)job{
    _jobName = job;
}

-(NSArray*)getPointSourceStr{
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    
    //获取其他职业加点信息
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    dic = [appDelegate getPointStateOfOtherJob:_jobName skillType:_skillType];
    NSArray *keys = [dic allKeys];
    NSInteger i = 0;
    for ( ; i < keys.count; i++)// NSString *key in keys)
    {
        [temp setObject:[NSString stringWithFormat:@"%@:%@", [keys objectAtIndex:i], dic[[keys objectAtIndex:i]]] atIndexedSubscript:i];
    }
    
    //获取当前职业加点信息
    NSInteger curPoint = [appDelegate getUsedPointOfCurrentJob:_jobName skillType:_skillType];
    [temp setObject:[NSString stringWithFormat:@"%@:%i", _jobName, (int)curPoint] atIndexedSubscript:i];
    
    return temp;
}

-(void)updateCurrentView{
    /*//刷新上侧TabBar的点数
    NSInteger index = _segmentedControl.selectedSegmentIndex;
    NSInteger point = [appDelegate getUsedPointOfCurrentJob:_jobName skillType:_skillType] + [appDelegate getUsedPointOfOtherJob:_jobName skillType:_skillType];
    [_segmentedControl setTitle:[NSString stringWithFormat:@"%@(%i)", _skillType, (int)point] forSegmentAtIndex:index];
    [_segmentedControl updateConstraints];*/
    //刷新整个表格
    [_tableView reloadData];
}

- (void)valueChanged:(UIStepper *)stepper{
    //职业名称  特技类型  特技点数  剩余点数
    DSGlobalJobInfo *jobInfo = [[DSGlobalJobInfo alloc] init];
    jobInfo = appDelegate.gJobInfo[_jobName];
    
    //NSInteger usedPointOfOtherJob = [appDelegate getUsedPointOfOtherJob:_jobName skillType:_skillType];
    NSInteger usedPointOfCurrentJob = [appDelegate getUsedPointOfCurrentJob:_jobName skillType:_skillType];
    NSInteger needPoint = stepper.value /*- usedPointOfOtherJob*/ - usedPointOfCurrentJob;
    if (jobInfo.unusePoint >= needPoint && (needPoint + usedPointOfCurrentJob) >= 0)
    {
        //这里有个奇怪的BUG，求指导，哪位大侠看到了，解决方案请发送以下邮箱：
        //hsw625728@163.com
        //感激不尽
        //--崩溃代码--
        //[jobInfo.skillPointSetting setObject:model.skillPoint forKey:skillTypeStr];
        //--以下是一个笨的解决方案
        NSMutableDictionary *temp = [[NSMutableDictionary alloc] initWithDictionary:jobInfo.skillPointSetting];
        [temp setObject:[NSString stringWithFormat:@"%i", ((int)needPoint + (int)usedPointOfCurrentJob)] forKey:_skillType];
        jobInfo.skillPointSetting = temp;
        //----------------------
        [jobInfo updateSkillPoint];
        
        [appDelegate.gJobInfo setObject:jobInfo forKey:_jobName];
        
        NSString *docPath =  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        NSString *path = [docPath stringByAppendingPathComponent:@"globalJobInfo"];
        [NSKeyedArchiver archiveRootObject:appDelegate.gJobInfo toFile:path];
    }
    else if ((needPoint + usedPointOfCurrentJob)  >= 0){
        //这里需要提示框：技能点数不足！
        [self showHUDWithText:@"技能点数不足！" delay:2];
    }
    
    NSString *titleStr = [[NSString alloc] initWithFormat:@"剩余点数:%i", (int)jobInfo.unusePoint/*, (int)jobInfo.totelPoint*/];
    self.navigationItem.title = titleStr;
    [self updateCurrentView];
}

@end
