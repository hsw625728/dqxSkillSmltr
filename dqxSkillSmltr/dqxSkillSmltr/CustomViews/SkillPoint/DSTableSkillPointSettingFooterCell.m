//
//  DSTableSkillPointSettingFooterCell.m
//  dqxSkillSmltr
//
//  Created by HANSHAOWEN on 16/12/15.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSTableSkillPointSettingFooterCell.h"
#import "DSSkillPointSettingViewController.h"
#import "View+MASAdditions.h"

NSString *const kDSTableSkillPointSettingFooterCellID = @"DSTableSkillPointSettingFooterCellID";

@implementation DSTableSkillPointSettingFooterCell{
    DSSkillPointSettingViewController *father;
}

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
    
    self.contentView.backgroundColor = [UIColor colorWithRed:252 / 255.0 green:253 / 255.0 blue:254 / 255.0 alpha:1];// #FCFDFE
    CGFloat contentViewWidth = CGRectGetWidth([UIScreen mainScreen ].applicationFrame);
    CGFloat lableWidth = (contentViewWidth - 16)/5;
    
#define POINT_SETTING_FOOTER_LABEL UILabel *label = [UILabel new];\
    label.textColor = [UIColor colorWithWhite:50 / 255.0 alpha:1];\
    label.font = FontWithSize(10);\
    label.text = @"";\
    [self.contentView addSubview:label]
    
    UILabel  *label1 = ({
        POINT_SETTING_FOOTER_LABEL;
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(8+lableWidth*0);
            make.top.equalTo(self.contentView).offset(1);
        }];
        
        label;
    });
    
    UILabel *label2 = ({
        POINT_SETTING_FOOTER_LABEL;
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(8+lableWidth*0);
            make.bottom.equalTo(self.contentView).offset(-1);
        }];
        
        label;
    });
    
    UILabel  *label3 = ({
        POINT_SETTING_FOOTER_LABEL;
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(8+lableWidth*1);
            make.top.equalTo(self.contentView).offset(1);
        }];
        
        label;
    });
    
    UILabel  *label4 = ({
        POINT_SETTING_FOOTER_LABEL;
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(8+lableWidth*1);
            make.bottom.equalTo(self.contentView).offset(-1);
        }];
        
        label;
    });
    
    UILabel  *label5 = ({
        POINT_SETTING_FOOTER_LABEL;
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(8+lableWidth*2);
            make.top.equalTo(self.contentView).offset(1);
        }];
        
        label;
    });
    
    UILabel  *label6 = ({
        POINT_SETTING_FOOTER_LABEL;
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(8+lableWidth*2);
            make.bottom.equalTo(self.contentView).offset(-1);
        }];
        
        label;
    });
    
    UILabel  *label7 = ({
        POINT_SETTING_FOOTER_LABEL;
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(8+lableWidth*3);
            make.top.equalTo(self.contentView).offset(1);
        }];
        
        label;
    });
    
    UILabel  *label8 = ({
        POINT_SETTING_FOOTER_LABEL;
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(8+lableWidth*3);
            make.bottom.equalTo(self.contentView).offset(-1);
        }];
        
        label;
    });
    
    UILabel  *label9 = ({
        POINT_SETTING_FOOTER_LABEL;
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(8+lableWidth*4);
            make.top.equalTo(self.contentView).offset(1);
        }];
        
        label;
    });
    
    UILabel  *label10 = ({
        POINT_SETTING_FOOTER_LABEL;
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(8+lableWidth*4);
            make.bottom.equalTo(self.contentView).offset(-1);
        }];
        
        label;
    });
    _labelArray = [[NSArray alloc] initWithObjects:label1, label2, label3, label4, label5, label6, label7, label8, label9, label10, nil];
    
    _step = ({
        UIStepper *stepper = [[UIStepper alloc] init];
        stepper.minimumValue = 0;
        stepper.stepValue = 1;
        [self.contentView addSubview:stepper];
        [stepper addTarget:father action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
        [stepper mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.right.equalTo(self.contentView).offset(-8);
        }];
        stepper;
    });
}

-(void)setFather:(DSSkillPointSettingViewController*)f{
    father = f;
}

@end
