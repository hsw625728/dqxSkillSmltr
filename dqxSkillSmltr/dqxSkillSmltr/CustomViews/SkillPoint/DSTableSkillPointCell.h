//
//  DSTableSkillPointCell.h
//  dqxSkillSmltr
//
//  Created by HANSHAOWEN on 16/12/7.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#ifndef DSTableSkillPointCell_h
#define DSTableSkillPointCell_h

#import "DSBaseCell.h"

FOUNDATION_EXPORT NSString *const kDSTableSkillPointCellID;

@class DSTableSkillPointCellItem;

@interface DSTableSkillPointCell : DSBaseCell

+ (CGFloat)cellHeight;

- (void)configureCellWithSearchItem:(DSTableSkillPointCellItem *)item;

@end

#endif /* DSTableSkillPointCell_h */
