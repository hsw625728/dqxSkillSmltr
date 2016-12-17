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

//当前技能点数的最大值
#define CURRENT_MAX_SKILL_POINT_OF_SKILL_TYPE 100

//全局数据初始化
#define JOB_SKILL_TYPE_ZS [[DSGlobalJobInfo alloc] \
initMine:@"战士" \
level:10 \
sJob:@"勇敢" \
weapon1:@"单手剑" \
weapon2:@"双手剑" \
weapon3:@"斧" \
weapon4:@"盾"]

#define JOB_SKILL_TYPE_MFS [[DSGlobalJobInfo alloc] \
initMine:@"魔法师" \
level:10 \
sJob:@"魔法" \
weapon1:@"短剑" \
weapon2:@"双手杖" \
weapon3:@"盾" \
weapon4:@"鞭"]

#define JOB_SKILL_TYPE_SL [[DSGlobalJobInfo alloc] \
initMine:@"僧侣" \
level:10 \
sJob:@"信仰" \
weapon1:@"短杖" \
weapon2:@"矛" \
weapon3:@"盾" \
weapon4:@"棍"]

#define JOB_SKILL_TYPE_WSJ [[DSGlobalJobInfo alloc] \
initMine:@"武术家" \
level:10 \
sJob:@"气力" \
weapon1:@"爪" \
weapon2:@"棍" \
weapon3:@"格斗" \
weapon4:@"扇"]

#define JOB_SKILL_TYPE_LXYR [[DSGlobalJobInfo alloc] \
initMine:@"旅行艺人" \
level:10 \
sJob:@"曲艺" \
weapon1:@"短剑" \
weapon2:@"扇" \
weapon3:@"盾" \
weapon4:@"棍"]

#define JOB_SKILL_TYPE_XBJ [[DSGlobalJobInfo alloc] \
initMine:@"寻宝家" \
level:10 \
sJob:@"宝物" \
weapon1:@"短剑" \
weapon2:@"爪" \
weapon3:@"格斗" \
weapon4:@"鞭"]

#define JOB_SKILL_TYPE_SQS [[DSGlobalJobInfo alloc] \
initMine:@"圣骑士" \
level:10 \
sJob:@"博爱" \
weapon1:@"短杖" \
weapon2:@"矛" \
weapon3:@"锤" \
weapon4:@"盾"]

#define JOB_SKILL_TYPE_YX [[DSGlobalJobInfo alloc] \
initMine:@"游侠" \
level:10 \
sJob:@"生存" \
weapon1:@"格斗" \
weapon2:@"弓" \
weapon3:@"回旋镖" \
weapon4:@"斧"]

#define JOB_SKILL_TYPE_MFZS [[DSGlobalJobInfo alloc] \
initMine:@"魔法战士" \
level:10 \
sJob:@"源力" \
weapon1:@"单手剑" \
weapon2:@"双手杖" \
weapon3:@"弓" \
weapon4:@"盾"]

#define JOB_SKILL_TYPE_XZ [[DSGlobalJobInfo alloc] \
initMine:@"贤者" \
level:10 \
sJob:@"悟性" \
weapon1:@"双手杖" \
weapon2:@"弓" \
weapon3:@"回旋镖" \
weapon4:@"盾"]

//最小特技点等级
//最大特技点等级
#define MIN_SKILL_POINT_LEVEL 10
#define MAX_SKILL_POINT_LEVEL 50
//职业列表
#define JOB_TYPE_SECTION                @[@"职业"]
#define JOB_TYPE_NAME                   @[@[@"战士", @"魔法师", @"僧侣", @"武术家", @"旅行艺人", @"寻宝家", @"圣骑士", @"游侠", @"魔法战士", @"贤者"]]
#define JOB_SKILL_TYPE                  @[@[@"勇敢", @"单手剑", @"双手剑", @"斧", @"盾"],\
@[@"魔法", @"短剑", @"双手杖", @"盾", @"鞭"],\
@[@"信仰", @"短杖", @"矛", @"盾", @"棍"],\
@[@"气力", @"爪", @"棍", @"格斗", @"扇"],\
@[@"曲艺", @"短剑", @"扇", @"盾", @"棍"],\
@[@"宝物", @"短剑", @"爪", @"格斗", @"鞭"],\
@[@"博爱", @"短杖", @"矛", @"锤", @"盾"],\
@[@"生存", @"格斗", @"弓", @"回旋镖", @"斧"],\
@[@"源力", @"单手剑", @"双手杖", @"弓", @"盾"],\
@[@"悟性", @"双手杖", @"弓", @"回旋镖", @"盾"]]
#define JOB_SKILL_POINT                 @[@[@"0/0", @"0/0", @"0/0", @"0/0", @"0/0"],\
@[@"0/0", @"0/0", @"0/0", @"0/0", @"0/0"],\
@[@"0/0", @"0/0", @"0/0", @"0/0", @"0/0"],\
@[@"0/0", @"0/0", @"0/0", @"0/0", @"0/0"],\
@[@"0/0", @"0/0", @"0/0", @"0/0", @"0/0"],\
@[@"0/0", @"0/0", @"0/0", @"0/0", @"0/0"],\
@[@"0/0", @"0/0", @"0/0", @"0/0", @"0/0"],\
@[@"0/0", @"0/0", @"0/0", @"0/0", @"0/0"],\
@[@"0/0", @"0/0", @"0/0", @"0/0", @"0/0"],\
@[@"0/0", @"0/0", @"0/0", @"0/0", @"0/0"],\
@[@"0/0", @"0/0", @"0/0", @"0/0", @"0/0"]]

