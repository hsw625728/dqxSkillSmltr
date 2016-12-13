//
//  SDTableJobLevelCell.m
//  dqxSkillSmltr
//
//  Created by HANSHAOWEN on 16/12/12.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSTableJobLevelCell.h"
#import "DSTableJobLevelCellItem.h"
#import "View+MASAdditions.h"

NSString *const kDSTableJobLevelCellID = @"kDSTableJobLevelCellID";

@interface DSTableJobLevelCell ()

@property (strong, nonatomic) UIImageView *coverView;
@property (strong, nonatomic) UIStepper *setView;
@property (strong, nonatomic) UILabel *labelView;
@property (strong, nonatomic) UITextField *levelView;


@end

@implementation DSTableJobLevelCell

#pragma mark - Class Method

+ (CGFloat)cellHeight {
    return 48;
}

#pragma mark - View Lifecycle

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setupViews];
    }
    
    return self;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    _coverView.image = nil;
}

#pragma mark - Private Method

- (void)setupViews {
    if (_coverView) {
        return;
    }
    const int ICON_WIDE = 88;
    const int ICON_HEIGH = 29;
    self.accessoryType = UITableViewCellAccessoryNone;
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    CGFloat contentViewWidth = CGRectGetWidth([UIScreen mainScreen ].applicationFrame);
    CGFloat lableX = ICON_WIDE + 8*2;
    CGFloat lableWidth = (contentViewWidth - lableX)/5;
    
    _coverView = ({
        UIImageView *imageView = [UIImageView new];
        imageView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.sizeOffset(CGSizeMake(ICON_WIDE, ICON_HEIGH));
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(8);
        }];
        
        imageView;
    });
    
    _labelView = ({
        UILabel *label = [[UILabel alloc] init];
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.sizeOffset(CGSizeMake(lableWidth, ICON_HEIGH));
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(lableX);
        }];
        label;
    });
    
    _levelView = ({
        UITextField *text = [[UITextField alloc] init];
        text.borderStyle = UITextBorderStyleRoundedRect;
        [self.contentView addSubview:text];
        [text mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.sizeOffset(CGSizeMake(lableWidth, ICON_HEIGH));
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(lableX + lableWidth);
        }];
        text;
    });
    
    _setView = ({
        UIStepper *stepper = [[UIStepper alloc] init];
        stepper.minimumValue = MIN_SKILL_POINT_LEVEL;
        stepper.maximumValue = MAX_SKILL_POINT_LEVEL;
        stepper.value = MIN_SKILL_POINT_LEVEL;
        stepper.stepValue = 1;
        [self.contentView addSubview:stepper];
        [stepper addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
        [stepper mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.sizeOffset(CGSizeMake(lableWidth*2.5, ICON_HEIGH));
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(lableX + lableWidth*2 + 8);
        }];
        stepper;
    });
}

#pragma mark - Public Method

- (void)configureCellWithJobLevelItem:(DSTableJobLevelCellItem *)item {
    _coverView.image = [UIImage imageNamed:item.iconName];
    _labelView.text = @"等级：";
}

- (void)valueChanged:(UIStepper *)stepper{
    _levelView.text = [NSString stringWithFormat:@"%i", (int)stepper.value];
}

- (NSString*)getLevel{
    return _levelView.text;
}

@end
