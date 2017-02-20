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
//Tencent
#import "GDTTrack.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //初始化核心全局数据
    [self initData];
    
    //创建主窗口
    
    CGRect rect = [UIScreen mainScreen].bounds;
    _window = [[UIWindow alloc] initWithFrame:rect];
    _window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
    
    //设置导航栏的样式
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : DSNavigationBarTitleTextColor}];
    [[UINavigationBar appearance] setTintColor:DSLightGrayTextColor];
    //[[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBarTintColor:DSNavigationBarTitleTextColor];
    
    _window.rootViewController = [[DSTabBarController alloc] init];
    
    //Tencent 6 号广告位  开屏广告
    /*
    GDTSplashAd *splash = [[GDTSplashAd alloc] initWithAppkey:@"1105827469" placementId:@"6080210894263517"];
    splash.delegate = self; //设置代理
    //根据iPhone设备不同设置不同背景图

    splash.fetchDelay = 5; //开发者可以设置开屏拉取时间,超时则放弃展示
    //[可选]拉取并展示全屏开屏广告
    [splash loadAdAndShowInWindow:self.window];
    self.splash = splash;
    */
    return YES;
}

//开屏广告成功展示
-(void)splashAdSuccessPresentScreen:(GDTSplashAd *)splashAd{
    
}
//开屏广告展示失败
-(void)splashAdFailToPresent:(GDTSplashAd *)splashAd withError:(NSError *)error{
    
}
//应用进入后台时回调
- (void)splashAdApplicationWillEnterBackground:(GDTSplashAd *)splashAd{
    
}
//开屏广告点击回调
- (void)splashAdClicked:(GDTSplashAd *)splashAd{
    
}
//开屏广告关闭回调
- (void)splashAdClosed:(GDTSplashAd *)splashAd{
    
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
    [self.splash loadAdAndShowInWindow:self.window];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    //Tencent
    [GDTTrack activateApp];
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)initData{
    
    //初始化全局特技点数静态数据
    _gSkillInfo = [[DSGlobalSkillInfo alloc] init];
    _gSkillInfo.typeName = SKILL_DETAIL_SECTION;
    _gSkillInfo.skillPoint = SKILL_POINT_POINT;
    _gSkillInfo.skillName = SKILL_POINT_NAME;
    _gSkillInfo.skillDesc = SKILL_DETAIL_DESC;
    _gSkillInfo.pointForLevel = [[NSDictionary alloc] initWithObjectsAndKeys:SKILL_POINT_FOR_LEVEL, nil];
    
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
        DSGlobalJobInfo *info11 = JOB_SKILL_TYPE_ZD;
        DSGlobalJobInfo *info12 = JOB_SKILL_TYPE_MX;
        _gJobInfo = [[NSMutableDictionary alloc] initWithObjectsAndKeys:\
                     info1, @"战士", info2, @"魔法师", \
                     info3, @"僧侣", info4, @"武术家", \
                     info5, @"旅行艺人", info6, @"寻宝家", \
                     info7, @"圣骑士", info8, @"游侠", \
                     info9, @"魔法战士", info10, @"贤者", \
                     info11, @"战斗大师", info12, @"超级明星", nil];
    }
    
    //添加职业要在这里添加缓存中的新职业信息。
    //添加超级明星职业
    if ([_gJobInfo count] < 12){
        DSGlobalJobInfo *info12 = JOB_SKILL_TYPE_MX;
        [_gJobInfo setObject:info12 forKey:@"超级明星"];
    }
}

-(NSMutableDictionary*)getPointStateOfOtherJob:(NSString*)jobName skillType:(NSString*)skillType{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    NSArray *allKeys = [_gJobInfo allKeys];
    
    for (NSString *key in allKeys)
    {
        if([key isEqualToString:jobName])
        {
            continue;
        }
        DSGlobalJobInfo *jobInfo = _gJobInfo[key];
        NSString *skillPoint = [jobInfo.skillPointSetting objectForKey:skillType];
        if (!skillPoint)
        {
            continue;
        }
        [dic setObject:skillPoint forKey:jobInfo.jobName];
    }
    return dic;
}

-(NSInteger)getUsedPointOfOtherJob:(NSString*)jobName skillType:(NSString*)skillType{
    NSInteger point = 0;
    NSMutableDictionary *dic = [self getPointStateOfOtherJob:jobName skillType:skillType];
    NSArray *allKeys = [dic allKeys];
    for (NSString *key in allKeys)
    {
        point += [dic[key] intValue];
    }
    return point;
}

-(NSInteger)getUsedPointOfCurrentJob:(NSString*)jobName skillType:(NSString*)skillType{
    DSGlobalJobInfo *jobInfo = _gJobInfo[jobName];
    NSString *skillPoint = [jobInfo.skillPointSetting objectForKey:skillType];
    return [skillPoint intValue];
}
@end
