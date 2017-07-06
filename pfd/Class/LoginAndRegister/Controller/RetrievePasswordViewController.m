//
//  RetrievePasswordViewController.m
//  pfd
//
//  Created by PFZC on 2017/6/20.
//  Copyright © 2017年 PFZC. All rights reserved.
//

#import "RetrievePasswordViewController.h"

@interface RetrievePasswordViewController ()

@end

@implementation RetrievePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"找回密码";
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)nextClick:(UIButton *)sender {
    [self.navigationController pushViewController:[[RetrievePwdSecondViewController alloc]init] animated:YES];
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
