//
//  MyTabBarController.m
//  GeneralProjectWork
//
//  Created by 吴 吴 on 16/3/25.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import "MyTabBarController.h"

@interface MyTabBarController ()<UITabBarControllerDelegate>

@end

@implementation MyTabBarController
@synthesize nearVC,contactVC,chatListVC,discoveryVC,myCenterVC;

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.modalPresentationCapturesStatusBarAppearance = NO;
    self.delegate = self;
    /**
     *  未选中状态下的字体、颜色
     */
    UIFont *unSelectFont = FONT12;
    UIColor *unSelectColor = [UIColor colorWithHexString:@"#949494"];
    /**
     *  选中状态下的字体、颜色
     */
    UIFont *selectFont = FONT12;
    UIColor *selectColor = [UIColor colorWithHexString:@"#ffffff"];
    
    NSDictionary *attributeDicNor = @{NSFontAttributeName:unSelectFont,NSForegroundColorAttributeName:unSelectColor};
    NSDictionary *attributeDicSelect = @{NSFontAttributeName:selectFont,NSForegroundColorAttributeName:selectColor};
    
    /**
     *  首页
     */
    nearVC = [[NearController alloc]init];
    CRNavigationController *navOne = [[CRNavigationController alloc]initWithRootViewController:nearVC];
    nearVC.title = @"附近";
    
    /**
     *  联系人
     */
    contactVC = [[ContactController alloc]init];
    CRNavigationController *navTwo = [[CRNavigationController alloc]initWithRootViewController:contactVC];
    contactVC.title = @"联系人";
    
    /**
     *  聊天
     */
    chatListVC = [[ChatListController alloc]init];
    CRNavigationController *navThree = [[CRNavigationController alloc]initWithRootViewController:chatListVC];
    chatListVC.title = @"聊天";
    
    /**
     *  发现
     */
    discoveryVC = [[DiscoveryController alloc]init];
    CRNavigationController *navFour = [[CRNavigationController alloc]initWithRootViewController:discoveryVC];
    discoveryVC.title = @"发现";
    
    /**
     *  我的
     */
    myCenterVC = [[MyCenterController alloc]init];
    CRNavigationController *navFive = [[CRNavigationController alloc]initWithRootViewController:myCenterVC];
    myCenterVC.title = @"我的";
    
    self.viewControllers = [NSArray arrayWithObjects:navOne,navTwo,navThree,navFour,navFive,nil];
    for (int i = 0; i<self.viewControllers.count;i++)
    {
        UIViewController *tpViewController = [self.viewControllers objectAtIndex:i];
        tpViewController.tabBarItem.tag = i;
        UIImage *tabbarImage = [UIImage imageNamed:[NSString stringWithFormat:@"tab_0%i_N",i+1]];
        UIImage *tabbarSelectImage = [UIImage imageNamed:[NSString stringWithFormat:@"tab_0%i_S",i+1]];
        tpViewController.tabBarItem.image = [tabbarImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        tpViewController.tabBarItem.selectedImage = [tabbarSelectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [tpViewController.tabBarItem setTitleTextAttributes:attributeDicNor forState:UIControlStateNormal];
        [tpViewController.tabBarItem setTitleTextAttributes:attributeDicSelect forState:UIControlStateSelected];
    }
    
    self.tabBar.barTintColor = [UIColor blackColor];
    self.tabBar.backgroundColor = [UIColor blackColor];
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tabbar_bk"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITabBarControllerDelegate

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    /**
     *  在这里可以拦截tabBarItem点击事件
     */
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
}


@end
