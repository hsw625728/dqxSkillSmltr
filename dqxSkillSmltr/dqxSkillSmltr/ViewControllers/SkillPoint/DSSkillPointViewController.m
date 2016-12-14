//
//  DSSkillPointViewController.m
//  dqxSkillSmltr
//
//  Created by HANSHAOWEN on 16/12/7.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSSkillPointViewController.h"
#import "UIImage+Common.h"
#import "DSTableSkillPointCellItem.h"
#import "DSTableSkillPointCell.h"
#import "DSTableHeaderView.h"
#import "View+MASAdditions.h"
#import "DSJobLevelSettingViewController.h"
#import "DSSkillPointSettingViewController.h"


@interface DSSkillPointViewController() <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation DSSkillPointViewController{
    NSArray *sectionTitles;
    NSArray *rowSkillType;
    NSArray *rowJobNames;
    NSArray *rowPoint;
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
    
    self.navigationItem.title = DSSkillPoint;
    
    [self setupViews];
    
    //设置导航栏
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:DSJobLevelSetting style:UIBarButtonItemStylePlain target:self action:@selector(navtoSettingJobLevel)];
    
    [self initDatas];
    [self setupViews];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_tableView reloadData];
}
#pragma mark - Private Method

- (void)initDatas {
    sectionTitles = JOB_TYPE_SECTION;
    rowJobNames = JOB_TYPE_NAME;
    rowSkillType = JOB_SKILL_TYPE;
}

- (void)setupViews {
    _tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.backgroundColor = DSViewControllerBGColor;
        tableView.dataSource = self;
        tableView.delegate = self;
        
        [tableView registerClass:[DSTableHeaderView class] forHeaderFooterViewReuseIdentifier:kDSTableHeaderViewID];
        [tableView registerClass:[DSTableSkillPointCell class] forCellReuseIdentifier:kDSTableSkillPointCellID];
        
        tableView.rowHeight = [DSTableSkillPointCell cellHeight];
        
        
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
    NSArray *rows = rowJobNames[section];
    return rows.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DSTableSkillPointCell *cell = [tableView dequeueReusableCellWithIdentifier:kDSTableSkillPointCellID forIndexPath:indexPath];
    
    DSTableSkillPointCellItem *model = [[DSTableSkillPointCellItem alloc] init];
    model.jobName = rowJobNames[indexPath.section][indexPath.row];
    model.iconName = [NSString stringWithFormat:@"%@职业",rowJobNames[indexPath.section][indexPath.row]];
    model.skillType1 = rowSkillType[indexPath.row][0];
    model.skillType2 = rowSkillType[indexPath.row][1];
    model.skillType3 = rowSkillType[indexPath.row][2];
    model.skillType4 = rowSkillType[indexPath.row][3];
    model.skillType5 = rowSkillType[indexPath.row][4];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    DSGlobalJobInfo *jobInfo = appDelegate.gJobInfo[model.jobName];
    model.skillPoint1 = jobInfo.skillPointSetting[model.skillType1];
    model.skillPoint2 = jobInfo.skillPointSetting[model.skillType2];
    model.skillPoint3 = jobInfo.skillPointSetting[model.skillType3];
    model.skillPoint4 = jobInfo.skillPointSetting[model.skillType4];
    model.skillPoint5 = jobInfo.skillPointSetting[model.skillType5];
    
    [(DSTableSkillPointCell *)cell configureCellWithSearchItem:(DSTableSkillPointCellItem *)model];
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
    
    NSString *jobNameSelect = rowJobNames[indexPath.section][indexPath.row];
    DSSkillPointSettingViewController *jlView = [[DSSkillPointSettingViewController alloc] init];
    [jlView setJobForPointSetting:jobNameSelect];
    [self.navigationController pushViewController:jlView animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark UIselecter

- (void)navtoSettingJobLevel {
    [self.navigationController pushViewController:[[DSJobLevelSettingViewController alloc] init] animated:YES];
}

@end
