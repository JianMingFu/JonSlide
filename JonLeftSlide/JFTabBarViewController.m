//
//  JFTabBarViewController.m
//  JonLeftSlide
//
//  Created by Jon Fu on 2018/6/25.
//  Copyright © 2018年 Jon Fu. All rights reserved.
//

#import "JFTabBarViewController.h"
#import "JFHomeViewController.h"
#import "JFMineViewController.h"
#import "JFSlideManager.h"
#import "UIColor+HexColor.h"

#define MainColor     [UIColor colorWithHexString:@"#33cccc"]
@interface JFTabBarViewController ()<UITabBarControllerDelegate>
@property(nonatomic, strong) UIView *shadowView;
@end

@implementation JFTabBarViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[JFSlideManager sharedInstance].slideVC setPanEnabled:YES];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[JFSlideManager sharedInstance].slideVC setPanEnabled:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.backgroundColor = [UIColor clearColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(shadowView:) name:@"shadowViewNotification" object:nil];
    
    [self.tabBar setTranslucent:NO];
    [[UITabBar appearance] setTintColor: [UIColor greenColor]];
    
    self.delegate = self;
    
    JFHomeViewController *homeVC = [[JFHomeViewController alloc]init];
    homeVC.tabBarItem.title = @"首页";
    homeVC.tabBarItem.image = [[UIImage imageNamed:@"tabBar_find"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabBar_findSelected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeVC.tabBarItem.badgeValue = nil;
    //[findCtn.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:WordColor1} forState:UIControlStateNormal];
    [homeVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:MainColor} forState:UIControlStateSelected];
    
    
    JFMineViewController *mineVC = [[JFMineViewController alloc]init];
    mineVC.tabBarItem.title = @"我的";
    mineVC.tabBarItem.image = [[UIImage imageNamed:@"tabBar_friend"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mineVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabBar_friendSelected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //[friendCtn.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:WordColor1} forState:UIControlStateNormal];
    [mineVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:MainColor} forState:UIControlStateSelected];
    
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    UINavigationController *mineNav = [[UINavigationController alloc] initWithRootViewController:mineVC];

    self.viewControllers = @[homeNav,mineNav];

}


- (void)shadowView:(NSNotification *)noti {
    
    NSString *tag = [noti.userInfo valueForKey:@"tag"];
    
    NSLog(@"%@", tag);
    
    if ([tag isEqualToString:@"open"]) {
        [self.view addSubview:self.shadowView];
    }
    
    if ([tag isEqualToString:@"close"]) {
        [self.shadowView removeFromSuperview];
    }
}

- (UIView *)shadowView {
    
    if (!_shadowView) {
        _shadowView = [[UIView alloc] initWithFrame: [UIScreen mainScreen].bounds];
        _shadowView.backgroundColor = [UIColor colorWithHexString:@"#000000" alpha:0.4];
    }
    return _shadowView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
