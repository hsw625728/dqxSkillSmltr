//
//  DSTableSkillPointSettingCell.h
//  dqxSkillSmltr
//
//  Created by HANSHAOWEN on 16/12/12.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#ifndef DSTableSkillPointSettingCell_h
#define DSTableSkillPointSettingCell_h

#import "DSBaseCell.h"

FOUNDATION_EXPORT NSString *const kDSTableSkillPointSettingCellID;

@class DSTableSkillPointSettingCellItem;

@interface DSTableSkillPointSettingCell : DSBaseCell

+ (CGFloat)cellHeight;

- (void)configureCellWithSkillPointItem:(DSTableSkillPointSettingCellItem *)item;

@end

#endif /* DSTableSkillPointSettingCell_h */
