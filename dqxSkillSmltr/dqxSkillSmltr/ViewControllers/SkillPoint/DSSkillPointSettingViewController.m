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
#import "DSTableSkillPointCellItem.h"
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
    UIImageView *titleImage = [[UIImageView alloc] init];
    titleImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@职业", _jobName]];
    self.navigationItem.titleView = titleImage;
    
    _segmentedControl = ({
        AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        DSGlobalJobInfo *jobInfo = appDelegate.gJobInfo[_jobName];
        NSArray *keys = [jobInfo.skillPoint allKeys];
        
        DZNSegmentedControl *segmentedControl = [[DZNSegmentedControl alloc] initWithItems:keys];
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

/*
- (NSArray *)dataByCurrentSearchType {
    NSArray *datas = dataSource[[@(searchType) stringValue]];
    return datas;
}
 */

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
}

#pragma mark - Network Request
/*
- (void)searching {
    [_activityIndicatorView startAnimating];
    
    [MLBHTTPRequester searchWithType:[MLBHTTPRequester apiStringForSearchWithSearchType:searchType] keywords:_searchBar.text success:^(id responseObject) {
        [self processWithResponseObject:responseObject];
    } fail:^(NSError *error) {
        [self showHUDServerError];
    }];
}

- (void)processWithResponseObject:(id)responseObject {
    if ([responseObject[@"res"] integerValue] == 0) {
        NSError *error;
        NSArray *results;
        NSArray *data = responseObject[@"data"];
        
        switch (searchType) {
            case MLBSearchTypeHome: {
                results = [MTLJSONAdapter modelsOfClass:[MLBHomeItem class] fromJSONArray:data error:&error];
                break;
            }
            case MLBSearchTypeRead: {
                results = [MTLJSONAdapter modelsOfClass:[MLBSearchRead class] fromJSONArray:data error:&error];
                break;
            }
            case MLBSearchTypeMusic: {
                results = [MTLJSONAdapter modelsOfClass:[MLBRelatedMusic class] fromJSONArray:data error:&error];
                break;
            }
            case MLBSearchTypeMovie: {
                results = [MTLJSONAdapter modelsOfClass:[MLBMovieListItem class] fromJSONArray:data error:&error];
                break;
            }
            case MLBSearchTypeAuthor: {
                results = [MTLJSONAdapter modelsOfClass:[MLBUser class] fromJSONArray:data error:&error];
                break;
            }
        }
        
        if (!error) {
            if (results) {
                [dataSource setObject:results forKey:[@(searchType) stringValue]];
                
                _segmentedControl.hidden = NO;
                _tableView.hidden = NO;
                _hintView.hidden = YES;
                
                [_tableView reloadData];
            } else {
                _hintView.hidden = NO;
            }
            
            [_activityIndicatorView stopAnimating];
        } else {
            [self modelTransformFailedWithError:error];
        }
    }
}
*/
#pragma mark - DZNEmptyDataSetSource

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"search_null_image"];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return [self dataByCurrentSearchType].count;
    return 8;
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
    DSTableSkillPointCellItem *model = [[DSTableSkillPointCellItem alloc] init];//[self dataByCurrentSearchType][indexPath.row];
    
    
    switch (skillType) {
        case DSSkillTypeJbo:
        case DSSkillTypeWeapon1:
        case DSSkillTypeWeapon2:
        case DSSkillTypeWeapon3:
        case DSSkillTypeWeapon4:
            [(DSTableSkillPointSettingCell *)cell configureCellWithSkillPointItem:(DSTableSkillPointCellItem *)model];
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
    
}

-(void)setJobForPointSetting:(NSString*)job{
    _jobName = job;
}

@end
