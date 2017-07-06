//
//  HelpCenterViewController.m
//  pfd
//
//  Created by PFZC on 2017/6/16.
//  Copyright © 2017年 PFZC. All rights reserved.
//

#import "HelpCenterViewController.h"

@interface HelpCenterViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic) NSArray * dataArry;
@end

@implementation HelpCenterViewController

-(NSArray*)dataArry{
    if (!_dataArry) {
        _dataArry=@[@"注册类",@"充值提现类",@"标的类",@"回款类",@"活动类",@"债权转让类"];
    }
    return _dataArry;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"帮助中心";
    _tableView.dataSource=self;
    _tableView.delegate=self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma TableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArry.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString*identifier=@"tableCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text=_dataArry[indexPath.row];
    
    return cell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    switch (indexPath.row) {
        case 0:
        {
            WebViewController *webView = [[WebViewController alloc]init];
            webView.navTitle     = @"注册类";
            webView.protocolType = ProtocolTypeRgisterHelp;
            [self.navigationController pushViewController:webView animated:YES];
        }
            break;
        case 1:
        {
            WebViewController *webView = [[WebViewController alloc]init];
            webView.navTitle     = @"充值提现类";
            webView.protocolType =ProtocolTypeCashValueHelp;
            [self.navigationController pushViewController:webView animated:YES];
        }
            break;
        case 2:
        {
            WebViewController *webView = [[WebViewController alloc]init];
            webView.navTitle     = @"标的类";
            webView.protocolType =ProtocolTypeMarkHelp;
            [self.navigationController pushViewController:webView animated:YES];
        }
            break;
        case 3:
        {
            WebViewController *webView = [[WebViewController alloc]init];
            webView.navTitle     = @"回款类";
            webView.protocolType =ProtocolTyReturnedMoneyHelp;
            [self.navigationController pushViewController:webView animated:YES];
        }
            break;
        case 4:
        {
            WebViewController *webView = [[WebViewController alloc]init];
            webView.navTitle     = @"活动类";
            webView.protocolType =ProtocolTypeActivityHelp;
            [self.navigationController pushViewController:webView animated:YES];
        }
            break;
        case 5:
        {
            WebViewController *webView = [[WebViewController alloc]init];
            webView.navTitle     = @"债权转让类";
            webView.protocolType =ProtocolAssignmentOfDebtHelp;
            [self.navigationController pushViewController:webView animated:YES];
        }
            break;
            
        default:
            break;
    }
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
