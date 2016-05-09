//
//  XALeftSlideViewController.m
//  XinAnSmart
//
//  Created by 王建生 on 16/5/4.
//  Copyright © 2016年 xingAnTongXun. All rights reserved.
//
#import "AppDelegate.h"
#import "XALeftSlideViewController.h"
#import "XAMenuTableViewCell.h"
#import "XAAddUserViewController.h"
@interface XALeftSlideViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSArray *dataLists;
@end

@implementation XALeftSlideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
    [self loadData];
       // Do any additional setup after loading the view.
}
-(void)loadData{
    self.dataLists=@[@"添加网关",@"使用指南",@"关于"];
    
}
-(void)initTableView{
    //添加背景图片
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:self.view.bounds];
    
    imageview.image = [UIImage imageNamed:@"leftbackiamge"];
    [self.view addSubview:imageview];
    self.tableview=[[UITableView alloc] initWithFrame:CGRectMake(0,180, self.view.frame.size.width,self.view.frame.size.height) ];
    UIView *view=[[UIView alloc ]initWithFrame:CGRectMake(0,180,self.view.frame.size.width,self.view.frame.size.height-180)];
    view.backgroundColor=[UIColor whiteColor];
    view.alpha=0.75;
    [imageview addSubview:view];
    self.tableview.delegate=self;
    self.tableview.dataSource=self;
    self.tableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    UINib *nib=[UINib nibWithNibName:@"XAMenuTableViewCell" bundle:nil];
    [self.tableview registerNib:nib forCellReuseIdentifier:@"cell"];
    [self.view insertSubview:self.tableview aboveSubview:view];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataLists.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

static NSString *identifier=@"cell";
     XAMenuTableViewCell *myCell=[tableView dequeueReusableCellWithIdentifier:identifier];
    NSString *title=self.dataLists[indexPath.row];
    NSString *imageName;
    if([title isEqualToString:@"添加网关"]){
       imageName=@"web";
    }
    if([title isEqualToString:@"使用指南"]){
        imageName=@"shiyongshuom";

    }

    if([title isEqualToString:@"关于"]){
        imageName=@"about";

    }
    myCell.titleLab.text=title;
    myCell.backgroundColor=[UIColor clearColor];
    myCell.myImageView.image=[UIImage imageNamed:imageName];
    UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    cell.textLabel.text=title;
    cell.backgroundColor=[UIColor clearColor];
    return myCell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
      [tempAppDelegate.leftSlideVC closeLeftView];//关闭左侧抽屉

    NSLog(@"----");
    NSString *title=self.dataLists[indexPath.row];
    if([title isEqualToString:@"添加网关"]){
        XAAddUserViewController *addUserVc=[XAAddUserViewController new];
        UINavigationController *navAddUser=[[UINavigationController alloc] initWithRootViewController:addUserVc];
//        [self presentViewController:addUserVc animated:NO completion:^{
//            
//        }];
    }
    if([title isEqualToString:@"使用指南"]){
        
    }
    
    if([title isEqualToString:@"关于"]){
        
    }

}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 180;
//}
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableview.bounds.size.width, 180)];
//    view.backgroundColor = [UIColor clearColor];
//    return view;
//}

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
