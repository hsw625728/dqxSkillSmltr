//
//  DSTableSkillPointSettingFooterCell.m
//  dqxSkillSmltr
//
//  Created by HANSHAOWEN on 16/12/15.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSTableSkillPointSettingFooterCell.h"
#import "View+MASAdditions.h"

NSString *const kDSTableSkillPointSettingFooterCellID = @"DSTableSkillPointSettingFooterCellID";

@implementation DSTableSkillPointSettingFooterCell

+ (CGFloat)viewHeight {
    return 36;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setupViews];
    }
    
    return self;
}

- (void)setupViews {
    if (_firstLabel && _secondLabel) {
        return;
    }
    
    self.contentView.backgroundColor = [UIColor colorWithRed:252 / 255.0 green:253 / 255.0 blue:254 / 255.0 alpha:1];// #FCFDFE
    //CGFloat contentViewWidth = CGRectGetWidth([UIScreen mainScreen ].applicationFrame);
    //CGFloat lableWidth = (contentViewWidth)/5;
    
    _firstLabel = ({
        UILabel *label = [UILabel new];
        label.textColor = [UIColor colorWithWhite:127 / 255.0 alpha:1];// #7F7F7F
        label.font = FontWithSize(11);
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 15, 0, 0));
        }];
        
        label;
    });
    
    _secondLabel = ({
        UILabel *label = [UILabel new];
        label.textColor = [UIColor colorWithWhite:127 / 255.0 alpha:1];// #7F7F7F
        label.font = FontWithSize(11);
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 15, 0, 0));
            make.top.equalTo(_firstLabel.mas_bottom);
        }];
        
        label;
    });
}

@end
