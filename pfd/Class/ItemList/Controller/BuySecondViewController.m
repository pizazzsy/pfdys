//
//  BuySecondViewController.m
//  pfd
//
//  Created by PFZC on 2017/6/27.
//  Copyright © 2017年 PFZC. All rights reserved.
//

#import "BuySecondViewController.h"

@interface BuySecondViewController ()

@end

@implementation BuySecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"购买";
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)checkBoxClick:(UIButton *)sender {
        sender.selected = !sender.selected;
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
