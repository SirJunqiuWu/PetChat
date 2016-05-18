//
//  ContactListTableCell.m
//  GeneralProjectWork
//
//  Created by 吴 吴 on 16/5/18.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import "ContactListTableCell.h"

@implementation ContactListTableCell
{
    UIImageView *userIcon;
    UIImageView *petIcon;
    UIImageView *petBrandIcon;
    
    UILabel     *petNameLbl;
    UILabel     *petBrandLbl;
    UILabel     *petAgeLbl;
    UILabel     *petSignLbl;
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
    self.width = AppScreenWidth;
    self.height = 107.0;
    
    petIcon = [[UIImageView alloc]initWithFrame:AppFrame(10,20,87,87)];
    petIcon.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:petIcon];
    
    UIImageView *cellBg = [[UIImageView alloc]initWithFrame:AppFrame(petIcon.right,20,self.width-petIcon.right-10,87)];
    cellBg.image = [UIImage imageNamed:@"contactCellBg"];
    [self.contentView addSubview:cellBg];
    
    UIView * headerLine = [[UIView alloc]initWithFrame:AppFrame(self.width-44-2,0,2,6)];
    headerLine.backgroundColor = [UIColor whiteColor];
    headerLine.alpha = 0.3;
    [self.contentView addSubview:headerLine];
    
    userIcon = [[UIImageView alloc]initWithFrame:AppFrame(self.width-44-2-17,headerLine.bottom,34,34)];
    userIcon.backgroundColor = [UIColor clearColor];
    userIcon.layer.cornerRadius = userIcon.height/2;
    userIcon.layer.masksToBounds = YES;
    [self.contentView addSubview:userIcon];
    
    petNameLbl = [[UILabel alloc]initWithFrame:AppFrame(10,8,157,15)];
    petNameLbl.textColor = [UIColor colorWithHexString:@"#000000"];
    petNameLbl.font = FONT14;
    petNameLbl.textAlignment = NSTextAlignmentLeft;
    [cellBg addSubview:petNameLbl];
    
    petBrandIcon = [[UIImageView alloc]initWithFrame:AppFrame(petNameLbl.left,petNameLbl.bottom+6,18.7,17)];
    petBrandIcon.backgroundColor = [UIColor clearColor];
    [cellBg addSubview:petBrandIcon];
    
    petBrandLbl = [[UILabel alloc]initWithFrame:AppFrame(petBrandIcon.right+6,petBrandIcon.top,157,13)];
    petBrandLbl.textColor = [UIColor colorWithHexString:@"#8d8d8d"];
    petBrandLbl.font = FONT12;
    petBrandLbl.textAlignment = NSTextAlignmentLeft;
    [cellBg addSubview:petBrandLbl];
    
    UIImageView *petBirthIcon = [[UIImageView alloc]initWithFrame:AppFrame(petNameLbl.left,petBrandIcon.bottom+6,11.5,11.5)];
    petBirthIcon.backgroundColor = [UIColor clearColor];
    petBirthIcon.image = [UIImage imageNamed:@"petBirthIcon"];
    [cellBg addSubview:petBirthIcon];
    
    petAgeLbl = [[UILabel alloc]initWithFrame:AppFrame(petBirthIcon.right+6,petBrandIcon.bottom+6,157,13)];
    petAgeLbl.textColor = [UIColor colorWithHexString:@"#8d8d8d"];
    petAgeLbl.font = FONT12;
    petAgeLbl.textAlignment = NSTextAlignmentLeft;
    [cellBg addSubview:petAgeLbl];
    
    petSignLbl = [[UILabel alloc]initWithFrame:AppFrame(petBrandIcon.left,petBirthIcon.bottom+6,157,13)];
    petSignLbl.textColor = [UIColor colorWithHexString:@"#8d8d8d"];
    petSignLbl.font = FONT12;
    petSignLbl.textAlignment = NSTextAlignmentLeft;
    [cellBg addSubview:petSignLbl];
}

#pragma mark - Data Source

- (void)initCellWithDic:(NSDictionary *)dic {
    petIcon.image = [UIImage imageNamed:@"contactPetIcon"];
    userIcon.image = [UIImage imageNamed:@"contactUserIcon"];
    petNameLbl.text = @"JoJo";
    petBrandLbl.text = @"苏格兰折耳";
    petBrandIcon.image = [UIImage imageNamed:@"pet_13_male"];
    petAgeLbl.text = @"11个月";
    petSignLbl.text = @"想不起某年某天,你闯进视线";
}

#pragma mark - Get Cell Height

+ (CGFloat)getCellHeight {
    return 20.0+87.0;
}

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
