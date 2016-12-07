//
//  DSTableHeaderView.h
//  dqxSkillSmltr
//
//  Created by HANSHAOWEN on 16/12/7.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#ifndef DSTableHeaderView_h
#define DSTableHeaderView_h

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT NSString *const kDSTableHeaderViewID;

@interface DSTableHeaderView : UITableViewHeaderFooterView

+ (CGFloat)viewHeight;

@property (strong, nonatomic) UILabel *titleLabel;

@end

#endif /* DSTableHeaderView_h */
