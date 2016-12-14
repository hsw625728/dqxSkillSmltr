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


@interface DSJobLevelSettingViewController() <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

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
