//
//  DSTableSkillPointSettingCell.m
//  dqxSkillSmltr
//
//  Created by HANSHAOWEN on 16/12/12.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSTableSkillPointSettingCell.h"
#import "DSTableSkillPointCellItem.h"
#import "View+MASAdditions.h"

NSString *const kDSTableSkillPointSettingCellID = @"kDSTableSkillPointSettingCellID";

@interface DSTableSkillPointSettingCell ()

@property (strong, nonatomic) UILabel *labelSkillPoint;
@property (strong, nonatomic) UILabel *labelSkillTitle;
@property (strong, nonatomic) UILabel *labelSkillDesc;

@end

@implementation DSTableSkillPointSettingCell

#pragma mark - Class Method

+ (CGFloat)cellHeight {
    return 48;
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
    const int ICON_WIDE = 88;
    const int ICON_HEIGH = 29;
    self.accessoryType = UITableViewCellAccessoryNone;
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    CGFloat contentViewWidth = CGRectGetWidth([UIScreen mainScreen ].applicationFrame);
    CGFloat lableX = ICON_WIDE + 8*2;
    CGFloat lableWidth = (contentViewWidth - lableX)/5;
    
    _labelSkillPoint = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(26);
        label.textColor = DSLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.sizeOffset(CGSizeMake(ICON_WIDE, ICON_HEIGH));
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(8);
        }];
        
        label;
    });
    
    /*
    _labelSkillTitle = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(13);
        label.textColor = DSLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_labelSkillPoint);
            make.left.equalTo(self.contentView).offset(lableX);
            make.right.equalTo(self.contentView).offset(lableX+lableWidth);
        }];
        
        label;
    });
     */
    
    _labelSkillDesc = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(13);
        label.textColor = DSLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_labelSkillPoint);
            make.left.equalTo(self.contentView).offset(lableX+lableWidth);
            make.right.equalTo(self.contentView).offset(lableX+lableWidth*2);
        }];
        
        label;
    });
    
}

#pragma mark - Public Method

- (void)configureCellWithSkillPointItem:(DSTableSkillPointCellItem *)item {
    //_coverView.image = [UIImage imageNamed:item.iconName];
    
}

@end
