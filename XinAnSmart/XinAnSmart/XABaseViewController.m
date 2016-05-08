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
#import "LeftSortsViewController.h"
@interface XABaseViewController ()

@end

@implementation XABaseViewController{
    BOOL isClosed;
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
    
    //    修改导航条颜色
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:0/255.0 green:149/255.0 blue:255/255.0 alpha:1];
    //    修改导航条上各子控件颜色
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    
    self.view.backgroundColor=[UIColor whiteColor];
    UIButton *menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    menuBtn.frame = CGRectMake(0, 0, 20, 18);
    [menuBtn setBackgroundImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [menuBtn addTarget:self action:@selector(openOrCloseLeftList) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuBtn];

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
