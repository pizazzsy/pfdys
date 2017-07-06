//
//  MyViewController.m
//  pfd
//
//  Created by PFZC on 2017/6/9.
//  Copyright © 2017年 PFZC. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *bgView;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"wm_tb"] style:UIBarButtonItemStyleDone target:self action:@selector(leftClick:)];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"wm_tb2"] style:UIBarButtonItemStyleDone target:self action:@selector(rightClick:)];
    // Do any additional setup after loading the view from its nib.
    _scrollView.contentSize=CGSizeMake(MAINWIDTH, MAINHEIGTH-44);
     _bgView.frame=CGRectMake(0, 0, MAINWIDTH, MAINHEIGTH+400);
    [_scrollView addSubview:_bgView];
}

#pragma 点击触发事件
//左按钮
-(void)leftClick:(id)sender{
    
    [self.navigationController pushViewController:[[SetViewController alloc]init] animated:YES];
}
//右按钮
-(void)rightClick:(id)sender{
    
    [self.navigationController pushViewController:[[MessageViewController alloc]init] animated:YES];
    
}
- (IBAction)topViewClick:(UITapGestureRecognizer *)sender {
}
//提现充值按钮
- (IBAction)withDrawalClick:(id)sender {
    
}
//投资记录按钮
- (IBAction)tap1Click:(UITapGestureRecognizer *)sender {
    [self.navigationController pushViewController:[[DepositsHistoryViewController alloc]init] animated:YES];
}
//待收明细按钮
- (IBAction)tap2Click:(UITapGestureRecognizer *)sender {
       [self.navigationController pushViewController:[[DaiShouViewController alloc]init] animated:YES];
     NSLog(@"点击了第二个按钮");
}
//自动投标按钮
- (IBAction)tap3Click:(UITapGestureRecognizer *)sender {
    [self.navigationController pushViewController:[[AutomaticBidViewController alloc]init] animated:YES];

     NSLog(@"点击了第三个按钮");
}
//红包优惠按钮
- (IBAction)tap4Click:(UITapGestureRecognizer *)sender {
      [self.navigationController pushViewController:[[RedPacketViewController alloc]init] animated:YES];
    
     NSLog(@"点击了第四个按钮");
}
//债权转让
- (IBAction)tap5Click:(UITapGestureRecognizer *)sender {
      [self.navigationController pushViewController:[[CreditorRightsTransferViewController alloc]init] animated:YES];
     NSLog(@"点击了第五个按钮");
}
//邀请有奖
- (IBAction)tap6Click:(UITapGestureRecognizer *)sender {
        [self.navigationController pushViewController:[[ShareViewController alloc]init] animated:YES];
     NSLog(@"点击了第六个按钮");
}
//帮助中心
- (IBAction)tap7Click:(UITapGestureRecognizer *)sender {
    [self.navigationController pushViewController:[[HelpCenterViewController alloc]init] animated:YES];
     NSLog(@"点击了第七个按钮");
}
//我要贷款
- (IBAction)tap8Click:(UITapGestureRecognizer *)sender {
     NSLog(@"点击了第八个按钮");
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
