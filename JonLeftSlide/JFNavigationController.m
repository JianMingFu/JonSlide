//
//  JFNavigationController.m
//  JonLeftSlide
//
//  Created by Jon Fu on 2018/6/25.
//  Copyright © 2018年 Jon Fu. All rights reserved.
//

#import "JFNavigationController.h"
#import "JFSlideManager.h"

@interface JFNavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation JFNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
    [[JFSlideManager sharedInstance].slideVC setPanEnabled:NO];
    [super pushViewController:viewController animated:animated];
    
}

-(UIViewController *)popViewControllerAnimated:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
    NSLog(@"%@-----%@",self.viewControllers.firstObject,self.viewControllers.lastObject);
    
    
    if (self.viewControllers.count == 2) {
        [[JFSlideManager sharedInstance].slideVC setPanEnabled:YES];
    }
    return  [super popViewControllerAnimated:animated];
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
