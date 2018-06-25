//
//  JFDetailViewController.m
//  JonLeftSlide
//
//  Created by Jon Fu on 2018/6/25.
//  Copyright © 2018年 Jon Fu. All rights reserved.
//

#import "JFDetailViewController.h"
#import "AppDelegate.h"

@interface JFDetailViewController ()

@end

@implementation JFDetailViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"欢迎来到召唤师峡谷";
    self.view.backgroundColor = [UIColor blueColor];
    self.tabBarController.tabBar.hidden = YES;
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
