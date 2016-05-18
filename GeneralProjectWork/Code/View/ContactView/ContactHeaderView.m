//
//  ContactHeaderView.m
//  GeneralProjectWork
//
//  Created by 吴 吴 on 16/5/18.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import "ContactHeaderView.h"

#define CATEGORYNUM    4

@implementation ContactHeaderView
{
    UIView * gapLine;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    NSArray *arr = @[@"好友",@"关注",@"粉丝",@"群组"];
    float btnW = self.width/CATEGORYNUM;
    for (int i = 0; i <CATEGORYNUM; i ++)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = AppFrame(btnW*i,0,btnW,self.height);
        [btn setTitleColor:[UIColor colorWithHexString:@"#cee4e9"] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateSelected];
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        btn.tag = i +ButtonBaseTag;
        btn.selected = NO;
        btn.titleLabel.font =FONT16;
        [btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0)
        {
            btn.selected = YES;
        }
        [self addSubview:btn];
    }
    /**
     * 底部条
     */
    UIView * bottomLine = [[UIView alloc]initWithFrame:AppFrame(0,self.height-0.25,self.width,0.25)];
    bottomLine.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
    [self addSubview:bottomLine];
    
    /**
     * 标记当前点击的按钮的黄色线
     */
    gapLine = [[UIView alloc]initWithFrame:AppFrame(0,self.height-2,btnW,2)];
    gapLine.backgroundColor = [UIColor colorWithHexString:@"#ffb800"];
    [self addSubview:gapLine];
}


- (void)btnPressed:(UIButton *)sender {
    NSInteger index = sender.tag - ButtonBaseTag;
    for (int i = 0; i < CATEGORYNUM; i++)
    {
        NSInteger btnTag = i+ButtonBaseTag;
        UIButton *btn = (UIButton *)[self viewWithTag:btnTag];
        if (i == index)
        {
            btn.selected = YES;
        }
        else
        {
            btn.selected = NO;
        }
    }
    gapLine.frame = AppFrame(self.width*index/CATEGORYNUM,self.height-2,self.width/CATEGORYNUM,2);
    [self.delegate changeCategoryWithIndex:index];
}


@end
