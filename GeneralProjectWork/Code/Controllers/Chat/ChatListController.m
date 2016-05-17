//
//  ChatListController.m
//  GeneralProjectWork
//
//  Created by 吴 吴 on 16/5/17.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import "ChatListController.h"
#import "ChatListSingleChatTableCell.h"
#import "ChatListThreeChatterChatTableCell.h"
#import "ChatListMoreChatterChatTableCell.h"

@interface ChatListController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *dataArray;
    UITableView *infoTable;
}

@end

@implementation ChatListController

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self uploadDataReq];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Set Up UI

- (void)setupUI {
    infoTable = [[UITableView alloc]initWithFrame:AppFrame(0, 0, self.view.width, self.view.height) style:UITableViewStylePlain];
    infoTable.backgroundColor = [UIColor clearColor];
    infoTable.separatorColor = [UIColor clearColor];
    infoTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    infoTable.dataSource = self;
    infoTable.delegate = self;
    [self.view addSubview:infoTable];
}

#pragma mark - Data Source

- (void)uploadDataReq {
    NSDictionary *dic0 = @{@"chatter":@[@"chatList_singleUser_0"],
                           @"name":@"Emma Tang",
                           @"content":@"改天一起出来吃饭吧！",
                           @"time":@"上午10:59"};
    
    NSDictionary *dic1 = @{@"chatter":@[@"chatList_singleUser_1"],
                           @"name":@"上海宠物交流群",
                           @"content":@"我家猫最近得了猫癣怎么办?",
                           @"time":@"星期日"};
    
    NSDictionary *dic2 = @{@"chatter":@[@"chatList_singleUser_2"],
                           @"name":@"王CAT",@"content":@"改天一起出来遛狗吧吧！",
                           @"time":@"星期一"};
    
    NSDictionary *dic3 = @{@"chatter":@[@"chatList_moreChat_0",@"chatList_moreChat_1",@"chatList_moreChat_2"],
                           @"name":@"多人会话-三人",
                           @"content":@"小伙伴们这个周六都有空吗?",
                           @"time":@"下午17:20"};
    
    NSDictionary *dic4 = @{@"chatter":@[@"chatList_moreChat_0",@"chatList_moreChat_1",@"chatList_moreChat_2",@"chatList_moreChat_2"],
                           @"name":@"多人会话-四人",
                           @"content":@"小伙伴们这个周六都有空吗?",
                           @"time":@"下午17:22"};
    
    NSArray *chatterArr = @[@"chatList_moreChat_0",
                            @"chatList_moreChat_1",
                            @"chatList_moreChat_2",
                            @"chatList_moreChat_2",
                            @"chatList_moreChat_1",
                            @"chatList_moreChat_2",
                            @"chatList_moreChat_2"];
    
    NSDictionary *dic5 = @{@"chatter":chatterArr,
                           @"name":@"多人会话-周末有空",
                           @"content":@"小伙伴们这个周日都有空吗?",
                           @"time":@"下午17:30"};
    dataArray = [NSMutableArray arrayWithObjects:dic3,dic0,dic4,dic1,dic2,dic5,nil];
    [infoTable reloadData];
}

#pragma mark - UITableView DataSource && Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row>=dataArray.count) {
        return nil;
    }
    NSDictionary *tempDic = dataArray[indexPath.row];
    NSArray *chatterUserArr = [tempDic getArrayValueForKey:@"chatter"];
    if (chatterUserArr.count == 1)
    {
        static NSString *cellID = @"DiscoveryTableCell";
        ChatListSingleChatTableCell *cell = (ChatListSingleChatTableCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[ChatListSingleChatTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        cell.backgroundColor = [UIColor whiteColor];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if (chatterUserArr.count == 3)
    {
        static NSString *cellID = @"ChatListThreeChatterChatTableCell";
        ChatListThreeChatterChatTableCell *cell = (ChatListThreeChatterChatTableCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[ChatListThreeChatterChatTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        cell.backgroundColor = [UIColor whiteColor];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if (chatterUserArr.count >=4)
    {
        static NSString *cellID = @"ChatListMoreChatterChatTableCell";
        ChatListMoreChatterChatTableCell *cell = (ChatListMoreChatterChatTableCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[ChatListMoreChatterChatTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        cell.backgroundColor = [UIColor whiteColor];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else
    {
        static NSString *cellID = @"UITableViewCell";
        UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        cell.backgroundColor = [UIColor whiteColor];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row>=dataArray.count) {
        return 0;
    }
    NSDictionary *tempDic = dataArray[indexPath.row];
    NSArray *chatterUserArr = [tempDic getArrayValueForKey:@"chatter"];
    if (chatterUserArr.count == 1)
    {
        return [ChatListSingleChatTableCell getCellHeight];
    }
    else if (chatterUserArr.count == 3)
    {
        return [ChatListThreeChatterChatTableCell getCellHeight];
    }
    else if (chatterUserArr.count >=4)
    {
        return [ChatListMoreChatterChatTableCell getCellHeight];
    }
    else
    {
        return 0.0;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row>=dataArray.count) {
        return ;
    }
    NSDictionary *tempDic = dataArray[indexPath.row];
    NSArray *chatterUserArr = [tempDic getArrayValueForKey:@"chatter"];
    if (chatterUserArr.count == 1)
    {
        [((ChatListSingleChatTableCell*)cell)initCellWithDic:tempDic];
    }
    else if (chatterUserArr.count == 3)
    {
        [((ChatListThreeChatterChatTableCell*)cell)initCellWithDic:tempDic];
    }
    else if (chatterUserArr.count >=4)
    {
        [((ChatListMoreChatterChatTableCell*)cell)initCellWithDic:tempDic];
    }
    else
    {
        NSAssert(@"", nil);
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

@end
