//
//  DSTableJobLevelCell.h
//  dqxSkillSmltr
//
//  Created by HANSHAOWEN on 16/12/12.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#ifndef DSTableJobLevelCell_h
#define DSTableJobLevelCell_h

#import "DSBaseCell.h"

FOUNDATION_EXPORT NSString *const kDSTableJobLevelCellID;

@class DSTableJobLevelCellItem;

@interface DSTableJobLevelCell : DSBaseCell

+ (CGFloat)cellHeight;

- (void)configureCellWithJobLevelItem:(DSTableJobLevelCellItem *)item;
- (NSInteger)getLevel;

@end

#endif /* SDTableJobLevelCell_h */
