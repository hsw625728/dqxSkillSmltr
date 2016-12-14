//
//  DSGlobalJobInfo.h
//  dqxSkillSmltr
//
//  Created by HANSHAOWEN on 16/12/12.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#ifndef DSGlobalJobInfo_h
#define DSGlobalJobInfo_h

@interface DSGlobalJobInfo : NSObject<NSCoding>

@property (nonatomic, copy) NSString *jobName;
@property (nonatomic, assign) NSInteger level;
@property (nonatomic, assign) NSInteger totelPoint;
@property (nonatomic, assign) NSInteger unusePoint;
@property (nonatomic, copy) NSString *skillJob;
@property (nonatomic, copy) NSString *skillWeapon1;
@property (nonatomic, copy) NSString *skillWeapon2;
@property (nonatomic, copy) NSString *skillWeapon3;
@property (nonatomic, copy) NSString *skillWeapon4;
@property (nonatomic, copy) NSMutableDictionary *skillPointSetting;

-(DSGlobalJobInfo*)initMine:(NSString*)name level:(NSInteger)lev sJob:(NSString*)sjob weapon1:(NSString*)w1 weapon2:(NSString*)w2 weapon3:(NSString*)w3 weapon4:(NSString*)w4;

-(void)updateSkillPoint;

@end


#endif /* DSGlobalJobInfo_h */
