//
//  DSSkillDetailViewController.m
//  dqxSkillSmltr
//
//  Created by HANSHAOWEN on 16/12/7.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSSkillDetailViewController.h"
#import "UIImage+Common.h"
#import "DSSkillDetailItem.h"
#import "DSTableDetailCell.h"
#import "DSTableHeaderView.h"
#import "View+MASAdditions.h"

@interface DSSkillDetailViewController() <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation DSSkillDetailViewController{
    AppDelegate *appDelegate;
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
    appDelegate = [[UIApplication sharedApplication] delegate];
}

- (void)setupViews {
    _tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.backgroundColor = DSViewControllerBGColor;
        tableView.dataSource = self;
        tableView.delegate = self;
        
        [tableView registerClass:[DSTableHeaderView class] forHeaderFooterViewReuseIdentifier:kDSTableHeaderViewID];
        [tableView registerClass:[DSTableDetailCell class] forCellReuseIdentifier:kDSTableDetailCellID];

        tableView.rowHeight = [DSTableDetailCell cellHeight];
        
        
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
    return appDelegate.gSkillInfo.typeName.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *rows = appDelegate.gSkillInfo.skillName[section];
    return rows.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DSTableDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:kDSTableDetailCellID forIndexPath:indexPath];
    
    DSSkillDetailItem *model = [[DSSkillDetailItem alloc] init];
    model.itemName = appDelegate.gSkillInfo.skillName[indexPath.section][indexPath.row];
    model.iconName = [NSString stringWithFormat:@"Icon-%@", model.itemName];
    model.itemMemo = appDelegate.gSkillInfo.skillDesc[indexPath.section][indexPath.row];
    [(DSTableDetailCell *)cell configureCellWithSearchItem:(DSSkillDetailItem *)model];
    return cell;
}


#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [DSTableHeaderView viewHeight];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    DSTableHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kDSTableHeaderViewID];
    view.titleLabel.text = appDelegate.gSkillInfo.typeName[section];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
