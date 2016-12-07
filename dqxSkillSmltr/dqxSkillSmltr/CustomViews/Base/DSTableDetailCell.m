//
//  DSTableDetailCell.m
//  dqxSkillSmltr
//
//  Created by HANSHAOWEN on 16/12/7.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSTableDetailCell.h"
#import "DSSkillDetailItem.h"
#import "View+MASAdditions.h"

NSString *const kDSTableDetailCellID = @"kDSTableDetailCellID";

@interface DSTableDetailCell ()

@property (strong, nonatomic) UIImageView *coverView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *contentLabel;

@end

@implementation DSTableDetailCell

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
    
    _coverView = ({
        UIImageView *imageView = [UIImageView new];
        imageView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.sizeOffset(CGSizeMake(48, 48));
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(8);
        }];
        
        imageView;
    });
    
    _titleLabel = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(13);
        label.textColor = DSLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_coverView);
            make.left.equalTo(_coverView.mas_right).offset(8);
            make.right.equalTo(self.contentView);
        }];
        
        label;
    });
    
    _contentLabel = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(13);
        label.textColor = DSLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(_titleLabel);
            make.bottom.equalTo(_coverView);
        }];
        
        label;
    });
}

#pragma mark - Public Method

- (void)configureCellWithSearchItem:(DSSkillDetailItem *)item {
    //[_coverView mlb_sd_setImageWithURL:@"section2"/*item.iconName*/ placeholderImageName:@"section1"];
    _coverView.image = [UIImage imageNamed:item.iconName];
    _titleLabel.text = item.itemName;
    _contentLabel.text = item.itemMemo;
}

@end
