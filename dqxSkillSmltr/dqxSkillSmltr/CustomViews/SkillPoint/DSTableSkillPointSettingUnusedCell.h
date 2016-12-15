//
//  DSTableSkillPointSettingUnusedCell.h
//  dqxSkillSmltr
//
//  Created by HANSHAOWEN on 16/12/15.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#ifndef DSTableSkillPointSettingUnusedCell_h
#define DSTableSkillPointSettingUnusedCell_h

#import "DSBaseCell.h"

FOUNDATION_EXPORT NSString *const kDSTableSkillPointSettingUnusedCellID;

@class DSTableSkillPointSettingCellItem;

@interface DSTableSkillPointSettingUnusedCell : DSBaseCell

+ (CGFloat)cellHeight;

- (void)configureCellWithSkillPointItem:(DSTableSkillPointSettingCellItem *)item;

@end

#endif /* DSTableSkillPointSettingUnusedCell_h */
