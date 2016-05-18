//
//  ContactController.m
//  GeneralProjectWork
//
//  Created by 吴 吴 on 16/5/17.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import "ContactController.h"
#import "ContactHeaderView.h"
#import "ContactListTableCell.h"

@interface ContactController ()<ContactHeaderViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    ContactHeaderView *contactHeaderView;
    
    NSMutableArray *dataArray;
    UITableView *infoTable;
}

@end

@implementation ContactController

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
    contactHeaderView = [[ContactHeaderView alloc]initWithFrame:AppFrame(0, 0, AppScreenWidth,44)];
    contactHeaderView.delegate = self;
    [self.view addSubview:contactHeaderView];
    
    infoTable = [[UITableView alloc]initWithFrame:AppFrame(0,44, self.view.width,AppScreenHeight-64-44-49) style:UITableViewStylePlain];
    infoTable.backgroundColor = [UIColor clearColor];
    infoTable.separatorColor = [UIColor clearColor];
    infoTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    infoTable.showsVerticalScrollIndicator = NO;
    infoTable.dataSource = self;
    infoTable.delegate = self;
    [self.view addSubview:infoTable];
}

#pragma mark - Data Source

- (void)uploadDataReq {
    dataArray = [NSMutableArray arrayWithObjects:@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",nil];
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
    static NSString *cellID = @"ContactListTableCell";
    ContactListTableCell *cell = (ContactListTableCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[ContactListTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [ContactListTableCell getCellHeight];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [((ContactListTableCell *)cell)initCellWithDic:nil];
}

#pragma mark - ContactHeaderViewDelegate

- (void)changeCategoryWithIndex:(NSInteger)index {
    NSAssert(@"", nil);
}

@end
