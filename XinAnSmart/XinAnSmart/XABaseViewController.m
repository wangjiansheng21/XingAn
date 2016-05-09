//
//  XABaseViewController.m
//  XinAnSmart
//
//  Created by 王建生 on 16/5/3.
//  Copyright © 2016年 xingAnTongXun. All rights reserved.
//
#import "XABaseViewController.h"
#import <Masonry.h>
#import "LeftSlideViewController.h"

@interface XABaseViewController ()

@end

@implementation XABaseViewController{
  
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initViews];
    // Do any additional setup after loading the view.
}
-(void)viewDidDisappear:(BOOL)animated{
    if (_defaultImageView!=nil) {
        _defaultImageView=nil;
    }
}
-(void)setDefaultImageView:(UIImageView *)defaultImageView{
    if(_defaultImageView==nil){
        _defaultImageView=[UIImageView new];
        
        NSLog(@"--");
        [self.view addSubview:_defaultImageView];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"AddPanGestureRecognizer" object:self];
        [_defaultImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top);
            make.left.right.equalTo(self.view);
            make.bottom.equalTo(self.view.mas_bottom).offset(-self.tabBarController.tabBar.frame.size.height);
        }];
        
        _defaultImageView.image=[UIImage imageNamed:@"main.jpg"];
    }
}

-(void)initViews{
    _labTitle=[[UILabel alloc] initWithFrame:CGRectMake(0, 0,80,30)];
    _labTitle.text=@"未添加用户";
    
    _labTitle.textColor=[UIColor whiteColor];
    self.navigationItem.titleView=_labTitle;
    //    修改导航条颜色
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:0/255.0 green:149/255.0 blue:255/255.0 alpha:1];
    //    修改导航条上各子控件颜色
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    
    self.view.backgroundColor=[UIColor whiteColor];
//    导航条左侧按钮设置
    UIButton *menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    menuBtn.frame = CGRectMake(0, 0, 20, 18);
    [menuBtn setBackgroundImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [menuBtn addTarget:self action:@selector(openOrCloseLeftList) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuBtn];
//    导航条右侧按钮设置
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 30,30);
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"cycle"] forState:UIControlStateNormal];
//    [rightBtn addTarget:self action:@selector(openOrCloseLeftList) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];

//    设备是否在线按钮设置
    UIButton *onlineBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.navigationController.navigationBar addSubview:onlineBtn];
    [onlineBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@30);
        make.height.equalTo(@30);
        make.centerY.equalTo(rightBtn.mas_centerY);
        make.right.equalTo(rightBtn.mas_left).offset(-10);
    }];
    [onlineBtn setBackgroundImage:[UIImage imageNamed:@"online"] forState:UIControlStateNormal];
//    [onlineBtn addTarget:self action:@selector(openOrCloseLeftList) forControlEvents:UIControlEventTouchUpInside];
}
- (void) openOrCloseLeftList
{
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if (tempAppDelegate.leftSlideVC.closed)
    {
        [tempAppDelegate.leftSlideVC openLeftView];
    }
    else
    {
        [tempAppDelegate.leftSlideVC closeLeftView];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear");
    [self setDefaultImageView:nil];
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppDelegate.leftSlideVC setPanEnabled:NO];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
    [self setDefaultImageView:nil];
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppDelegate.leftSlideVC setPanEnabled:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
