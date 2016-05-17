//
//  ChatListMoreChatterChatTableCell.m
//  GeneralProjectWork
//
//  Created by 吴 吴 on 16/5/17.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import "ChatListMoreChatterChatTableCell.h"

@implementation ChatListMoreChatterChatTableCell
{
    UIImageView *userIconOne;
    UIImageView *userIconTwo;
    UIImageView *userIconThree;
    UIImageView *userIconFour;
    
    UILabel     *timeLbl;
    UILabel     *nameLbl;
    UILabel     *contentLbl;
    UILabel     *countLbl;
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
    
    /**
     * User HeaderIcon
     */
    userIconOne = [[UIImageView alloc]initWithFrame:AppFrame(12,10,24,24)];
    userIconOne.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:userIconOne];
    
    userIconTwo = [[UIImageView alloc]initWithFrame:AppFrame(userIconOne.right+2,userIconOne.top,24,24)];
    userIconTwo.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:userIconTwo];
    
    userIconThree = [[UIImageView alloc]initWithFrame:AppFrame(12,userIconTwo.bottom+2,24,24)];
    userIconThree.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:userIconThree];
    
    userIconFour = [[UIImageView alloc]initWithFrame:AppFrame(userIconThree.right+2,userIconThree.top,24,24)];
    userIconFour.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:userIconFour];
    
    /**
     * Chatter time
     */
    timeLbl = [[UILabel alloc]initWithFrame:AppFrame(self.width-10-100,18,100,12.5)];
    timeLbl.textColor = [UIColor colorWithHexString:@"#6eb3bc"];
    timeLbl.font = [UIFont systemFontOfSize:11.5];
    timeLbl.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:timeLbl];
    
    /**
     * Chatter Name
     */
    nameLbl = [[UILabel alloc]initWithFrame:AppFrame(62+10.5,16, self.width-62-10.5,15)];
    nameLbl.textColor = [UIColor colorWithHexString:@"#1a2223"];
    nameLbl.font = FONT14;
    nameLbl.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:nameLbl];
    
    /**
     * Chatter content
     */
    contentLbl = [[UILabel alloc]initWithFrame:AppFrame(nameLbl.left,nameLbl.bottom+10.5,self.width-nameLbl.left,13.5)];
    contentLbl.textColor = [UIColor colorWithHexString:@"#939595"];
    contentLbl.font = [UIFont systemFontOfSize:12.5];
    contentLbl.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:contentLbl];
    
    /**
     * Chatter Count
     */
    countLbl = [[UILabel alloc]initWithFrame:AppFrame(0,0,userIconFour.width,userIconFour.height)];
    countLbl.textColor = [UIColor colorWithHexString:@"#ffffff"];
    countLbl.font = [UIFont systemFontOfSize:12.5];
    countLbl.textAlignment = NSTextAlignmentCenter;
    [userIconFour addSubview:countLbl];
    
    UIImageView *gapLine = [[UIImageView alloc]initWithFrame:AppFrame((self.width-593.0/2)/2,self.height-0.5,593.0/2, 0.5)];
    gapLine.backgroundColor = [UIColor clearColor];
    gapLine.image = [UIImage imageNamed:@"chatList_gapline"];
    [self.contentView addSubview:gapLine];
}

#pragma mark - Data Source

- (void)initCellWithDic:(NSDictionary *)dic {
    NSArray *chatUserArr = [dic getArrayValueForKey:@"chatter"];
    if (chatUserArr.count >=4)
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
        if (chatUserArr.count == 4)
        {
            if ([chatUserArr[3]hasPrefix:@"http"])
            {
                [userIconFour sd_setImageWithURL:[NSURL URLWithString:chatUserArr[3]] placeholderImage:nil];
            }
            else
            {
                userIconFour.image = [UIImage imageNamed:chatUserArr[3]];
            }
        }
        else
        {
            userIconFour.image = [UIImage imageNamed:@"chatList_more_bg"];
            countLbl.text = [NSString stringWithFormat:@"%ld",(long)chatUserArr.count];
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
