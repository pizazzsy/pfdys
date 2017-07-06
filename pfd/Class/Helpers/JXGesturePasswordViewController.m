//
//  JXGesturePasswordViewController.m
//  pfd
//
//  Created by PFZC on 2017/6/21.
//  Copyright © 2017年 PFZC. All rights reserved.
//

#import "JXGesturePasswordViewController.h"

@interface JXGesturePasswordViewController ()<JXGesturePasswordViewDelegate>

@end

@implementation JXGesturePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
    JXGesturePasswordView *gesturePasswordView = [[JXGesturePasswordView alloc] init];
    gesturePasswordView.center = self.view.center;
    gesturePasswordView.delegate = self;
    [self.view addSubview:gesturePasswordView];
    
    UIView *topView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, MAINWIDTH, 60)];
    topView.backgroundColor=RGB(0, 167, 235, 1);
    [self.view addSubview:topView];
    
    UILabel *titleLable=[[UILabel alloc]initWithFrame:CGRectMake(0, 20, MAINWIDTH, 40)];
    titleLable.text=@"解锁手势密码";
    titleLable.textColor=[UIColor whiteColor];
    titleLable.textAlignment=NSTextAlignmentCenter;
    [topView addSubview:titleLable];
    
    UILabel *reminder=[[UILabel alloc]initWithFrame:CGRectMake(0, 65, MAINWIDTH, 20)];
    reminder.text=@"默认手势密码123";
    reminder.font=[UIFont systemFontOfSize:12];
    reminder.textColor=[UIColor redColor];
    reminder.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:reminder];
    
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(0, 80, MAINWIDTH, 40)];
    lable.text=@"请输入手势密码";
    lable.font=[UIFont systemFontOfSize:FONT_SIZE];
    lable.textColor=RGB(111, 110, 111, 1);
    lable.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:lable];
    
    
    UIButton * otherBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [otherBtn setFrame:CGRectMake(0, gesturePasswordView.frame.origin.y+gesturePasswordView.frame.size.height+20, self.view.frame.size.width/2, 30)];
    [otherBtn setTitle:@"使用其他账户" forState:UIControlStateNormal];
    otherBtn.tag=100;
    otherBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    [otherBtn setTitleColor:RGB(111, 110, 111, 1) forState:UIControlStateNormal];
    [otherBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:otherBtn];
    
    UIButton * forgetBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [forgetBtn setFrame:CGRectMake(self.view.frame.size.width/2, gesturePasswordView.frame.origin.y+gesturePasswordView.frame.size.height+20, self.view.frame.size.width/2, 30)];
    [forgetBtn setTitle:@"忘记手势密码" forState:UIControlStateNormal];
    forgetBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    [forgetBtn setTitleColor:RGB(111, 110, 111, 1) forState:UIControlStateNormal];
    [forgetBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    forgetBtn.tag=101;
    [self.view addSubview:forgetBtn];
    
    
    
    
    
}

-(void)btnClick:(UIButton *)sender{
    
    switch (sender.tag) {
        case 100:
        {
            //使用其他账户
        }
            break;
        case 101:
        {
            //忘记手势密码
        }
            break;
            
        default:
            break;
    }
}
- (void)gesturePasswordView:(JXGesturePasswordView *)gesturePasswordView didFinishDrawPassword:(NSString *)password
{
    // 在导航标题显示轨迹
    
    // 校验密码
    NSString *successPassword = @"123";
    NSString *message = nil;
    if (![successPassword isEqualToString:password])
    {
        [gesturePasswordView showError];
        message = [NSString stringWithFormat:@"错误！请依次连接%@", successPassword];
    }
    else
    {
//        message = @"正确！";
        [self dismissViewControllerAnimated:YES completion:nil];
    }
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil];
//        [alert show];
//    });
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
