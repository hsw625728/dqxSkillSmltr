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
#import "GDTSplashAd.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,GDTSplashAdDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) GDTSplashAd *splash;
@property (nonatomic, copy) NSMutableDictionary *gJobInfo;
@property (nonatomic, copy, readonly) DSGlobalSkillInfo *gSkillInfo;

-(NSMutableDictionary*)getPointStateOfOtherJob:(NSString*)jobName skillType:(NSString*)skillType;
-(NSInteger)getUsedPointOfOtherJob:(NSString*)jobName skillType:(NSString*)skillType;
-(NSInteger)getUsedPointOfCurrentJob:(NSString*)jobName skillType:(NSString*)skillType;

@end

