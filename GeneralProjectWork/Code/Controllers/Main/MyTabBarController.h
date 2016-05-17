//
//  MyTabBarController.h
//  GeneralProjectWork
//
//  Created by 吴 吴 on 16/3/25.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTabBarController : UITabBarController

@property(nonatomic,strong)NearController      *nearVC;
@property(nonatomic,strong)ContactController   *contactVC;
@property(nonatomic,strong)ChatListController  *chatListVC;
@property(nonatomic,strong)DiscoveryController *discoveryVC;
@property(nonatomic,strong)MyCenterController  *myCenterVC;

@end
