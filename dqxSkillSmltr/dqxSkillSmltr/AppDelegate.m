//
//  AppDelegate.m
//  dqxSkillSmltr
//
//  Created by HANSHAOWEN on 16/12/7.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#import "AppDelegate.h"
#import "DSTabBarController.h"
#import "DSGlobalJobInfo.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //初始化核心全局数据
    NSString *docPath =  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [docPath stringByAppendingPathComponent:@"globalJobInfo"];
    
    _gJobInfo = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if (ISNULL(_gJobInfo))
    {
        DSGlobalJobInfo *info1 = JOB_SKILL_TYPE_ZS;
        DSGlobalJobInfo *info2 = JOB_SKILL_TYPE_MFS;
        DSGlobalJobInfo *info3 = JOB_SKILL_TYPE_SL;
        DSGlobalJobInfo *info4 = JOB_SKILL_TYPE_WSJ;
        DSGlobalJobInfo *info5 = JOB_SKILL_TYPE_LXYR;
        DSGlobalJobInfo *info6 = JOB_SKILL_TYPE_XBJ;
        DSGlobalJobInfo *info7 = JOB_SKILL_TYPE_SQS;
        DSGlobalJobInfo *info8 = JOB_SKILL_TYPE_YX;
        DSGlobalJobInfo *info9 = JOB_SKILL_TYPE_MFZS;
        DSGlobalJobInfo *info10 = JOB_SKILL_TYPE_XZ;
        _gJobInfo = [[NSDictionary alloc] initWithObjectsAndKeys:\
                     info1, @"战士", info2, @"魔法师", \
                     info3, @"僧侣", info4, @"武术家", \
                     info5, @"旅行艺人", info6, @"寻宝家", \
                     info7, @"圣骑士", info8, @"游侠", \
                     info9, @"魔法战士", info10, @"贤者", nil];
    }
    //创建主窗口
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
    
    //设置导航栏的样式
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : DSNavigationBarTitleTextColor}];
    [[UINavigationBar appearance] setTintColor:DSLightGrayTextColor];
    //[[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBarTintColor:DSNavigationBarTitleTextColor];
    
    
    _window.rootViewController = [[DSTabBarController alloc] init];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
