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


@interface DSSkillPointViewController() <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation DSSkillPointViewController{
    NSArray *sectionTitles;
    NSArray *rowJob;
    NSArray *rowImageNames;
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
    
    self.navigationItem.title = DSSkillDetail;
    
    [self setupViews];
    
    //设置导航栏
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    [self initDatas];
    [self setupViews];
}
#pragma mark - Private Method

- (void)initDatas {
    sectionTitles = JOB_TYPE_SECTION;
    rowImageNames = JOB_TYPE_NAME;
    rowJob = JOB_SKILL_TYPE;
    rowPoint = JOB_SKILL_POINT;
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
    NSArray *rows = rowImageNames[section];
    return rows.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DSTableSkillPointCell *cell = [tableView dequeueReusableCellWithIdentifier:kDSTableSkillPointCellID forIndexPath:indexPath];
    
    DSTableSkillPointCellItem *model = [[DSTableSkillPointCellItem alloc] init];
    model.jobName = rowImageNames[indexPath.section][indexPath.row];
    model.iconName = rowImageNames[indexPath.section][indexPath.row];
    model.skillType1 = rowJob[indexPath.row][0];
    model.skillType2 = rowJob[indexPath.row][1];
    model.skillType3 = rowJob[indexPath.row][2];
    model.skillType4 = rowJob[indexPath.row][3];
    model.skillType5 = rowJob[indexPath.row][4];
    model.skillPoint1 = rowPoint[indexPath.row][0];
    model.skillPoint2 = rowPoint[indexPath.row][1];
    model.skillPoint3 = rowPoint[indexPath.row][2];
    model.skillPoint4 = rowPoint[indexPath.row][3];
    model.skillPoint5 = rowPoint[indexPath.row][4];
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
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
