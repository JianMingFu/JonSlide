//
//  JFHomeViewController.m
//  JonLeftSlide
//
//  Created by Jon Fu on 2018/6/25.
//  Copyright © 2018年 Jon Fu. All rights reserved.
//

#import "JFHomeViewController.h"
#import "JFDetailViewController.h"
#import "UIColor+HexColor.h"
#import "AppDelegate.h"

@interface JFHomeViewController ()

@end

@implementation JFHomeViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[JFSlideManager sharedInstance].slideVC setPanEnabled:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = [UIColor colorWithHexString:@"#33cccc"];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"点击详情" forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 200, 100, 40);
    [button addTarget:self action:@selector(jumpDetail) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)jumpDetail {
    
    JFDetailViewController *detailVC = [JFDetailViewController new];
    detailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailVC animated:YES];
    [[JFSlideManager sharedInstance].slideVC setPanEnabled:NO];
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
