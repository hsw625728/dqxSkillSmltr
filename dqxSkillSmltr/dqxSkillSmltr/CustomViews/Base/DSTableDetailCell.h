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

@interface DSTableDetailCell : DSBaseCell

+ (CGFloat)cellHeight;

- (void)set:(NSString*)name iconName:(NSString*)icon neceNum:(NSString*)nec;

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *neceNumLabel;
@property (strong, nonatomic) IBOutlet UIImageView *iconView;

@end

#endif /* DSTableDetailCell_h */
