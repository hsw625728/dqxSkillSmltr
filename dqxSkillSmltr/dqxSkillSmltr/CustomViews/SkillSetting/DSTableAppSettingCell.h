//
//  DSTableAppSettingCell.h
//  dqxSkillSmltr
//
//  Created by SHAOWENn HAN on 16/12/17.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#ifndef DSTableAppSettingCell_h
#define DSTableAppSettingCell_h

#import "DSBaseCell.h"

FOUNDATION_EXPORT NSString *const kDSTableAppSettingCellID;

@interface DSTableAppSettingCell : DSBaseCell

+ (CGFloat)cellHeight;

- (void)configureCellWithTitle:(NSString *)title imageName:(NSString *)imageName atIndexPath:(NSIndexPath *)indexPath;
@end

#endif /* DSTableAppSettingCell_h */
