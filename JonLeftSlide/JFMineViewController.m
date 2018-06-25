//
//  JFMineViewController.m
//  JonLeftSlide
//
//  Created by Jon Fu on 2018/6/25.
//  Copyright © 2018年 Jon Fu. All rights reserved.
//

#import "JFMineViewController.h"

@interface JFMineViewController ()

@end

@implementation JFMineViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[JFSlideManager sharedInstance].slideVC setPanEnabled:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    self.view.backgroundColor = [UIColor yellowColor];
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
