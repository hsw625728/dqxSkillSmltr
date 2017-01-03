//
//  DSJobLevelSettingViewController.m
//  dqxSkillSmltr
//
//  Created by HANSHAOWEN on 16/12/12.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSJobLevelSettingViewController.h"
#import "DSTabBarController.h"
#import "UIImage+Common.h"
#import "DSTableJobLevelCell.h"
#import "DSTableJobLevelCellItem.h"
#import "DSTableHeaderView.h"
#import "View+MASAdditions.h"
//#import "GoogleMobileAds/GoogleMobileAds.h"
//Tencent
#import "GDTMobBannerView.h" //导入GDTMobBannerView.h头文件


@interface DSJobLevelSettingViewController() <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
//@property (strong, nonatomic) GADBannerView  *bannerView;
//Tencent
@property (strong, nonatomic) GDTMobBannerView *bannerView;//声明一个GDTMobBannerView的实例

@end

@implementation DSJobLevelSettingViewController{
    NSArray *sectionTitles;
    NSArray *rowImageNames;
}

#pragma mark - Lifecycle

- (void)dealloc {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = DSJobLevelSetting;
    
    [self setupViews];
    
    //设置导航栏
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    //self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:DSCancelStr style:UIBarButtonItemStylePlain target:self action:@selector(cancelSettingJobLevel)];
    //self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:DSSaveStr style:UIBarButtonItemStyleDone target:self action:@selector(saveSettingJobLevel)];
    
    [self initDatas];
    [self setupViews];
    
    
    //等级设定详情页最下方常驻的Google广告
    /*
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
    //3号横幅广告位
    self.bannerView.adUnitID = @"ca-app-pub-9308902363520222/3901466590";
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
     */
    //Tencent 3 号广告位
    _bannerView = [[GDTMobBannerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height -
                                                                     GDTMOB_AD_SUGGEST_SIZE_320x50.height, self.view.frame.size.width, GDTMOB_AD_SUGGEST_SIZE_320x50.height) appkey:@"1105827469" placementId:@"3000019749008219"];
    _bannerView.delegate = self; // 设置Delegate
    _bannerView.currentViewController = self; //设置当前的ViewController
    _bannerView.interval = 30; //【可选】设置广告轮播时间;范围为30~120秒,0表示不轮 播
    _bannerView.isGpsOn = NO; //【可选】开启GPS定位;默认关闭
    _bannerView.showCloseBtn = YES; //【可选】展示关闭按钮;默认显示
    _bannerView.isAnimationOn = YES; //【可选】开启banner轮播和展现时的动画效果; 默认开启
    [self.view addSubview:_bannerView]; //添加到当前的view中
    [_bannerView loadAdAndShow];
    [_bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(self.view.frame.size.width));
        make.height.equalTo(@50);
        make.bottom.left.equalTo(self.view);
    }];
}
#pragma mark - Private Method

- (void)initDatas {
    sectionTitles = JOB_TYPE_SECTION;
    rowImageNames = JOB_TYPE_NAME;
}

- (void)setupViews {
    _tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.backgroundColor = DSViewControllerBGColor;
        tableView.dataSource = self;
        tableView.delegate = self;
        
        [tableView registerClass:[DSTableHeaderView class] forHeaderFooterViewReuseIdentifier:kDSTableHeaderViewID];
        [tableView registerClass:[DSTableJobLevelCell class] forCellReuseIdentifier:kDSTableJobLevelCellID];
        
        tableView.rowHeight = [DSTableJobLevelCell cellHeight];
        
        
        [self.view addSubview:tableView];
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        
        tableView;
    });
}
#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //[(ParallaxHeaderView *)_tableView.tableHeaderView layoutHeaderViewForScrollViewOffset:scrollView.contentOffset];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return sectionTitles.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *rows = rowImageNames[section];
    return rows.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DSTableJobLevelCell *cell = [tableView dequeueReusableCellWithIdentifier:kDSTableJobLevelCellID forIndexPath:indexPath];
    
    DSTableJobLevelCellItem *model = [[DSTableJobLevelCellItem alloc] init];
    model.jobName = rowImageNames[indexPath.section][indexPath.row];//[NSString stringWithFormat:@"%@职业",rowImageNames[indexPath.section][indexPath.row]];
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    DSGlobalJobInfo *value = appDelegate.gJobInfo[model.jobName];
    model.level = value.level;
    
    [(DSTableJobLevelCell *)cell configureCellWithJobLevelItem:(DSTableJobLevelCellItem *)model];
    return cell;
}


#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [DSTableHeaderView viewHeight];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    DSTableHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kDSTableHeaderViewID];
    view.titleLabel.text = sectionTitles[section];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark UIselector
/*
- (void)cancelSettingJobLevel {
    [self.navigationController pushViewController:[[DSTabBarController alloc] init] animated:YES];
}

- (void)saveSettingJobLevel {
    //保存等级信息
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    //write file
    NSString *docPath =  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [docPath stringByAppendingPathComponent:@"globalJobInfo"];
    [NSKeyedArchiver archiveRootObject:appDelegate.gJobInfo toFile:path];
    
    [self.navigationController pushViewController:[[DSTabBarController alloc] init] animated:YES];
}
 */

@end
