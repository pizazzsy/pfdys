//
//  LoginViewController.m
//  pfd
//
//  Created by PFZC on 2017/6/20.
//  Copyright © 2017年 PFZC. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"登录";
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)forGetPwdClick:(UIButton *)sender {
    [self.navigationController pushViewController:[[RetrievePasswordViewController alloc]init] animated:YES];
}
- (IBAction)loginClick:(UIButton *)sender {
    
    NSString *passWord = @"123456";
    if (![SSKeychain passwordForService:APP_MARK account:@"test2"]){
        
        //查看本地是否存储指定 serviceName和 account 的密码
        
        //如果没设置密码则设定密码 并存储
        [SSKeychain setPassword:passWord forService:APP_MARK account:@"test2"];
        
        //打印密码信息
        NSString *retrieveuuid = [SSKeychain passwordForService:APP_MARK account:@"test2"];
        NSLog(@"SSKeychain存储显示:未安装过:%@", retrieveuuid);
        
    }else{
        
        //曾经安装过则直接能打印出密码信息(即使删除了程序再次安装也会打印密码信息) 区别于 NSUSerDefault
        NSString *retrieveuuid = [SSKeychain passwordForService:APP_MARK account:@"test2"];
        NSLog(@"SSKeychain存储显示 :已安装过:%@", retrieveuuid);
        
    }
    NSArray*array=[SSKeychain accountsForService:APP_MARK];
    NSLog(@"%@",array);
    
    TabBarController * myTabbar= [[TabBarController alloc]init];
    [self.view.window setRootViewController:myTabbar];
   
}
- (IBAction)registClick:(UIButton *)sender {
    [self .navigationController pushViewController:[[RegisterViewController alloc ]init] animated:YES];
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
