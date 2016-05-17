//
//  ChatListThreeChatterChatTableCell.m
//  GeneralProjectWork
//
//  Created by 吴 吴 on 16/5/17.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import "ChatListThreeChatterChatTableCell.h"

@implementation ChatListThreeChatterChatTableCell
{
    UIImageView *userIconOne;
    UIImageView *userIconTwo;
    UIImageView *userIconThree;
    UILabel     *timeLbl;
    UILabel     *nameLbl;
    UILabel     *contentLbl;
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
    self.height = 70.0;
    self.width = AppScreenWidth;
    
    userIconOne = [[UIImageView alloc]initWithFrame:AppFrame(26,9.5,24,24)];
    userIconOne.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:userIconOne];
    
    userIconTwo = [[UIImageView alloc]initWithFrame:AppFrame(13,userIconOne.bottom+3,24,24)];
    userIconTwo.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:userIconTwo];
    
    userIconThree = [[UIImageView alloc]initWithFrame:AppFrame(userIconTwo.right+2,userIconTwo.top,24,24)];
    userIconThree.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:userIconThree];
    
    timeLbl = [[UILabel alloc]initWithFrame:AppFrame(self.width-10-100,18,100,12.5)];
    timeLbl.textColor = [UIColor colorWithHexString:@"#6eb3bc"];
    timeLbl.font = [UIFont systemFontOfSize:11.5];
    timeLbl.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:timeLbl];
    
    nameLbl = [[UILabel alloc]initWithFrame:AppFrame(62+10.5,16, self.width-62-10.5,15)];
    nameLbl.textColor = [UIColor colorWithHexString:@"#1a2223"];
    nameLbl.font = FONT14;
    nameLbl.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:nameLbl];
    
    contentLbl = [[UILabel alloc]initWithFrame:AppFrame(nameLbl.left,nameLbl.bottom+10.5,self.width-nameLbl.left,13.5)];
    contentLbl.textColor = [UIColor colorWithHexString:@"#939595"];
    contentLbl.font = [UIFont systemFontOfSize:12.5];
    contentLbl.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:contentLbl];
    
    UIImageView *gapLine = [[UIImageView alloc]initWithFrame:AppFrame((self.width-593.0/2)/2,self.height-0.5,593.0/2, 0.5)];
    gapLine.backgroundColor = [UIColor clearColor];
    gapLine.image = [UIImage imageNamed:@"chatList_gapline"];
    [self.contentView addSubview:gapLine];
}

#pragma mark - Data Source

- (void)initCellWithDic:(NSDictionary *)dic {
    NSArray *chatUserArr = [dic getArrayValueForKey:@"chatter"];
    if (chatUserArr.count ==3)
    {
        if ([chatUserArr[0]hasPrefix:@"http"])
        {
            [userIconOne sd_setImageWithURL:[NSURL URLWithString:chatUserArr[0]] placeholderImage:nil];
        }
        else
        {
            userIconOne.image = [UIImage imageNamed:chatUserArr[0]];
        }
        if ([chatUserArr[1]hasPrefix:@"http"])
        {
            [userIconTwo sd_setImageWithURL:[NSURL URLWithString:chatUserArr[1]] placeholderImage:nil];
        }
        else
        {
            userIconTwo.image = [UIImage imageNamed:chatUserArr[1]];
        }
        if ([chatUserArr[2]hasPrefix:@"http"])
        {
            [userIconThree sd_setImageWithURL:[NSURL URLWithString:chatUserArr[2]] placeholderImage:nil];
        }
        else
        {
            userIconThree.image = [UIImage imageNamed:chatUserArr[2]];
        }
    }
    
    timeLbl.text = [dic getStringValueForKey:@"time"];
    nameLbl.text = [dic getStringValueForKey:@"name"];
    contentLbl.text = [dic getStringValueForKey:@"content"];
}

#pragma mark - Get Cell Height

+ (CGFloat)getCellHeight {
    return 70.0;
}

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
