//
//  ContactListTableCell.h
//  GeneralProjectWork
//
//  Created by 吴 吴 on 16/5/18.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactListTableCell : UITableViewCell

- (void)initCellWithDic:(NSDictionary *)dic;
+ (CGFloat)getCellHeight;

@end
