//
//  AppDelegate.h
//  dqxSkillSmltr
//
//  Created by HANSHAOWEN on 16/12/7.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DSGlobalJobInfo.h"
#import "DSGlobalSkillInfo.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, copy) NSMutableDictionary *gJobInfo;
@property (nonatomic, copy) DSGlobalSkillInfo *gSkillInfo;

@end

