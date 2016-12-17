//
//  DSSkillPointSettingViewController.h
//  dqxSkillSmltr
//
//  Created by HANSHAOWEN on 16/12/12.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#ifndef DSSkillPointSettingViewController_h
#define DSSkillPointSettingViewController_h

#import "DSBaseViewController.h"

@interface DSSkillPointSettingViewController : DSBaseViewController

-(void)setJobForPointSetting:(NSString*)job;
- (void)valueChanged:(UIStepper *)stepper;

@end

#endif /* DSSkillPointSettingViewController_h */
