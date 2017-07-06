//
//  AutomaticBidViewController.m
//  pfd
//
//  Created by PFZC on 2017/6/16.
//  Copyright © 2017年 PFZC. All rights reserved.
//

#import "AutomaticBidViewController.h"

@interface AutomaticBidViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation AutomaticBidViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"自动投标";
    
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithTitle:@"规则说明" style:UIBarButtonItemStyleDone target:self action:@selector(rightBtnClick:)];

    self.navigationItem.rightBarButtonItem = rightItem;

    
    // Do any additional setup after loading the view from its nib.
}
-(void)rightBtnClick:(id)sender{
    
    WebViewController *webView = [[WebViewController alloc]init];
    webView.navTitle     = @"规则说明";
    webView.protocolType = ProtocolTypeRule;
    [self.navigationController pushViewController:webView animated:YES];

    
}
- (IBAction)AutomaticBid:(UISwitch *)sender {
    BOOL isButtonOn = [sender isOn];
    if (isButtonOn) {
        _contentView.hidden=NO;
        
    }else {
       
        _contentView.hidden=YES;
    }
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
