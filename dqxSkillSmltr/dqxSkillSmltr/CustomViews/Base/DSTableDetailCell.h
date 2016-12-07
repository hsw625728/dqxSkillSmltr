//
//  DSTableDetailCell.h
//  dqxSkillSmltr
//
//  Created by HANSHAOWEN on 16/12/7.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#ifndef DSTableDetailCell_h
#define DSTableDetailCell_h
#import "DSBaseCell.h"

FOUNDATION_EXPORT NSString *const kDSTableDetailCellID;

@class DSSkillDetailItem;

@interface DSTableDetailCell : DSBaseCell

+ (CGFloat)cellHeight;

- (void)configureCellWithSearchItem:(DSSkillDetailItem *)item;


@end

#endif /* DSTableDetailCell_h */
