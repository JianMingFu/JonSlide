//
//  AppDelegate.h
//  JonLeftSlide
//
//  Created by Jon Fu on 2018/6/25.
//  Copyright © 2018年 Jon Fu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JFNavigationController.h"
#import "JFTabBarViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) JFNavigationController *navigationController;
@property (strong, nonatomic) JFTabBarViewController *tabBarController;
+ (instancetype)shareInstance;
@end

