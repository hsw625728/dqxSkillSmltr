//
//  DSGlobalJobInfo.m
//  dqxSkillSmltr
//
//  Created by HANSHAOWEN on 16/12/12.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSGlobalJobInfo.h"
@implementation DSGlobalJobInfo

-(DSGlobalJobInfo*)initMine:(NSString*)name level:(NSInteger)lev sJob:(NSString*)sjob weapon1:(NSString*)w1 weapon2:(NSString*)w2 weapon3:(NSString*)w3 weapon4:(NSString*)w4{
    self =[super init];
    self.jobName = name;
    self.level = lev;
    self.skillJob = sjob;
    self.skillWeapon1 = w1;
    self.skillWeapon2 = w2;
    self.skillWeapon3 = w3;
    self.skillWeapon4 = w4;
    self.skillPoint = [[NSDictionary alloc] initWithObjectsAndKeys:\
                       @0, _jobName, \
                       @0, _skillWeapon1, \
                       @0, _skillWeapon2, \
                       @0, _skillWeapon3, \
                       @0, _skillWeapon4, nil];
    return self;
}
// 当将一个自定义对象保存到文件的时候就会调用该方法
// 在该方法中说明如何存储自定义对象的属性
// 也就说在该方法中说清楚存储自定义对象的哪些属性
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    NSLog(@"调用了encodeWithCoder:方法");
    [aCoder encodeObject:self.jobName forKey:@"jobName"];
    [aCoder encodeInteger:self.level forKey:@"level"];
    [aCoder encodeObject:self.skillJob forKey:@"skillJob"];
    [aCoder encodeObject:self.skillWeapon1 forKey:@"skillWeapon1"];
    [aCoder encodeObject:self.skillWeapon2 forKey:@"skillWeapon2"];
    [aCoder encodeObject:self.skillWeapon3 forKey:@"skillWeapon3"];
    [aCoder encodeObject:self.skillWeapon4 forKey:@"skillWeapon4"];
    [aCoder encodeObject:self.skillPoint forKey:@"skillPoint"];
}

// 当从文件中读取一个对象的时候就会调用该方法
// 在该方法中说明如何读取保存在文件中的对象
// 也就是说在该方法中说清楚怎么读取文件中的对象
-(id)initWithCoder:(NSCoder *)aDecoder
{
    NSLog(@"调用了initWithCoder:方法");
    //注意：在构造方法中需要先初始化父类的方法
    if (self=[super init]) {
        self.jobName=[aDecoder decodeObjectForKey:@"jobName"];
        self.level=[aDecoder decodeIntegerForKey:@"level"];
        self.skillJob=[aDecoder decodeObjectForKey:@"skillJob"];
        self.skillWeapon1=[aDecoder decodeObjectForKey:@"skillWeapon1"];
        self.skillWeapon2=[aDecoder decodeObjectForKey:@"skillWeapon2"];
        self.skillWeapon3=[aDecoder decodeObjectForKey:@"skillWeapon3"];
        self.skillWeapon4=[aDecoder decodeObjectForKey:@"skillWeapon4"];
        self.skillPoint=[aDecoder decodeObjectForKey:@"skillPoint"];
    }
    return self;
}

@end
