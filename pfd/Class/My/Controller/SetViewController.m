//
//  SetViewController.m
//  pfd
//
//  Created by PFZC on 2017/6/15.
//  Copyright © 2017年 PFZC. All rights reserved.
//

#import "SetViewController.h"

@interface SetViewController ()

@end

@implementation SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"设置";
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)setClick:(UITapGestureRecognizer *)sender {
    [self.navigationController pushViewController:[[ChangePwdViewController alloc]init] animated:YES];
    
}
- (IBAction)exitClick:(UIButton *)sender {
    LoginViewController * loginView=[[LoginViewController alloc]init];
    
    NavigationController *nav = [[NavigationController alloc]initWithRootViewController:loginView];
    [self.view.window setRootViewController:nav];
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
