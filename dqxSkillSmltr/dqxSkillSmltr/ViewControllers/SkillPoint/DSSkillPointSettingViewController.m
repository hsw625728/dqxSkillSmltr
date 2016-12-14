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
#import "DSTableSkillPointSettingCellItem.h"
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>
#import "DSSkillPointSettingViewController.h"

@interface DSSkillPointSettingViewController () <UITableViewDataSource, UITableViewDelegate, DZNEmptyDataSetSource>

@property (strong, nonatomic) NSString* jobName;
@property (strong, nonatomic) DZNSegmentedControl *segmentedControl;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIActivityIndicatorView *activityIndicatorView;

@end

@implementation DSSkillPointSettingViewController {
    DSSkillType skillType;
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
    skillType = DSSkillTypeJbo;
}

- (void)setupViews {
    DSGlobalJobInfo *jobInfo = appDelegate.gJobInfo[_jobName];
    NSString *titleStr = [[NSString alloc] initWithFormat:@"%i/%i", (int)jobInfo.unusePoint, (int)jobInfo.totelPoint];
    self.navigationItem.title = titleStr;
    
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
}



#pragma mark - Public Method



#pragma mark - Action

- (void)selectedSegment:(DZNSegmentedControl *)control {
    if (control.selectedSegmentIndex == 0) {
        skillType = DSSkillTypeJbo;
    } else if (control.selectedSegmentIndex == 1) {
        skillType = DSSkillTypeWeapon1;
    } else if (control.selectedSegmentIndex == 2) {
        skillType = DSSkillTypeWeapon2;
    } else if (control.selectedSegmentIndex == 3) {
        skillType = DSSkillTypeWeapon3;
    } else if (control.selectedSegmentIndex == 4) {
        skillType = DSSkillTypeWeapon4;
    }
    [self.tableView reloadData];
}


#pragma mark - DZNEmptyDataSetSource

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"search_null_image"];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *skillTypeName = [[NSString alloc] init];
    skillTypeName = [self getSelectSkillType];
    
    int index = 0;
    NSArray *aName = appDelegate.gSkillInfo.skillName;
    for (;index < aName.count; index++)
    {
        NSString *type = appDelegate.gSkillInfo.typeName[index];
        if ([type isEqualToString:skillTypeName])
            break;
    }
    
    NSArray *array = appDelegate.gSkillInfo.skillDesc[index];
    
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:kDSTableSkillPointSettingCellID forIndexPath:indexPath];
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (skillType) {
        case DSSkillTypeJbo:
        case DSSkillTypeWeapon1:
        case DSSkillTypeWeapon2:
        case DSSkillTypeWeapon3:
        case DSSkillTypeWeapon4:
            return [DSTableSkillPointSettingCell cellHeight];
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *skillTypeName = [[NSString alloc] init];
    skillTypeName = [self getSelectSkillType];
    
    int index = 0;
    for (;index < appDelegate.gSkillInfo.skillName.count; index++)
    {
        NSString *type = appDelegate.gSkillInfo.typeName[index];
        if ([type isEqualToString:skillTypeName])
            break;
    }
    
    NSArray *arrayName = appDelegate.gSkillInfo.skillName[index];
    NSArray *arrayPoint = appDelegate.gSkillInfo.skillPoint[index];
    NSArray *arrayDesc = appDelegate.gSkillInfo.skillDesc[index];
    
    
    DSTableSkillPointSettingCellItem *model = [[DSTableSkillPointSettingCellItem alloc] init];//[self dataByCurrentSearchType][indexPath.row];
    model.skillName = arrayName[indexPath.row];
    model.skillPoint = arrayPoint[indexPath.row];
    model.skillDesc = arrayDesc[indexPath.row];
    
    
    switch (skillType) {
        case DSSkillTypeJbo:
        case DSSkillTypeWeapon1:
        case DSSkillTypeWeapon2:
        case DSSkillTypeWeapon3:
        case DSSkillTypeWeapon4:
            [(DSTableSkillPointSettingCell *)cell configureCellWithSkillPointItem:(DSTableSkillPointSettingCellItem *)model];
            break;
    }
     
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (skillType) {
        case DSSkillTypeJbo:
        case DSSkillTypeWeapon1:
        case DSSkillTypeWeapon2:
        case DSSkillTypeWeapon3:
        case DSSkillTypeWeapon4:
            //Todo something at here.
            break;
    }
    
    //职业名称  特技类型  特技点数  剩余点数
    DSGlobalJobInfo *jobInfo = [[DSGlobalJobInfo alloc] init];
    jobInfo = appDelegate.gJobInfo[_jobName];
    DSTableSkillPointSettingCellItem *model = [self getSelectSkillPointItemInfo:indexPath];
    NSInteger needPoint = [model.skillPoint intValue];
    if (jobInfo.unusePoint >= needPoint)
    {
        NSString *skillTypeStr = [self getSelectSkillType];
        //这里有个奇怪的BUG，求指导，哪位大侠看到了，解决方案请发送以下邮箱：
        //hsw625728@163.com
        //感激不尽
        //--崩溃代码--
        //[jobInfo.skillPointSetting setObject:model.skillPoint forKey:skillTypeStr];
        //--以下是一个笨的解决方案
        NSMutableDictionary *temp = [[NSMutableDictionary alloc] initWithDictionary:jobInfo.skillPointSetting];
        [temp setObject:model.skillPoint forKey:skillTypeStr];
        jobInfo.skillPointSetting = temp;
        //----------------------
        [jobInfo updateSkillPoint];
        
        [appDelegate.gJobInfo setObject:jobInfo.skillPointSetting forKey:skillTypeStr];
        
        NSString *docPath =  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        NSString *path = [docPath stringByAppendingPathComponent:@"globalJobInfo"];
        [NSKeyedArchiver archiveRootObject:appDelegate.gJobInfo toFile:path];
    }
    else{
        //这里需要提示框：技能点数不足！
    }
    
    NSString *titleStr = [[NSString alloc] initWithFormat:@"%i/%i", (int)jobInfo.unusePoint, (int)jobInfo.totelPoint];
    self.navigationItem.title = titleStr;
}

-(NSString*)getSelectSkillType{
    NSString *skillTypeName = [[NSString alloc] init];
    DSGlobalJobInfo *jobInfo = appDelegate.gJobInfo[_jobName];
    switch(skillType)
    {
        case DSSkillTypeJbo:
            skillTypeName = jobInfo.skillJob;
            break;
        case DSSkillTypeWeapon1:
            skillTypeName = jobInfo.skillWeapon1;
            break;
        case DSSkillTypeWeapon2:
            skillTypeName = jobInfo.skillWeapon2;
            break;
        case DSSkillTypeWeapon3:
            skillTypeName = jobInfo.skillWeapon3;
            break;
        case DSSkillTypeWeapon4:
            skillTypeName = jobInfo.skillWeapon4;
            break;
        default:
            break;
    }
    return skillTypeName;
}
-(DSTableSkillPointSettingCellItem*)getSelectSkillPointItemInfo:(NSIndexPath *)indexPath {
    NSString *skillTypeName = [[NSString alloc] init];
    skillTypeName = [self getSelectSkillType];
    
    int index = 0;
    for (;index < appDelegate.gSkillInfo.skillName.count; index++)
    {
        NSString *type = appDelegate.gSkillInfo.typeName[index];
        if ([type isEqualToString:skillTypeName])
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

@end