//技能列表
#define SKILL_DETAIL_SECTION            @[@"勇敢", @"魔法", @"信仰", @"气力", @"曲艺", @"宝物", @"博爱", @"生存", @"源力", @"悟性", @"单手剑", @"双手剑", @"短剑", @"短杖", @"双手杖", @"矛", @"棍", @"爪", @"鞭", @"斧", @"扇", @"弓", @"锤", @"回旋镖", @"盾", @"格斗"]
#define SKILL_POINT_POINT    @[@[@"8",\
@"16",\
@"28",\
@"40",\
@"48",\
@"56",\
@"70",\
@"80",\
@"90",\
@"100"],\
@[@"8",\
@"18",\
@"26",\
@"38",\
@"46",\
@"54",\
@"68",\
@"78",\
@"88",\
@"100"],\
@[@"8",\
@"18",\
@"28",\
@"40",\
@"48",\
@"56",\
@"70",\
@"80",\
@"90",\
@"100"],\
@[@"4",\
@"12",\
@"22",\
@"34",\
@"48",\
@"56",\
@"70",\
@"80",\
@"90",\
@"100"],\
@[@"4",\
@"12",\
@"22",\
@"34",\
@"46",\
@"54",\
@"68",\
@"78",\
@"82",\
@"100"],\
@[@"8",\
@"18",\
@"26",\
@"38",\
@"46",\
@"54",\
@"68",\
@"78",\
@"82",\
@"100"],\
@[@"2",\
@"12",\
@"22",\
@"34",\
@"46",\
@"54",\
@"68",\
@"78",\
@"82",\
@"100"],\
@[@"2",\
@"12",\
@"22",\
@"34",\
@"46",\
@"54",\
@"68",\
@"78",\
@"82",\
@"100"],\
@[@"4",\
@"10",\
@"16",\
@"22",\
@"32",\
@"42",\
@"55",\
@"68",\
@"82",\
@"100"],\
@[@"4",\
@"10",\
@"16",\
@"22",\
@"32",\
@"42",\
@"55",\
@"68",\
@"82",\
@"100"],\
@[@"3",\
@"7",\
@"13",\
@"22",\
@"35",\
@"42",\
@"58",\
@"76",\
@"88",\
@"100"],\
@[@"3",\
@"7",\
@"13",\
@"22",\
@"35",\
@"42",\
@"58",\
@"76",\
@"88",\
@"100"],\
@[@"3",\
@"7",\
@"13",\
@"22",\
@"35",\
@"42",\
@"58",\
@"76",\
@"88",\
@"100"],\
@[@"3",\
@"7",\
@"13",\
@"21",\
@"31",\
@"44",\
@"57",\
@"70",\
@"84",\
@"100"],\
@[@"3",\
@"7",\
@"13",\
@"21",\
@"31",\
@"44",\
@"57",\
@"70",\
@"84",\
@"100"],\
@[@"3",\
@"7",\
@"13",\
@"22",\
@"35",\
@"42",\
@"58",\
@"76",\
@"88",\
@"100"],\
@[@"3",\
@"7",\
@"13",\
@"22",\
@"35",\
@"42",\
@"58",\
@"76",\
@"88",\
@"100"],\
@[@"3",\
@"7",\
@"13",\
@"22",\
@"35",\
@"42",\
@"58",\
@"76",\
@"88",\
@"100"],\
@[@"3",\
@"7",\
@"13",\
@"22",\
@"35",\
@"42",\
@"58",\
@"76",\
@"88",\
@"100"],\
@[@"3",\
@"7",\
@"13",\
@"22",\
@"35",\
@"42",\
@"58",\
@"76",\
@"88",\
@"100"],\
@[@"3",\
@"7",\
@"13",\
@"22",\
@"35",\
@"42",\
@"58",\
@"76",\
@"88",\
@"100"],\
@[@"3",\
@"7",\
@"13",\
@"22",\
@"35",\
@"42",\
@"58",\
@"76",\
@"88",\
@"100"],\
@[@"3",\
@"7",\
@"13",\
@"22",\
@"35",\
@"42",\
@"58",\
@"76",\
@"88",\
@"100"],\
@[@"3",\
@"7",\
@"13",\
@"22",\
@"35",\
@"42",\
@"58",\
@"76",\
@"88",\
@"100"],\
@[@"6",\
@"12",\
@"18",\
@"25",\
@"32",\
@"40",\
@"52",\
@"66",\
@"82",\
@"100"],\
@[@"3",\
@"7",\
@"12",\
@"18",\
@"25",\
@"30",\
@"42",\
@"60",\
@"77",\
@"100"]]

