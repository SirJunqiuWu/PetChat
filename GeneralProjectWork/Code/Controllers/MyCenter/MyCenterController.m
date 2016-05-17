//
//  MyCenterController.m
//  GeneralProjectWork
//
//  Created by 吴 吴 on 16/5/17.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import "MyCenterController.h"
#import "MyCenterTableCell.h"
#import "MyCenterHeaderView.h"

@interface MyCenterController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray     *dataArray;
    UITableView        *infoTable;
    MyCenterHeaderView *mycenterHeader;
}

@end

@implementation MyCenterController

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
    mycenterHeader = [[MyCenterHeaderView alloc]initWithFrame:AppFrame(0,0,self.view.width,100)];
    
    infoTable = [[UITableView alloc]initWithFrame:AppFrame(0, 0, self.view.width, self.view.height) style:UITableViewStylePlain];
    infoTable.backgroundColor = [UIColor clearColor];
    infoTable.separatorColor = [UIColor clearColor];
    infoTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    infoTable.tableHeaderView = mycenterHeader;
    infoTable.dataSource = self;
    infoTable.delegate = self;
    [self.view addSubview:infoTable];
}

#pragma mark - Data Source

- (void)uploadDataReq {
    NSDictionary *dic0 = @{@"icon":@"myCenter_icon_0",@"title":@"消息通知"};
    NSDictionary *dic1 = @{@"icon":@"myCenter_icon_1",@"title":@"隐私"};
    NSDictionary *dic2 = @{@"icon":@"myCenter_icon_2",@"title":@"通用"};
    dataArray = [NSMutableArray arrayWithObjects:dic0,dic1,dic2,nil];
    [mycenterHeader initViewWithDic:nil];
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
    static NSString *cellID = @"MyCenterTableCell";
    MyCenterTableCell *cell = (MyCenterTableCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[MyCenterTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [MyCenterTableCell getCellHeight];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [((MyCenterTableCell*)cell) initCellWithDic:dataArray[indexPath.row]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}
@end
