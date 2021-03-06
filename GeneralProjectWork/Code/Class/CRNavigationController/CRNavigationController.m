//
//  CRNavigationController.m
//  CRNavigationControllerExample
//
//  Created by Corey Roberts on 9/24/13.
//  Copyright (c) 2013 SpacePyro Inc. All rights reserved.
//

#import "CRNavigationController.h"
#import "CRNavigationBar.h"


#define IOS7_SDK_AVAILABLE ([[[UIDevice currentDevice] systemVersion] intValue] >= 7)
@interface CRNavigationController ()

@end

@implementation CRNavigationController

- (id)init {
    if (IOS7_SDK_AVAILABLE) {
        self = [super initWithNavigationBarClass:[CRNavigationBar class] toolbarClass:nil];
    }
    else
    {
        self=[super init];
    }
    if(self) {
        // Custom initialization here, if needed.
    }
    return self;
}

- (id)initWithRootViewController:(UIViewController *)rootViewController {
    if (IOS7_SDK_AVAILABLE) {
        self = [super initWithNavigationBarClass:[CRNavigationBar class] toolbarClass:nil];
    }
    else
    {
        self=[super initWithRootViewController:rootViewController];
    }

    if(self) {
        self.viewControllers = @[rootViewController];
    }
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbarBg"] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationBar setShadowImage:[[UIImage alloc] init]];//导航底部间隔线
    self.navigationBar.translucent = NO;
    self.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    self.navigationBar.backgroundColor = [UIColor clearColor];
    
    NSDictionary *attributDic = @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#ffffff"],
                                  NSFontAttributeName:[UIFont boldSystemFontOfSize:16]
                                  };
    self.navigationBar.titleTextAttributes = attributDic;
    
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    return self;
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
}

-(UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    UIViewController *controller = self.topViewController;
    if ([controller isKindOfClass:[BaseViewController class]])
    {
        BaseViewController *viewController = (BaseViewController *)controller;
        if (viewController.backVCClass != nil)
        {
            //返回指定页
            for (UIViewController *tpViewController in self.viewControllers)
            {
                if ([tpViewController isKindOfClass:viewController.backVCClass])
                {
                    //跳转到指定页面
                    return [[self popToViewController:tpViewController animated:animated]lastObject];
                }
            }
            return [super popViewControllerAnimated:animated];
        }
        else
        {
            return [super popViewControllerAnimated:animated];
        }
    }
    else
    {
        return [super popViewControllerAnimated:animated];
    }
}

@end
