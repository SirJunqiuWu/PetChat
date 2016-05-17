//
//  MyCenterTableCell.m
//  GeneralProjectWork
//
//  Created by 吴 吴 on 16/5/17.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import "MyCenterTableCell.h"

@implementation MyCenterTableCell
{
    UIImageView *bgNormal;
    UIImageView *icon;
    UILabel *titlelbl;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

#pragma mark - Set Up UI

- (void)setupUI {
    self.height = 40.0;
    self.width = AppScreenWidth;
    
    bgNormal = [[UIImageView alloc]initWithFrame:AppFrame(0,0,self.width,self.height)];
    bgNormal.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
    bgNormal.alpha = 0.5;
    [self.contentView addSubview:bgNormal];
    
    icon = [[UIImageView alloc]initWithFrame:AppFrame(10,(self.height-19.5)/2, 19.5, 19.5)];
    icon.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:icon];
    
    titlelbl = [[UILabel alloc]initWithFrame:AppFrame(45,(self.height-14)/2, self.width-icon.right-9.5,14)];
    titlelbl.textColor = [UIColor colorWithHexString:@"#063741"];
    titlelbl.font = FONT14;
    titlelbl.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:titlelbl];
    
    UIImageView *arrow = [[UIImageView alloc]initWithFrame:AppFrame(self.width-15-8,(self.height-13.5)/2,8,13.5)];
    arrow.image = [UIImage imageNamed:@"discoveryCellArrow"];
    arrow.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:arrow];
    
    UIImageView *gapLine = [[UIImageView alloc]initWithFrame:AppFrame((self.width-300)/2,self.height-0.5, 300, 0.5)];
    gapLine.backgroundColor = [UIColor clearColor];
    gapLine.image = [UIImage imageNamed:@"myCenter_gapLine"];
    [self.contentView addSubview:gapLine];
}

#pragma mark - Data Source

- (void)initCellWithDic:(NSDictionary *)dic {
    icon.image = [UIImage imageNamed:[dic getStringValueForKey:@"icon"]];
    titlelbl.text = [dic getStringValueForKey:@"title"];
}

#pragma mark - Get Cell Height

+ (CGFloat)getCellHeight {
    return 40.0;
}

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
