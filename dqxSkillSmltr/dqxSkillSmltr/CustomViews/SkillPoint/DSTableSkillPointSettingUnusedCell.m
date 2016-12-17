//
//  DSTableSkillPointSettingUnusedCell.m
//  dqxSkillSmltr
//
//  Created by HANSHAOWEN on 16/12/15.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSTableSkillPointSettingUnusedCell.h"
#import "DSTableSkillPointSettingCellItem.h"
#import "View+MASAdditions.h"

NSString *const kDSTableSkillPointSettingUnusedCellID = @"kDSTableSkillPointSettingUnusedCellID";

@interface DSTableSkillPointSettingUnusedCell ()

@property (strong, nonatomic) UILabel *labelSkillPoint;
@property (strong, nonatomic) UILabel *labelSkillTitle;
@property (strong, nonatomic) UILabel *labelSkillDesc;

@end

@implementation DSTableSkillPointSettingUnusedCell

#pragma mark - Class Method

+ (CGFloat)cellHeight {
    return 39;
}

#pragma mark - View Lifecycle

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setupViews];
    }
    
    return self;
}

- (void)prepareForReuse {
    [super prepareForReuse];
}

#pragma mark - Private Method

- (void)setupViews {
    const int ICON_WIDE = 38;
    const int ICON_HEIGH = 38;
    self.accessoryType = UITableViewCellAccessoryNone;
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    //CGFloat contentViewWidth = CGRectGetWidth([UIScreen mainScreen ].applicationFrame);
    //CGFloat lableX = ICON_WIDE + 8*2;
    
    _labelSkillPoint = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(26);
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = DSGrayTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.sizeOffset(CGSizeMake(ICON_WIDE+8, ICON_HEIGH));
            make.top.equalTo(self.contentView).offset(1);
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(8);
        }];
        
        label;
    });
    
    
    _labelSkillTitle = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(13);
        label.textColor = DSGrayTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(1);
            make.left.equalTo(self.contentView).offset(ICON_WIDE + 16);
            //make.right.equalTo(self.contentView).offset();
        }];
        
        label;
    });
    
    
    _labelSkillDesc = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(9);
        label.textColor = DSGrayTextColor;
        label.numberOfLines = 2;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(ICON_HEIGH/2 - 2);
            make.left.equalTo(self.contentView).offset(ICON_WIDE + 16);
            make.right.equalTo(self.contentView).offset(-8);
        }];
        
        label;
    });
}

#pragma mark - Public Method

- (void)configureCellWithSkillPointItem:(DSTableSkillPointSettingCellItem *)item {
    _labelSkillTitle.text = item.skillName;
    _labelSkillPoint.text = item.skillPoint;
    _labelSkillDesc.text = item.skillDesc;
}

@end
