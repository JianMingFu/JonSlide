//
//  JFLeftContentViewController.m
//  JonLeftSlide
//
//  Created by Jon Fu on 2018/6/25.
//  Copyright © 2018年 Jon Fu. All rights reserved.
//

#import "JFLeftContentViewController.h"
#import "JFDetailViewController.h"
#import "UIColor+HexColor.h"
#import "AppDelegate.h"

@interface JFLeftContentViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *titleArray;
@property (nonatomic,strong) NSArray *imageArray;
@end

@implementation JFLeftContentViewController


- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initHeaderView];
    [self initTableView];
}

- (void)initHeaderView {
    
    UIView *headerView = [UIView new];
    headerView.backgroundColor = [UIColor lightGrayColor];
    headerView.frame = CGRectMake(50, 0, kScreenWidth-100, Left_HeaderHeight);
    [self.view addSubview:headerView];
    
    UIButton *headBtn = [UIButton new];
    [headBtn setImage:[UIImage imageNamed:@"slide_head"] forState:UIControlStateNormal];
    headBtn.clipsToBounds = YES;
    headBtn.layer.cornerRadius = 20;
    headBtn.frame = CGRectMake(20, (Left_HeaderHeight-40)/2, 40, 40);
    [headerView addSubview:headBtn];
    
    UILabel *nameLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(headBtn.frame), CGRectGetMinY(headBtn.frame)+16, 80, 16)];
    nameLab.text = @"Jon Fu";
    nameLab.textColor = [UIColor whiteColor];
    nameLab.font = [UIFont systemFontOfSize:16];
    [headerView addSubview:nameLab];
    
    UILabel *signatureLab = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(headBtn.frame)+30, 200, 16)];
    signatureLab.text = @"你是我一生都不愿修复的Bug";
    signatureLab.textColor = [UIColor whiteColor];
    signatureLab.font = [UIFont systemFontOfSize:14];
    [headerView addSubview:signatureLab];
}


#pragma mark - UITableView
- (void)initTableView {
    
    self.tableView = [UITableView new];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    [self.view addSubview:self.tableView];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = self.titleArray[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:self.imageArray[indexPath.row]];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    JFDetailViewController *detailVC = [JFDetailViewController new];
    [[AppDelegate shareInstance].navigationController pushViewController:detailVC animated:YES];
    [[JFSlideManager sharedInstance].slideVC setPanEnabled:NO];
}

- (NSArray *)titleArray {
    
    if (!_titleArray) {
        _titleArray = @[@"我的需求",@"我的项目",@"我的店铺",@"发布需求",@"我的举报",@"我的收藏"];
    }
    return _titleArray;
}

- (NSArray *)imageArray {
    
    if (!_imageArray) {
        _imageArray = @[@"find_good",@"find_good",@"find_good",@"find_good",@"find_good",@"find_good"];
    }
    return _imageArray;
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
