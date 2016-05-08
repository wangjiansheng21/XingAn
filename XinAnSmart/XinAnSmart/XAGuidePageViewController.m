//
//  XAGuidePageViewController.m
//  XinAnSmart
//
//  Created by 王建生 on 16/5/3.
//  Copyright © 2016年 xingAnTongXun. All rights reserved.
//
#import "LeftSortsViewController.h"
#import "AppDelegate.h"
#import "XAGuidePageViewController.h"
#import "XATabBarViewController.h"
#import "XANavigationController.h"
#import "XAElectricTypeViewController.h"
#import "XAApplicationSceneViewController.h"
#import "XAVideoMonitoringViewController.h"
#import "XALeftSlideViewController.h"
@interface XAGuidePageViewController ()

@end

@implementation XAGuidePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    // Do any additional setup after loading the view.
}
-(void)initView{
    self.view.backgroundColor=[UIColor colorWithRed:0/255.0 green:149/255.0 blue:255/255.0 alpha:1];
    //   修改状态栏样式，必须修改info.plist文件View controller-based status bar appearance 改为no
    [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleLightContent;
    //   3秒后执行toTabBarController方法；
    [self performSelector:@selector(toTabBarController) withObject:nil afterDelay:3];
}
-(void)toTabBarController{
    LeftSortsViewController *leftVC = [[LeftSortsViewController alloc] init];
     XATabBarViewController *tabBarViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"tabBar"];
    UIApplication *application=[UIApplication sharedApplication];
    AppDelegate *delegate=application.delegate;
   delegate.leftSlideVC = [[LeftSlideViewController alloc] initWithLeftView:leftVC andMainView:tabBarViewController];
    [self presentViewController:delegate.leftSlideVC animated:NO completion:^{
        
    }];
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
