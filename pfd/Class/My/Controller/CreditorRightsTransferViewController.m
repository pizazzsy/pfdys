//
//  TransferViewController.m
//  pfd
//
//  Created by PFZC on 2017/6/16.
//  Copyright © 2017年 PFZC. All rights reserved.
//

#import "CreditorRightsTransferViewController.h"

@interface CreditorRightsTransferViewController ()
@property (weak, nonatomic) IBOutlet UIButton *defultButton;
@property (weak, nonatomic) IBOutlet UIImageView *lineView;
@property(strong,nonatomic )UIButton *btn;


@end

@implementation CreditorRightsTransferViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"债权转让";
   
    [self btnClick:_defultButton];
     _lineView.frame=CGRectMake(0, 39, MAINWIDTH/3, 2);
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnClick:(UIButton *)sender {
    if(_btn== sender) {
        //        //上次点击过的按钮，不做处理
    } else{
        [_btn setTitleColor:RGB(70,75,78,1) forState:UIControlStateNormal
         ];
        //本次点击的按钮设为红色
        [sender setTitleColor:RGB(7,178,247,1) forState:UIControlStateNormal];
        
    }
    _btn= sender;
    
    [UIView animateWithDuration:0.5 animations:^{
        CGPoint p=CGPointMake(sender.center.x, _lineView.center.y);
        _lineView.center= p;
        NSLog(@"%f",_lineView.center.x);
    }];

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
