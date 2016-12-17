//
//  DSTableSkillPointCell.m
//  dqxSkillSmltr
//
//  Created by HANSHAOWEN on 16/12/7.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSTableSkillPointCell.h"
#import "DSTableSkillPointCellItem.h"
#import "View+MASAdditions.h"

NSString *const kDSTableSkillPointCellID = @"kDSTableSkillPointCellID";

@interface DSTableSkillPointCell ()

@property (strong, nonatomic) UIImageView *coverView;
@property (strong, nonatomic) UILabel *labelLevel;
@property (strong, nonatomic) UILabel *labelSkillType1;
@property (strong, nonatomic) UILabel *labelSkillType2;
@property (strong, nonatomic) UILabel *labelSkillType3;
@property (strong, nonatomic) UILabel *labelSkillType4;
@property (strong, nonatomic) UILabel *labelSkillType5;
@property (strong, nonatomic) UILabel *labelSkillPoint1;
@property (strong, nonatomic) UILabel *labelSkillPoint2;
@property (strong, nonatomic) UILabel *labelSkillPoint3;
@property (strong, nonatomic) UILabel *labelSkillPoint4;
@property (strong, nonatomic) UILabel *labelSkillPoint5;

@end

@implementation DSTableSkillPointCell

#pragma mark - Class Method

+ (CGFloat)cellHeight {
    //这里根据屏幕尺寸来设置高度
    return 38;
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
    _coverView.image = nil;
}

#pragma mark - Private Method

- (void)setupViews {
    if (_coverView) {
        return;
    }
    const int ICON_WIDE = 88;
    const int ICON_HEIGH = 29;
    self.accessoryType = UITableViewCellAccessoryNone;
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    CGFloat contentViewWidth = CGRectGetWidth([UIScreen mainScreen ].applicationFrame);
    CGFloat lableX = ICON_WIDE + 8*2;
    CGFloat lableWidth = (contentViewWidth - lableX)/5;
    
    _coverView = ({
        UIImageView *imageView = [UIImageView new];
        imageView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.sizeOffset(CGSizeMake(ICON_WIDE, ICON_HEIGH));
            make.centerY.equalTo(self.contentView).offset(2);
            make.left.equalTo(self.contentView).offset(8);
        }];
        
        imageView;
    });
    
    _labelLevel = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(8);
        label.textColor = DSLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(1);
            make.left.equalTo(self.contentView).offset(0.5*ICON_WIDE);
            make.right.equalTo(self.contentView).offset(ICON_WIDE);
        }];
        
        label;
    });
#define LABEL_SKILL_TYPE_TOP_SET make.top.equalTo(self.contentView).offset(6)
    _labelSkillType1 = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(13);
        label.textColor = DSLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            LABEL_SKILL_TYPE_TOP_SET;
            make.left.equalTo(self.contentView).offset(lableX);
            make.right.equalTo(self.contentView).offset(lableX+lableWidth);
        }];
        
        label;
    });
    
    _labelSkillType2 = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(13);
        label.textColor = DSLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            LABEL_SKILL_TYPE_TOP_SET;
            make.left.equalTo(self.contentView).offset(lableX+lableWidth);
            make.right.equalTo(self.contentView).offset(lableX+lableWidth*2);
        }];
        
        label;
    });
    
    _labelSkillType3 = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(13);
        label.textColor = DSLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            LABEL_SKILL_TYPE_TOP_SET;
            make.left.equalTo(self.contentView).offset(lableX+lableWidth*2);
            make.right.equalTo(self.contentView).offset(lableX+lableWidth*3);
        }];
        
        label;
    });
    
    _labelSkillType4 = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(13);
        label.textColor = DSLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            LABEL_SKILL_TYPE_TOP_SET;
            make.left.equalTo(self.contentView).offset(lableX+lableWidth*3);
            make.right.equalTo(self.contentView).offset(lableX+lableWidth*4);
        }];
        
        label;
    });
    
    _labelSkillType5 = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(13);
        label.textColor = DSLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            LABEL_SKILL_TYPE_TOP_SET;
            make.left.equalTo(self.contentView).offset(lableX+lableWidth*4);
            make.right.equalTo(self.contentView);
        }];
        
        label;
    });
    
    _labelSkillPoint1 = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(13);
        label.textColor = DSLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(_labelSkillType1);
            make.bottom.equalTo(_coverView);
        }];
        
        label;
    });
    
    _labelSkillPoint2 = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(13);
        label.textColor = DSLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(_labelSkillType2);
            make.bottom.equalTo(_coverView);
        }];
        
        label;
    });
    
    _labelSkillPoint3 = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(13);
        label.textColor = DSLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(_labelSkillType3);
            make.bottom.equalTo(_coverView);
        }];
        
        label;
    });
    
    _labelSkillPoint4 = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(13);
        label.textColor = DSLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(_labelSkillType4);
            make.bottom.equalTo(_coverView);
        }];
        
        label;
    });
    
    _labelSkillPoint5 = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(13);
        label.textColor = DSLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(_labelSkillType5);
            make.bottom.equalTo(_coverView);
        }];
        
        label;
    });
    
    UIImageView *forwardView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"forward_info"]];
    [self.contentView addSubview:forwardView];
    [forwardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.sizeOffset(CGSizeMake(6, 10));
        make.centerY.equalTo(self.contentView);
        //make.left.greaterThanOrEqualTo(_titleLabel.mas_right).offset(8);
        make.right.equalTo(self.contentView).offset(-8);
    }];
}

#pragma mark - Public Method

- (void)configureCellWithSearchItem:(DSTableSkillPointCellItem *)item {
    _coverView.image = [UIImage imageNamed:item.iconName];
    _labelLevel.text = [NSString stringWithFormat:@"等级:%@", item.level];
    _labelSkillType1.text = item.skillType1;
    _labelSkillType2.text = item.skillType2;
    _labelSkillType3.text = item.skillType3;
    _labelSkillType4.text = item.skillType4;
    _labelSkillType5.text = item.skillType5;
    _labelSkillPoint1.text = item.skillPoint1;
    _labelSkillPoint2.text = item.skillPoint2;
    _labelSkillPoint3.text = item.skillPoint3;
    _labelSkillPoint4.text = item.skillPoint4;
    _labelSkillPoint5.text = item.skillPoint5;
}

@end
