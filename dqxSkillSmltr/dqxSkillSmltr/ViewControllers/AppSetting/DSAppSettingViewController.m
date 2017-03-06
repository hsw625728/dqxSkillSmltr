//
//  DSSkillHistoryViewController.m
//  dqxSkillSmltr
//
//  Created by HANSHAOWEN on 16/12/7.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "View+MASAdditions.h"
#import "UIImage+Common.h"
#import "DSAppSettingViewController.h"
#import "DSTableAppSettingCell.h"
#import "DSTableHeaderView.h"
#import "AppHelpViewController.h"
//#import "GoogleMobileAds/GoogleMobileAds.h"
//Tencent
#import "GDTMobBannerView.h" //导入GDTMobBannerView.h头文件


@interface DSAppSettingViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) DSTableHeaderView *headerView;
//@property (strong, nonatomic) GADNativeExpressAdView  *expressView;
//Tencent
@property (strong, nonatomic) GDTMobBannerView *bannerView;//声明一个GDTMobBannerView的实例

@end

@implementation DSAppSettingViewController {
    NSArray *sectionTitles;
    NSArray *rowTitles;
    NSArray *rowImageNames;
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
    //self.hideNavigationBar = YES;
    //self.automaticallyAdjustsScrollViewInsets = NO;
    //self.edgesForExtendedLayout = UIRectEdgeAll;
    
    self.navigationItem.title = DSAppSetting;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    [self initDatas];
    [self setupViews];
    
    //设置界面最下方常驻的Google广告
    /*
    NSMutableArray *history;
    NSString *docPath =  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [docPath stringByAppendingPathComponent:@"RecipeHistory"];
    
    history = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if (ISNULL(history))
        history = [[NSMutableArray alloc] init];
    
    _expressView = [[GADNativeExpressAdView alloc] initWithFrame:CGRectMake(0.0,
                                                                            self.view.frame.size.height -
                                                                            150,
                                                                            self.view.frame.size.width,
                                                                            150)];
    //NSLog(@"Google Mobile Ads SDK version: %@", [GADRequest sdkVersion]);
    //中等高度原生广告位
    _expressView.adUnitID = @"ca-app-pub-9308902363520222/9808399397";
    //Google AdMob提供的测试广告ID
    //_expressView.adUnitID = @"ca-app-pub-3940256099942544/2934735716";
    
    _expressView.rootViewController = self;
    GADRequest *request = [GADRequest request];
    //request.testDevices = @[ @"66fc40441247f9df253bbcaa32f528bb" ];
    [_expressView loadRequest:request];
    
    [self.view addSubview:_expressView];
    [_expressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(self.view.frame.size.width));
        make.height.equalTo(@150);
        make.bottom.left.equalTo(self.view);
    }];
     */
    //Tencent 5 号广告位
    /*
    _bannerView = [[GDTMobBannerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height -
                                                                     GDTMOB_AD_SUGGEST_SIZE_320x50.height, self.view.frame.size.width, GDTMOB_AD_SUGGEST_SIZE_320x50.height) appkey:@"1105827469" placementId:@"6090411729601381"];
    _bannerView.delegate = self; // 设置Delegate
    _bannerView.currentViewController = self; //设置当前的ViewController
    _bannerView.interval = 30; //【可选】设置广告轮播时间;范围为30~120秒,0表示不轮 播
    _bannerView.isGpsOn = NO; //【可选】开启GPS定位;默认关闭
    _bannerView.showCloseBtn = NO; //【可选】展示关闭按钮;默认显示
    _bannerView.isAnimationOn = YES; //【可选】开启banner轮播和展现时的动画效果; 默认开启
    [self.view addSubview:_bannerView]; //添加到当前的view中
    [_bannerView loadAdAndShow];
    [_bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(self.view.frame.size.width));
        make.height.equalTo(@50);
        make.bottom.left.equalTo(self.view);
    }];
     */
}

#pragma mark - Private Method

- (void)initDatas {
    sectionTitles = @[@"软件相关", @"操作说明"];
    rowTitles = @[@[@"DQX相关工具", @"建议反馈邮箱：hsw625728@163.com"], @[@"主界面操作示例", @"等级设置界面操作示例", @"职业技能点洁面操作示例"]];
    rowImageNames = @[@[@"center_setting", @"tab_music_normal"], @[@"tab_movie_normal", @"tab_movie_normal", @"tab_movie_normal"]];
}

- (void)setupViews {
    //_headerView = [[DSTableHeaderView alloc] initWithUserType:MLBUserTypeMe];
    
    _tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.backgroundColor = DSViewControllerBGColor;
        tableView.dataSource = self;
        tableView.delegate = self;
        [tableView registerClass:[DSTableAppSettingCell class] forCellReuseIdentifier:kDSTableAppSettingCellID];
        [tableView registerClass:[DSTableHeaderView class] forHeaderFooterViewReuseIdentifier:kDSTableHeaderViewID];
        tableView.rowHeight = [DSTableAppSettingCell cellHeight];
        
        [self.view addSubview:tableView];
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        
        tableView;
    });
}

#pragma mark - Public Method



#pragma mark - Action



#pragma mark - Network Request



#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return sectionTitles.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *rows = rowTitles[section];
    return rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DSTableAppSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:kDSTableAppSettingCellID forIndexPath:indexPath];
    [cell configureCellWithTitle:rowTitles[indexPath.section][indexPath.row] imageName:rowImageNames[indexPath.section][indexPath.row] atIndexPath:indexPath];
    
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
    
    if (indexPath.section == 0)
    {
        switch (indexPath.row)
        {
            case 0:
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/us/app/zhi-ren-pei-fang-su-caifor-dqx/id1181736107?l=zh&ls=1&mt=8"]];
                break;
            default:
                break;
        }
    }
    else{
        DSAppHelpViewController *view = [[DSAppHelpViewController alloc] init];
        switch (indexPath.row) {
            case 0:
                [view setHelpImageName:@"help_main"];
                break;
            case 1:
                [view setHelpImageName:@"help_level"];
                break;
            case 2:
                [view setHelpImageName:@"help_point"];
                break;
            default:
                break;
        }
        [self.navigationController pushViewController:view animated:YES];
    }
    //
}

@end
