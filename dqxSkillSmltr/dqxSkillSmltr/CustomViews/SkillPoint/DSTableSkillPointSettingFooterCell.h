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

@property (strong, nonatomic) UILabel *firstLabel;
@property (strong, nonatomic) UILabel *secondLabel;

@end

#endif /* DSTableSkillPointSettingFooterCell_h */
