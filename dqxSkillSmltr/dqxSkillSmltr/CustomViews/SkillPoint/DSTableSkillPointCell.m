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
    return 64;
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
    
    self.accessoryType = UITableViewCellAccessoryNone;
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    CGFloat contentViewWidth = CGRectGetWidth(self.frame);
    CGFloat lableX = DSTableIconWidth + 8*2;
    CGFloat lableWidth = (contentViewWidth - lableX)/5;
    
    _coverView = ({
        UIImageView *imageView = [UIImageView new];
        imageView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.sizeOffset(CGSizeMake(DSTableIconWidth, DSTableIconWidth));
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(8);
        }];
        
        imageView;
    });
    
    _labelSkillType1 = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(13);
        label.textColor = DSLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_coverView);
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
            make.top.equalTo(_coverView);
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
            make.top.equalTo(_coverView);
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
            make.top.equalTo(_coverView);
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
            make.top.equalTo(_coverView);
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
}

#pragma mark - Public Method

- (void)configureCellWithSearchItem:(DSTableSkillPointCellItem *)item {
    //[_coverView mlb_sd_setImageWithURL:@"section2"/*item.iconName*/ placeholderImageName:@"section1"];
    _coverView.image = [UIImage imageNamed:item.iconName];
    _titleLabel.text = item.itemName;
    _contentLabel.text = item.itemMemo;
}

@end