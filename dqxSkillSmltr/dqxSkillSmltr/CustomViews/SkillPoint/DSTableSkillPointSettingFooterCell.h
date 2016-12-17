//
//  DSTableSkillPointSettingFooterCell.h
//  dqxSkillSmltr
//
//  Created by HANSHAOWEN on 16/12/15.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#ifndef DSTableSkillPointSettingFooterCell_h
#define DSTableSkillPointSettingFooterCell_h

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT NSString *const kDSTableSkillPointSettingFooterCellID;

@interface DSTableSkillPointSettingFooterCell : UITableViewHeaderFooterView

+ (CGFloat)viewHeight;

@property (strong, nonatomic) NSArray *labelArray;
@property (strong, nonatomic) UIStepper *step;
@property (strong, nonatomic) UILabel *label1;
@property (strong, nonatomic) UILabel *label2;
@property (strong, nonatomic) UILabel *label3;
@property (strong, nonatomic) UILabel *label4;
@property (strong, nonatomic) UILabel *label5;
@property (strong, nonatomic) UILabel *label6;
@property (strong, nonatomic) UILabel *label7;
@property (strong, nonatomic) UILabel *label8;
@property (strong, nonatomic) UILabel *label9;
@property (strong, nonatomic) UILabel *label10;

@end

#endif /* DSTableSkillPointSettingFooterCell_h */