#define SKILL_POINT_NAME    @[@[@"保护(专)",\
@"全职业耐力+5",\
@"全职业力量+5",\
@"失意击",\
@"全职业耐力+5",\
@"全职业力量+5",\
@"冲撞(专)",\
@"全职业最大体力+30",\
@"全职业耐力+10",\
@"断刃(专)"],\
@[@"魔结界",\
@"全职业攻击魔力+10",\
@"全职业最大能量+10",\
@"诡异之光",\
@"咒文暴走率上升",\
@"全职业攻击魔力+10",\
@"魔力气息（专）",\
@"全职业攻击魔力+10",\
@"全职业最大能量+10",\
@"魔力觉醒（专）"],\
@[@"驱散",\
@"全职业恢复魔力+10",\
@"玛霍托拉之衣（专）",\
@"全职业最大能量+10",\
@"圣女守护（专）",\
@"全职业恢复魔力+10",\
@"天使守护（专）",\
@"全职业最大能量+10",\
@"全职业恢复魔力+10",\
@"神圣祷告（专）"],\
@[@"蓄气（专）",\
@"全职业灵巧+20",\
@"心头灭却",\
@"全职业敏捷+30",\
@"不屈不挠（专）",\
@"全职业力量+10",\
@"吼叫",\
@"全职业最大体力+40",\
@"冥想（专）",\
@"蓄气二（专）"],\
@[@"装傻",\
@"全职业魅力+20",\
@"吐槽",\
@"全职业敏捷+30",\
@"踢踏舞（专）",\
@"全职业攻击魔力+10",\
@"杂耍（专）",\
@"全职业恢复魔力+10",\
@"全职业灵巧+20",\
@"振奋之舞（专）"],\
@[@"搜寻（专）",\
@"识破",\
@"寻宝（专）",\
@"全职业敏捷+30",\
@"全职业灵巧+20",\
@"香蕉陷阱（专）",\
@"全职业敏捷+30",\
@"巨型炸弹（专）",\
@"全职业敏捷+30",\
@"装死"],\
@[@"刃之防御",\
@"全职业耐力+10",\
@"体力支援",\
@"全职业恢复魔力+10",\
@"仁王立(专)",\
@"全职业耐力+10",\
@"加重(专)",\
@"全职业耐力+20",\
@"全职业最大生命值+30",\
@"大防御(专)"],\
@[@"放生",\
@"全职业灵巧+20",\
@"驯服(专)",\
@"全职业魅力+20",\
@"金属陷阱(专)",\
@"全职业灵巧+20",\
@"守护之雾(专)",\
@"全职业恢复魔力+20",\
@"全职业灵巧+20",\
@"狼之突袭(专)"],\
@[@"烈焰源力(专)",\
@"全职业力量+10",\
@"寒冰源力(专)",\
@"全职业最大MP+10",\
@"风暴源力(专)",\
@"全职业耐力+5",\
@"黑暗源力(专)",\
@"能量支援(专)",\
@"全职业最大HP+20",\
@"光明源力(专)"],\
@[@"治愈之雨(专)",\
@"全职业恢复魔力+10",\
@"全职业攻击魔力+10",\
@"魔导之书(专)",\
@"全职业最大MP+10",\
@"全职业恢复魔力+10",\
@"神秘之悟(专)",\
@"全职业攻击魔力+10",\
@"全职业最大MP+20",\
@"零之洗礼(专)"],\
@[@"火炎斩",\
@"装备时攻击力+5",\
@"龙斩",\
@"装备时会心率+2%",\
@"奇迹剑技",\
@"装备时攻击力+10",\
@"隼斩",\
@"装备时武器格挡率+4%",\
@"装备时攻击力+15",\
@"光刃斩"],\
@[@"兵刃格挡",\
@"装备时攻击力+10",\
@"巨龙冲击",\
@"装备时会心率+2%",\
@"大回转",\
@"装备时武器格挡率+4%",\
@"装备时攻击力+15",\
@"冰封之刃",\
@"装备时攻击力+20",\
@"奋力斩"],\
@[@"蜂鸣飞刃",\
@"装备时攻击力+5",\
@"睡眠匕首",\
@"攻击时偶尔恢复能量",\
@"睡神狩猎",\
@"装备时攻击力+10",\
@"暗蛇毒牙",\
@"装备时会心率+2%",\
@"装备时攻击力+15",\
@"死神狩猎"],\
@[@"装备时能量吸收率+2%",\
@"魅力魔杖",\
@"胜利时恢复少量能量",\
@"装备时恢复魔力+30",\
@"魔性魅惑",\
@"装备时最大能量+30",\
@"装备时能量吸收率+2%",\
@"甜蜜帕尼帕尼",\
@"装备时恢复魔力+30",\
@"光闪波动"],\
@[@"能量吸收率+2%",\
@"恶魔驱除",\
@"胜利时恢复少量能量",\
@"速读之杖",\
@"攻击魔力+30",\
@"祝福之杖",\
@"攻击魔力+30",\
@"暴走魔法阵",\
@"最大能量+100",\
@"胜利时恢复中量能量"],\
@[@"攻击力+10",\
@"野兽突刺",\
@"武器格挡率+4%",\
@"会心率+2%",\
@"雷鸣突刺",\
@"武器格挡率+5%",\
@"攻击力+15",\
@"一闪突刺",\
@"攻击力+20",\
@"狼牙突刺"],\
@[@"装备时攻击力+10",\
@"下段扫",\
@"装备时武器格挡率+4%",\
@"黄泉送葬",\
@"装备时攻击力+15",\
@"横扫",\
@"装备时闪避率+4%",\
@"冰结乱击",\
@"装备时攻击力+20",\
@"天地之势"],\
@[@"双翼风刃",\
@"装备时攻击力+5",\
@"裂钢拳",\
@"装备时会心率+2%",\
@"必中拳",\
@"装备时攻击力+5",\
@"虎爪猛袭",\
@"装备时会心率+2%",\
@"装备时攻击力+5",\
@"金手指"],\
@[@"螺旋打",\
@"装备时攻击力+5",\
@"爱之鞭",\
@"装备时攻击力+5",\
@"闪光打",\
@"束缚打",\
@"装备时攻击力+5",\
@"地灵打",\
@"装备时效果范围+2",\
@"双龙打"],\
@[@"装备时攻击力+5",\
@"巨木斩",\
@"装备时攻击力+10",\
@"苍天魔斩",\
@"装备时攻击力+15",\
@"裂盔斩",\
@"装备时会心率+2%",\
@"魔神斩",\
@"装备时攻击力+20",\
@"斧无双"],\
@[@"装备时攻击力+5",\
@"花雨",\
@"装备时会心率+2%",\
@"明镜止水",\
@"装备时攻击力+10",\
@"波纹演舞",\
@"装备时入迷率+5%",\
@"扇之舞",\
@"装备时攻击力+15",\
@"凤蝶乱舞"],\
@[@"装备时攻击力+5",\
@"魔法之矢",\
@"装备时射程距离+3m",\
@"飞鸟射击",\
@"装备时攻击力+10",\
@"雷电射击",\
@"装备时射程距离+3m",\
@"乱射",\
@"装备时攻击力+15",\
@"天使之箭"],\
@[@"重量破击",\
@"石鼓碎击",\
@"装备时攻击力+5",\
@"盾碎",\
@"装备时会心率+2%",\
@"能量打击",\
@"装备时攻击力+10",\
@"打消冲击",\
@"装备时攻击力+15",\
@"大地冲击"],\
@[@"史莱姆突袭",\
@"装备时攻击力+5",\
@"金属之翼",\
@"装备时攻击力+5",\
@"强力投掷",\
@"装备时命中率+20%",\
@"光之暴雨",\
@"装备时攻击力+5",\
@"烈焰鸟",\
@"二重切"],\
@[@"装备时盾格挡率+1%",\
@"防御",\
@"装备时盾格挡率+1%",\
@"大盾",\
@"装备时盾格挡率+1%",\
@"盾击",\
@"装备时盾格挡率+1%",\
@"守护之盾",\
@"装备时防御力+30",\
@"会心完全防御"],\
@[@"空手时攻击力+10",\
@"扔石子",\
@"空手时会心率+2%",\
@"镰鼬",\
@"空手时攻击力+20",\
@"正拳突击",\
@"空手时闪避率+2%",\
@"月形空翻",\
@"空手时攻击力+40",\
@"爆裂拳"]]
#define SKILL_DETAIL_DESC   @[@[@"短暂的时间内,替一个同伴承受伤害",\
@"所有职业耐力+5",\
@"所有职业力量+5",\
@"对目标造成1.1倍伤害,使目标斗志下降一段,愤怒状态解除",\
@"所有职业耐力+5",\
@"所有职业力量+5",\
@"对目标造成1.25倍伤害,高概率打断目标行动,并追加瘫痪效果",\
@"所有职业HP+30",\
@"所有职业耐力+10",\
@"对目标造成1.3倍伤害,高概率使目标攻击力下降一段"],\
@[@"让自身获得攻击咒文耐性（20%）效果，最多可叠加2次（40%）",\
@"所有职业的攻击魔力增加10",\
@"所有职业的MP增加10",\
@"降低目标的攻击咒文耐性（20%），最多可叠加2次（40%）",\
@"所有职业的咒文暴走率上升",\
@"所有职业的攻击魔力增加10",\
@"让自身获得MP徐徐回复效果",\
@"所有职业的攻击魔力增加10",\
@"所有职业的MP增加10",\
@"2分钟内，使自身的所有攻击咒文造成2.0倍伤害"],\
@[@"治愈一位同伴的诅咒状态",\
@"所有职业的恢复魔力增加10",\
@"1分钟内，每次将受到伤害的10%转化为自己的MP",\
@"所有职业的MP增加10",\
@"2分钟内，当HP在一半以上时受到致命伤害，会剩下1点HP，不会立即死亡。（触发后效果消失）",\
@"所有职业的恢复魔力增加10",\
@"30分钟内，受到致命伤害被击倒时自动复活。（触发后效果消失）",\
@"所有职业的MP增加10",\
@"所有职业的恢复魔力增加10",\
@"2分钟内，回复魔法的效果提高2.0倍。（对里霍伊米系魔法无效）"],\
@[@"提升自身的气力1段，气力2段后继续提升有可能失败",\
@"所有职业的灵巧增加20",\
@"自身的吐息耐性上升40%",\
@"所有职业的敏捷增加30",\
@"消除自身所有的异常状态",\
@"所有职业的力量增加10",\
@"大声咆哮，瘫痪周围的敌人",\
@"所有职业的体力增加40",\
@"回复自身的体力，回复量受到最大体力值得影响",\
@"提升自身的气力2段，必定成功"],\
@[@"通过卖萌使周围敌人陷入瘫痪状态，成功时自身气力上升",\
@"所有职业的魅力增加20",\
@"恢复友单体的麻痹、魅惑、睡眠、混乱状态，成功率与灵巧有关，暴击时必定成功",\
@"所有职业的敏捷增加30",\
@"3分钟内，自身的回避率上升",\
@"所有职业的攻击魔力增加10",\
@"随机对目标与目标周围所有目标造成0.5倍X 6回伤害，偶尔会追加混乱效果",\
@"所有职业的恢复魔力增加10",\
@"所有职业的灵巧增加20",\
@"回复周围的所有同伴70点HP，回复量受到恢复魔力与时尚度的影响"],\
@[@"从怪物身上获取道具与金币。成功率受到灵巧的影响",\
@"获取怪物的详细资料并记录在图鉴里",\
@"在地图中显示周围区域里的宝箱与采集点",\
@"所有职业的敏捷增加30",\
@"所有职业的灵巧增加20",\
@"在地上放置香蕉皮陷阱，踩中的敌人会摔倒而无法行动。在战斗外也能使用",\
@"所有职业的敏捷增加30",\
@"在地上放置大型炸弹，一定时间后爆炸对周围敌人造成伤害",\
@"所有职业的敏捷增加30",\
@"通过装死来避免受到敌人的攻击，同时回复体力。在战斗外也能使用"],\
@[@"15秒内，受到伤害降低25%，同时将自身受到伤害的25%返还，技能发动中无法移动，按b可以取消技能",\
@"所有职业耐力+10",\
@"将自身生命值30%传递给一名伙伴",\
@"所有职业的恢复魔力+10",\
@"15秒内，自身周围范围内伙伴所受伤害由自身代替承受，技能发动中无法移动，按b可以取消技能",\
@"所有职业耐力+10",\
@"90秒内自身重量加倍",\
@"所有职业耐力+20",\
@"所有职业最大生命值+30",\
@"15秒内所受伤害减少40%，技能发动中无法移动，按b可以取消技能"],\
@[@"劝退比自己弱小的敌人离开战场，无法获得道具和经验值",\
@"所有职业灵巧+20",\
@"1分钟内，使敌人陷入魅惑状态",\
@"所有职业魅力+20",\
@"30秒内阻止敌人逃跑，成功率取决于灵巧值",\
@"所有职业灵巧+20",\
@"免疫一次吐息攻击，有效时间2分钟",\
@"所有职业恢复魔力+20",\
@"所有职业灵巧+20",\
@"召唤狼进行两次攻击，威力与灵巧值相关"],\
@[@"使攻击附带炎属性效果",\
@"所有职业力量+10",\
@"使攻击附带冰属性效果",\
@"所有职业最大能量值+10",\
@"使攻击附带风属性与雷属性效果",\
@"所有职业耐力值+5",\
@"使攻击附带土属性与暗属性效果",\
@"分给同伴38点能量值",\
@"所有职业最大生命值+20",\
@"使攻击附带光属性效果"],\
@[@"恢复周围同伴受到伤害的20%的生命值，技能持续1分钟",\
@"所有职业恢复魔力+10",\
@"所有职业攻击魔力+10",\
@"使敌人更易受到负面状态影响",\
@"所有职业最大能量值+10",\
@"所有职业恢复魔力+10",\
@"两分钟内，攻击魔力与恢复魔力上升一段",\
@"所有职业攻击魔力+10",\
@"所有职业最大能量值+20",\
@"解除敌单体目标身上所持良性效果"],\
@[@"对目标造成1.2倍火属性伤害",\
@"装备单手剑时,攻击力增加5",\
@"对龙系目标造成1.5倍伤害",\
@"装备单手剑时,会心一击率增加2%",\
@"对目标造成伤害,伤害的25%+20回复为自己的HP,回复量上限为100点",\
@"装备单手剑时,攻击力增加10",\
@"对目标造成1.0倍 X 2回伤害,会心率5%",\
@"装备单手剑时,格挡率增加4%",\
@"装备单手剑时,攻击力增加15",\
@"以自己为中心,横扫周围的敌人,伤害受到攻击力与攻击魔力的影响"],\
@[@"3分钟内,武器格挡率增加20%",\
@"装备双手剑时,攻击力增加10",\
@"对龙系目标造成1.5倍伤害",\
@"装备双手剑时,会心一击率增加2%",\
@"以目标为中心,横扫周围的敌人",\
@"装备双手剑时,格挡率增加4%",\
@"装备双手剑时,攻击力增加15",\
@"对周围的敌人造成80-100的冰属性伤害,25%的概率追加7秒内行动不能的状态,攻击力在200以上时,威力进一步提高",\
@"装备双手剑时,攻击力增加20",\
@"劈砍目标,对其造成2倍伤害"],\
@[@"对虫系目标造成1.5倍伤害",\
@"装备短剑时，攻击力增加5",\
@"对目标造成1.1倍伤害，50%的概率追加睡眠效果，持续40秒",\
@"装备短剑时，攻击时25%概率回复少量MP",\
@"对目标造成1.5倍伤害，目标处于睡眠、混乱状态则是4倍伤害",\
@"装备短剑时，攻击力增加10",\
@"对目标造成1.1倍伤害，50%的概率追加中毒效果，持续60秒",\
@"装备短剑时，会心一击率增加2%",\
@"装备短剑时，攻击力增加15",\
@"对目标造成1.5倍伤害，目标处于中毒、麻痹状态则是4倍伤害"],\
@[@"装备短杖时，MP吸收率增加2%",\
@"3分钟内，提升一位同伴大量魅力",\
@"装备短杖时，战斗结束时每次少量回复MP",\
@"装备短杖时，恢复魔力增加30",\
@"对恶魔系目标造成1.5倍伤害，偶尔会追加魅惑效果",\
@"装备短杖时，MP增加30",\
@"装备短杖时，MP吸收率增加2%",\
@"使目标陷入混乱状态",\
@"装备短杖时，恢复魔力增加30",\
@"2分钟内，免疫大部分异常状态，受到冻气和波动时效果消失"],\
@[@"装备双手杖时，MP吸收率增加2%",\
@"对恶魔系目标造成1.5倍伤害，50%的概率追加麻痹效果，持续25秒",\
@"装备双手杖时，战斗结束时每次回复MP 2-4点",\
@"2分钟内，咒文咏唱时间缩短",\
@"装备双手杖时，攻击魔力增加30",\
@"回复一位同伴约80点HP",\
@"装备双手杖时，攻击魔力增加30",\
@"在自身脚下设置一个魔法阵，阵中的咒文暴走率提升25%，所有阵中的同伴都能享受效果",\
@"装备双手杖时，最大MP增加100",\
@"装备双手杖时，战斗结束时每次回复MP 4-6点"],\
@[@"装备矛时，攻击力增加10",\
@"对兽系目标造成1.5倍伤害",\
@"装备矛时，格挡率增加4%",\
@"装备矛时，会心一击率增加2%",\
@"对目标造成1.2倍+10雷属性伤害",\
@"装备矛时，格挡率增加5%",\
@"装备矛时，攻击力增加15",\
@"命中率50%，命中时必定会心一击",\
@"装备矛时，攻击力增加20",\
@"对目标，以及目标路径上的所有敌人造成2倍伤害"],\
@[@"装备棍时，攻击力增加10",\
@"用棍横扫周围的敌人，摔倒的敌人1回合内无法行动。对飞行系目标无效",\
@"装备棍时，格挡率增加4%",\
@"对僵尸系目标造成1.5倍伤害",\
@"装备棍时，攻击力增加15",\
@"对范围270度内的目标全体造成1.3-1.5倍伤害",\
@"装备棍时，闪避率增加4%",\
@"对目标造成0.45倍 X 4回冰属性伤害",\
@"装备棍时，攻击力增加20",\
@"一定时间内，受到敌人的攻击自动反击。此状态下无法移动"],\
@[@"对目标造成2.0倍 X 2回风属性伤害，自身等级越高威力越大",\
@"装备爪时，攻击力增加5",\
@"对机械系目标造成1.5倍伤害",\
@"装备爪时，会心一击率增加2%",\
@"必定命中的一击",\
@"装备爪时，攻击力增加5",\
@"对目标造成（1.3倍+1.2倍+1.1倍）的3回伤害",\
@"装备爪时，会心一击率增加2%",\
@"装备爪时攻击力上升5",\
@"对目标造成2.6倍伤害，消除目标所有增益状态"],\
@[@"对目标造成1.1倍伤害，50%的概率追加混乱效果，持续40秒",\
@"装备鞭时，攻击力增加5",\
@"对怪人系目标造成1.5倍伤害",\
@"装备鞭时，攻击力增加5",\
@"对目标造成1.2倍、目标周围1.0倍光属性伤害，50%的概率追加失明效果",\
@"对目标造成1.1倍伤害，三分之一的概率追加麻痹效果",\
@"装备鞭时，攻击力增加5",\
@"对前方范围内的目标全体造成1.5倍伤害",\
@"使用鞭子攻击时，稍远一点的目标也可以打中",\
@"对目标造成2.0倍 X 2回伤害"],\
@[@"装备斧时,攻击力增加5",\
@"对植物系目标造成1.5倍伤害",\
@"装备斧时,攻击力增加10",\
@"对目标造成3倍伤害,偶尔会追加麻痹效果",\
@"装备斧时,攻击力增加15",\
@"对目标造成1.2倍伤害,高概率追加防御力降低效果",\
@"装备斧时,会心一击率增加2%",\
@"命中率50%,命中时必定会心一击",\
@"装备斧时,攻击力增加20",\
@"以自己为中心,横扫周围的敌人,造成2.1-2.3倍伤害"],\
@[@"装备扇时，攻击力增加5",\
@"高概率对前方范围内的目标全体附加失明效果，持续60秒",\
@"装备扇时，会心率增加2%",\
@"1分钟内，自身每3秒回复15点HP",\
@"装备扇时，攻击力增加10",\
@"对水系目标造成1.5倍伤害",\
@"装备扇时，敌人陷入欢欣而1回合无法行动的概率增加5%",\
@"对周围所有目标造成0.5倍X 4回伤害，范围很窄",\
@"装备扇时，攻击力增加15",\
@"对目标与目标周围所有目标造成1.0-1.6倍伤害"],\
@[@"装备弓时,攻击力增加5",\
@"对单体目标造成伤害，有50几率降低一层咒文耐性",\
@"装备弓时，射程距离+3m",\
@"对鸟系怪物造成1.5倍伤害",\
@"装备弓时,攻击力增加10",\
@"对单体目标造成1.2倍的雷属性伤害",\
@"装备弓时，射程距离+3m",\
@"对单体目标造成4次0.5倍伤害",\
@"装备弓时,攻击力增加15",\
@"对单体目标进行攻击，回复自身mp值，恢复量为造成伤害的6%+2"],\
@[@"对目标造成1.1倍伤害，减少目标重量，效果持续90秒",\
@"对物质系目标造成1.5倍伤害",\
@"装备锤武器时，攻击力+5",\
@"对目标造成1.3倍伤害，50%几率使其防御力下降",\
@"装备锤武器时，会心率+2%",\
@"对攻击的目标造成普攻半额的MP削减",\
@"装备锤武器时，攻击力+10",\
@"对目标造成普通攻击伤害，高几率打断敌人行动",\
@"装备锤武器时,攻击力增加15",\
@"对周围制造冲击波，造成1.3倍土属性伤害，可以吹飞敌人打断其行动"],\
@[@"对周围的史莱姆系敌人造成1.5倍伤害",\
@"装备回旋镖时,攻击力增加5",\
@"对周围的金属系敌人造成1~2倍伤害",\
@"装备回旋镖时,攻击力增加5",\
@"对范围敌人造成1.2倍伤害",\
@"装备回旋镖时,命中率增加20%",\
@"对范围内敌人造成50~60点光属性伤害",\
@"装备回旋镖时,攻击力增加5",\
@"对前方目标造成一击，之后对目标后方范围随机打击，造成共计0.35倍的炎属性伤害7次",\
@"对周围敌人进行1.2倍伤害两次攻击，第二击之后造成伤害降低"],\
@[@"装备盾时,格挡率增加1%",\
@"约7秒内,受到的伤害减少25%",\
@"装备盾时,格挡率增加1%",\
@"3分钟内,盾格挡率上升",\
@"装备盾时,格挡率增加1%",\
@"对目标造成0.5倍伤害,约7秒内,自己受到的伤害减少25%",\
@"装备盾时,格挡率增加1%",\
@"2分钟内,50%概率免疫异常状态",\
@"装备盾时,防御力增加30",\
@"2分钟内,受到的会心一击伤害减少70%"],\
@[@"空手时攻击力增加10",\
@"对目标造成10-24点伤害",\
@"空手时会心率增加2%",\
@"对元素系目标造成1.5倍风属性伤害",\
@"空手时攻击力增加20",\
@"对目标造成1.5倍伤害，会心率较高",\
@"空手时闪避率增加2%",\
@"对目标造成1.3倍伤害，如果是飞行系目标则是1.5倍伤害",\
@"空手时攻击力增加40",\
@"对目标造成0.5倍 X 4回伤害，会心率较高"]]

#define SKILL_POINT_FOR_LEVEL @"3", @"10",\
@"6", @"11",\
@"6", @"12",\
@"9", @"13",\
@"13", @"14",\
@"13", @"15",\
@"17", @"16",\
@"21", @"17",\
@"21", @"18",\
@"25", @"19",\
@"29", @"20",\
@"29", @"21",\
@"32", @"22",\
@"36", @"23",\
@"36", @"24",\
@"40", @"25",\
@"44", @"26",\
@"44", @"27",\
@"49", @"28",\
@"54", @"29",\
@"54", @"30",\
@"58", @"31",\
@"63", @"32",\
@"63", @"33",\
@"68", @"34",\
@"72", @"35",\
@"72", @"36",\
@"76", @"37",\
@"79", @"38",\
@"79", @"39",\
@"83", @"40",\
@"87", @"41",\
@"87", @"42",\
@"90", @"43",\
@"93", @"44",\
@"93", @"45",\
@"97", @"46",\
@"100", @"47",\
@"100", @"48",\
@"103", @"49",\
@"107", @"50"

#endif /* Macros_h */
