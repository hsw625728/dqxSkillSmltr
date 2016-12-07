//
//  Macros.h
//  dqxSkillSmltr
//
//  Created by HANSHAOWEN on 16/12/7.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#ifndef Macros_h
#define Macros_h
#pragma mark - UI / 屏幕、控件尺寸

#define kKeyWindow [UIApplication sharedApplication].keyWindow

#define isRetina                  ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define isPad                     (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define BottomEdgeYOfView(view)   view.frame.origin.y + view.frame.size.height
// 屏幕高度
#define SCREEN_HEIGHT             [[UIScreen mainScreen] bounds].size.height
// 屏幕宽度
#define SCREEN_WIDTH              [[UIScreen mainScreen] bounds].size.width
#define FULL_WIDTH                SCREEN_WIDTH
#define FULL_HEIGHT               (SCREEN_HEIGHT - ((SYSTEM_VERSION >= 7) ? 0 : STATUSBAR_HEIGHT))
#define CONTENT_HEIGHT            (FULL_HEIGHT - NAVBAR_HEIGHT)

#define Device_Is_iPhone5         ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define Device_Is_iPhone6         ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define Device_Is_iPhone6Plus     ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define DEVICE_UUID               [[[UIDevice currentDevice] identifierForVendor] UUIDString]

#define KEYBOARD_HEIGHT           216

// 字体
#pragma mark - font
#define FontWithNameSize(name, size)    [UIFont fontWithName:name size:size]
#define FontWithSize(size)              [UIFont systemFontOfSize:size]
#define ScoreFontWithSize(fontSize)     [UIFont fontWithName:@"Bradley Hand" size:fontSize]
#define BoldFontWithSize(size)          [UIFont boldSystemFontOfSize:size]
#define BoldSystemFont(size)            [UIFont boldSystemFontOfSize:size]
#define systemFont(size)                [UIFont systemFontOfSize:size]

#pragma mark - GCD
// 单例
#define DISPATCH_ONCE_BLOCK(onceBlock); static dispatch_once_t onceToken; dispatch_once(&onceToken, onceBlock);

// 是否为中文
#define IS_CH_SYMBOL(chr)               ((int)(chr)>127)
#define StringByTrimWhiteSpace(text)    [text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]
#define IsStringEmpty(string)           (!string || [@"" isEqualToString:string])
#define IsStringNotEmpty(string)        (string && ![@"" isEqualToString:string])

#define ISNULL(x) (x?((id)x==(id)[NSNull null]):true)



#endif /* Macros_h */
