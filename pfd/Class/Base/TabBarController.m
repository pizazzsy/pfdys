//
//  TabBarController.m
//  pfd
//
//  Created by PFZC on 2017/6/9.
//  Copyright © 2017年 PFZC. All rights reserved.
//

#import "TabBarController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
    [self stepViewCtr];
    // Do any additional setup after loading the view.
}
-(void)stepViewCtr{
    
    HomeViewController * homeCtr=[[HomeViewController alloc]init];
    NavigationController *homeNav=[[NavigationController alloc]initWithRootViewController:homeCtr];
    
    ItemListViewController * itemListCtr=[[ItemListViewController alloc]init];
    NavigationController *itemListNav=[[NavigationController alloc]initWithRootViewController:itemListCtr];
    
    FindViewController * findCtr=[[FindViewController alloc]init];
    NavigationController *findCtrNav=[[NavigationController alloc]initWithRootViewController:findCtr];
    
    MyViewController * myCtr=[[MyViewController alloc]init];
    NavigationController *myCtrNav=[[NavigationController alloc]initWithRootViewController:myCtr];
    
    [self setViewControllers:@[homeNav,itemListNav,findCtrNav,myCtrNav]];
    [self.tabBar.items[0] setImage:[UIImage imageNamed:@"bi-index"]];
    [self.tabBar.items[0] setSelectedImage:[UIImage imageNamed:@"bi-index-act"]];
    [self.tabBar.items[0]setTitle:@"首页"];
    [self.tabBar.items[1] setImage:[UIImage imageNamed:@"bi-itemlist"]];
    [self.tabBar.items[1] setSelectedImage:[UIImage imageNamed:@"bi-itemlist-act"]];
    [self.tabBar.items[1]setTitle:@"项目列表"];
    
    [self.tabBar.items[2] setImage:[UIImage imageNamed:@"bi-faxian"]];
    [self.tabBar.items[2] setSelectedImage:[UIImage imageNamed:@"bi-faxian-act"]];
    [self.tabBar.items[2]setTitle:@"发现"];
    
    [self.tabBar.items[3] setImage:[UIImage imageNamed:@"bi-my"]];
    [self.tabBar.items[3] setSelectedImage:[UIImage imageNamed:@"bi-my-act"]];
    [self.tabBar.items[3]setTitle:@"我的"];
   
    self.tabBar.backgroundColor=[UIColor whiteColor];
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
