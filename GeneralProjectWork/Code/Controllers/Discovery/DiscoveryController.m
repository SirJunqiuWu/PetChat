//
//  DiscoveryController.m
//  GeneralProjectWork
//
//  Created by 吴 吴 on 16/5/17.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import "DiscoveryController.h"
#import "DiscoveryTableCell.h"

@interface DiscoveryController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *dataArray;
    UITableView *infoTable;
}

@end

@implementation DiscoveryController

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
    NSDictionary *dic0 = @{@"icon":@"discovery_icon_0",@"title":@"朋友动态",@"isSelected":@"0"};
    NSDictionary *dic1 = @{@"icon":@"discovery_icon_1",@"title":@"宠聊群组",@"isSelected":@"0"};
    NSDictionary *dic2 = @{@"icon":@"discovery_icon_2",@"title":@"宠聊喊话",@"isSelected":@"0"};
    NSDictionary *dic3 = @{@"icon":@"discovery_icon_3",@"title":@"宠聊俱乐部",@"isSelected":@"0"};
    NSDictionary *dic4 = @{@"icon":@"discovery_icon_4",@"title":@"游戏中心",@"isSelected":@"0"};
    NSDictionary *dic5 = @{@"icon":@"discovery_icon_5",@"title":@"宠聊活动",@"isSelected":@"0"};
    dataArray = [NSMutableArray arrayWithObjects:dic0,dic1,dic2,dic3,dic4,dic5,nil];
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
    static NSString *cellID = @"DiscoveryTableCell";
    DiscoveryTableCell *cell = (DiscoveryTableCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[DiscoveryTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [DiscoveryTableCell getCellHeight];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [((DiscoveryTableCell*)cell) initCellWithDic:dataArray[indexPath.row]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0)
    {
        [dataArray replaceObjectAtIndex:0 withObject:@{@"icon":@"discovery_icon_0",@"title":@"朋友动态",@"isSelected":@"1"}];
        [dataArray replaceObjectAtIndex:1 withObject:@{@"icon":@"discovery_icon_1",@"title":@"宠聊群组",@"isSelected":@"0"}];
        [dataArray replaceObjectAtIndex:2 withObject:@{@"icon":@"discovery_icon_2",@"title":@"宠聊喊话",@"isSelected":@"0"}];
        [dataArray replaceObjectAtIndex:3 withObject:@{@"icon":@"discovery_icon_3",@"title":@"宠聊俱乐部",@"isSelected":@"0"}];
        [dataArray replaceObjectAtIndex:4 withObject:@{@"icon":@"discovery_icon_4",@"title":@"游戏中心",@"isSelected":@"0"}];
        [dataArray replaceObjectAtIndex:5 withObject:@{@"icon":@"discovery_icon_5",@"title":@"宠聊活动",@"isSelected":@"0"}];
    }
    else if (indexPath.row == 1)
    {
        [dataArray replaceObjectAtIndex:0 withObject:@{@"icon":@"discovery_icon_0",@"title":@"朋友动态",@"isSelected":@"0"}];
        [dataArray replaceObjectAtIndex:1 withObject:@{@"icon":@"discovery_icon_1",@"title":@"宠聊群组",@"isSelected":@"1"}];
        [dataArray replaceObjectAtIndex:2 withObject:@{@"icon":@"discovery_icon_2",@"title":@"宠聊喊话",@"isSelected":@"0"}];
        [dataArray replaceObjectAtIndex:3 withObject:@{@"icon":@"discovery_icon_3",@"title":@"宠聊俱乐部",@"isSelected":@"0"}];
        [dataArray replaceObjectAtIndex:4 withObject:@{@"icon":@"discovery_icon_4",@"title":@"游戏中心",@"isSelected":@"0"}];
        [dataArray replaceObjectAtIndex:5 withObject:@{@"icon":@"discovery_icon_5",@"title":@"宠聊活动",@"isSelected":@"0"}];
    }
    else if (indexPath.row == 2)
    {
        [dataArray replaceObjectAtIndex:0 withObject:@{@"icon":@"discovery_icon_0",@"title":@"朋友动态",@"isSelected":@"0"}];
        [dataArray replaceObjectAtIndex:1 withObject:@{@"icon":@"discovery_icon_1",@"title":@"宠聊群组",@"isSelected":@"0"}];
        [dataArray replaceObjectAtIndex:2 withObject:@{@"icon":@"discovery_icon_2",@"title":@"宠聊喊话",@"isSelected":@"1"}];
        [dataArray replaceObjectAtIndex:3 withObject:@{@"icon":@"discovery_icon_3",@"title":@"宠聊俱乐部",@"isSelected":@"0"}];
        [dataArray replaceObjectAtIndex:4 withObject:@{@"icon":@"discovery_icon_4",@"title":@"游戏中心",@"isSelected":@"0"}];
        [dataArray replaceObjectAtIndex:5 withObject:@{@"icon":@"discovery_icon_5",@"title":@"宠聊活动",@"isSelected":@"0"}];
    }
    else if (indexPath.row == 3)
    {
        [dataArray replaceObjectAtIndex:0 withObject:@{@"icon":@"discovery_icon_0",@"title":@"朋友动态",@"isSelected":@"0"}];
        [dataArray replaceObjectAtIndex:1 withObject:@{@"icon":@"discovery_icon_1",@"title":@"宠聊群组",@"isSelected":@"0"}];
        [dataArray replaceObjectAtIndex:2 withObject:@{@"icon":@"discovery_icon_2",@"title":@"宠聊喊话",@"isSelected":@"0"}];
        [dataArray replaceObjectAtIndex:3 withObject:@{@"icon":@"discovery_icon_3",@"title":@"宠聊俱乐部",@"isSelected":@"1"}];
        [dataArray replaceObjectAtIndex:4 withObject:@{@"icon":@"discovery_icon_4",@"title":@"游戏中心",@"isSelected":@"0"}];
        [dataArray replaceObjectAtIndex:5 withObject:@{@"icon":@"discovery_icon_5",@"title":@"宠聊活动",@"isSelected":@"0"}];
    }
    else if (indexPath.row == 4)
    {
        [dataArray replaceObjectAtIndex:0 withObject:@{@"icon":@"discovery_icon_0",@"title":@"朋友动态",@"isSelected":@"0"}];
        [dataArray replaceObjectAtIndex:1 withObject:@{@"icon":@"discovery_icon_1",@"title":@"宠聊群组",@"isSelected":@"0"}];
        [dataArray replaceObjectAtIndex:2 withObject:@{@"icon":@"discovery_icon_2",@"title":@"宠聊喊话",@"isSelected":@"0"}];
        [dataArray replaceObjectAtIndex:3 withObject:@{@"icon":@"discovery_icon_3",@"title":@"宠聊俱乐部",@"isSelected":@"0"}];
        [dataArray replaceObjectAtIndex:4 withObject:@{@"icon":@"discovery_icon_4",@"title":@"游戏中心",@"isSelected":@"1"}];
        [dataArray replaceObjectAtIndex:5 withObject:@{@"icon":@"discovery_icon_5",@"title":@"宠聊活动",@"isSelected":@"0"}];
    }
    else if (indexPath.row == 5)
    {
        [dataArray replaceObjectAtIndex:0 withObject:@{@"icon":@"discovery_icon_0",@"title":@"朋友动态",@"isSelected":@"0"}];
        [dataArray replaceObjectAtIndex:1 withObject:@{@"icon":@"discovery_icon_1",@"title":@"宠聊群组",@"isSelected":@"0"}];
        [dataArray replaceObjectAtIndex:2 withObject:@{@"icon":@"discovery_icon_2",@"title":@"宠聊喊话",@"isSelected":@"0"}];
        [dataArray replaceObjectAtIndex:3 withObject:@{@"icon":@"discovery_icon_3",@"title":@"宠聊俱乐部",@"isSelected":@"0"}];
        [dataArray replaceObjectAtIndex:4 withObject:@{@"icon":@"discovery_icon_4",@"title":@"游戏中心",@"isSelected":@"0"}];
        [dataArray replaceObjectAtIndex:5 withObject:@{@"icon":@"discovery_icon_5",@"title":@"宠聊活动",@"isSelected":@"1"}];
    }
    else
    {
        NSAssert(@"", nil);
    }
    [infoTable reloadData];
}

@end
