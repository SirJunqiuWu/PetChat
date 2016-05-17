//
//  DiscoveryTableCell.m
//  GeneralProjectWork
//
//  Created by 吴 吴 on 16/5/17.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import "DiscoveryTableCell.h"

@implementation DiscoveryTableCell
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
    bgNormal = [[UIImageView alloc]initWithFrame:AppFrame(10, 10, AppScreenWidth-20, 49)];
    bgNormal.image = [UIImage imageNamed:@"discoveryCellbgN"];
    bgNormal.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:bgNormal];
    
    icon = [[UIImageView alloc]initWithFrame:AppFrame(10,(bgNormal.height-23)/2, 23, 23)];
    icon.backgroundColor = [UIColor clearColor];
    [bgNormal addSubview:icon];
    
    titlelbl = [[UILabel alloc]initWithFrame:AppFrame(icon.right+9.5,(bgNormal.height-16)/2, bgNormal.width-icon.right-9.5, 16)];
    titlelbl.textColor = [UIColor colorWithHexString:@"#000000"];
    titlelbl.font = FONT16;
    titlelbl.textAlignment = NSTextAlignmentLeft;
    [bgNormal addSubview:titlelbl];
    
    UIImageView *arrow = [[UIImageView alloc]initWithFrame:AppFrame(bgNormal.width-10-8,(bgNormal.height-13.5)/2,8,13.5)];
    arrow.image = [UIImage imageNamed:@"discoveryCellArrow"];
    arrow.backgroundColor = [UIColor clearColor];
    [bgNormal addSubview:arrow];
}

#pragma mark - Data Source

- (void)initCellWithDic:(NSDictionary *)dic {
    icon.image = [UIImage imageNamed:[dic getStringValueForKey:@"icon"]];
    titlelbl.text = [dic getStringValueForKey:@"title"];
    bgNormal.image = [dic getStringValueForKey:@"isSelected"].intValue == 0?[UIImage imageNamed:@"discoveryCellbgN"]:[UIImage imageNamed:@"discoveryCellbgS"];
}

#pragma mark - Get Cell Height

+ (CGFloat)getCellHeight {
    return 20.0 + 49.0;
}

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
