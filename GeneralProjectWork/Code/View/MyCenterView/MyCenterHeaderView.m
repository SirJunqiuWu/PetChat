//
//  MyCenterHeaderView.m
//  GeneralProjectWork
//
//  Created by 吴 吴 on 16/5/17.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import "MyCenterHeaderView.h"

@implementation MyCenterHeaderView
{
    UIImageView *headerIcon;
    UILabel *nameLbl;
    UILabel *petIdLbl;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

#pragma mark - Set Up UI 

- (void)setupUI {
    UIImageView * bgNormal = [[UIImageView alloc]initWithFrame:AppFrame(0,10,self.width,self.height-20)];
    bgNormal.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
    bgNormal.alpha = 0.5;
    [self addSubview:bgNormal];
    
    UIImageView * headerIconBg = [[UIImageView alloc]initWithFrame:AppFrame(13,(bgNormal.height-61)/2,61,61)];
    headerIconBg.backgroundColor = [UIColor clearColor];
    headerIconBg.layer.cornerRadius = headerIconBg.height/2;
    headerIconBg.layer.masksToBounds = YES;
    headerIconBg.image = [UIImage imageNamed:@"myCenter_headerBg"];
    [bgNormal addSubview:headerIconBg];
    
    headerIcon = [[UIImageView alloc]initWithFrame:AppFrame(headerIconBg.left+3,(bgNormal.height-55)/2,55,55)];
    headerIcon.backgroundColor = [UIColor clearColor];
    headerIcon.layer.cornerRadius = headerIconBg.height/2;
    headerIcon.layer.masksToBounds = YES;
    [bgNormal addSubview:headerIcon];
    
    nameLbl = [[UILabel alloc]initWithFrame:AppFrame(headerIconBg.right+8,24.5, bgNormal.width-headerIconBg.right-8, 16)];
    nameLbl.textColor = [UIColor colorWithHexString:@"#063741"];
    nameLbl.font = FONT15;
    nameLbl.textAlignment = NSTextAlignmentLeft;
    [bgNormal addSubview:nameLbl];
    
    petIdLbl = [[UILabel alloc]initWithFrame:AppFrame(headerIconBg.right+8,nameLbl.bottom+7, bgNormal.width-headerIconBg.right-8,13.5)];
    petIdLbl.textColor = [UIColor colorWithHexString:@"#738f95"];
    petIdLbl.font = [UIFont systemFontOfSize:12.5];
    petIdLbl.textAlignment = NSTextAlignmentLeft;
    [bgNormal addSubview:petIdLbl];
    
    UIImageView *arrow = [[UIImageView alloc]initWithFrame:AppFrame(bgNormal.width-15-8,(bgNormal.height-13.5)/2,8,13.5)];
    arrow.image = [UIImage imageNamed:@"discoveryCellArrow"];
    arrow.backgroundColor = [UIColor clearColor];
    [bgNormal addSubview:arrow];
}

#pragma mark - Data Source

- (void)initViewWithDic:(NSDictionary *)dic {
    [headerIcon sd_setImageWithURL:[NSURL URLWithString:@"https://gw.alicdn.com/bao/uploaded/TB19NLvKpXXXXc2aXXXSutbFXXX.jpg_170x170.jpg"] placeholderImage:nil];
    nameLbl.text = @"暖源";
    petIdLbl.text = [NSString stringWithFormat:@"宠聊号:%@",@"6008956"];
}

@end
