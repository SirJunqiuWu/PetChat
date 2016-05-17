//
//  ChatListSingleChatTableCell.m
//  GeneralProjectWork
//
//  Created by 吴 吴 on 16/5/17.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import "ChatListSingleChatTableCell.h"

@implementation ChatListSingleChatTableCell
{
    UIImageView *userIcon;
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
    
    userIcon = [[UIImageView alloc]initWithFrame:AppFrame(12,(self.height-50)/2, 50, 50)];
    userIcon.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:userIcon];
    
    timeLbl = [[UILabel alloc]initWithFrame:AppFrame(self.width-10-100,18,100,12.5)];
    timeLbl.textColor = [UIColor colorWithHexString:@"#6eb3bc"];
    timeLbl.font = [UIFont systemFontOfSize:11.5];
    timeLbl.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:timeLbl];
    
    nameLbl = [[UILabel alloc]initWithFrame:AppFrame(userIcon.right+10.5,16, self.width-userIcon.right-10.5,15)];
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
    if (chatUserArr.count >0)
    {
        if ([chatUserArr[0]hasPrefix:@"http"])
        {
            [userIcon sd_setImageWithURL:[NSURL URLWithString:chatUserArr[0]] placeholderImage:nil];
        }
        else
        {
            userIcon.image = [UIImage imageNamed:chatUserArr[0]];
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
