//
//  FindViewController.m
//  pfd
//
//  Created by PFZC on 2017/6/9.
//  Copyright © 2017年 PFZC. All rights reserved.
//

#import "FindViewController.h"

@interface FindViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property(strong,nonatomic)NSMutableArray * findListArray;

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"发现";
    [self initData];
    _tableview.delegate=self;
    _tableview.dataSource=self;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
   
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillDisappear:(BOOL)animated
{
//       self.tabBarController.tabBar.hidden = YES;
//      self.hidesBottomBarWhenPushed=YES;
    
}
-(void)viewWillAppear:(BOOL)animated
{
//    self.tabBarController.tabBar.hidden=NO;
}

-(void)initData{
    _findListArray =[[NSMutableArray alloc]init];
    NSMutableDictionary * dic1=[[NSMutableDictionary alloc]init];
    [dic1 setValue:@"find_tb2" forKey:@"img"];
    [dic1 setValue:@"平方贷简介" forKey:@"title"];
    [_findListArray addObject:dic1];
    
    NSMutableDictionary * dic2=[[NSMutableDictionary alloc]init];
    [dic2 setValue:@"find_tb3" forKey:@"img"];
    [dic2 setValue:@"安全保障" forKey:@"title"];
    [_findListArray addObject:dic2];
    
    NSMutableDictionary * dic3=[[NSMutableDictionary alloc]init];
    [dic3 setValue:@"find_tb4" forKey:@"img"];
    [dic3 setValue:@"平台数据" forKey:@"title"];
    [_findListArray addObject:dic3];
    
    NSMutableDictionary * dic4=[[NSMutableDictionary alloc]init];
    [dic4 setValue:@"find_tb5" forKey:@"img"];
    [dic4 setValue:@"系统公告" forKey:@"title"];
    [_findListArray addObject:dic4];
    
    NSMutableDictionary * dic5=[[NSMutableDictionary alloc]init];
    [dic5 setValue:@"find_tb6" forKey:@"img"];
    [dic5 setValue:@"精选活动" forKey:@"title"];
    [_findListArray addObject:dic5];
    
    NSMutableDictionary * dic6=[[NSMutableDictionary alloc]init];
    [dic6 setValue:@"find_tb7" forKey:@"img"];
    [dic6 setValue:@"平方动态" forKey:@"title"];
    [_findListArray addObject:dic6];
}
#pragma TableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _findListArray.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
    switch (indexPath.row) {
        case 0:
        {
            WebViewController *webView = [[WebViewController alloc]init];
            webView.navTitle     = @"关于平方";
            webView.protocolType = ProtocolTypeAbout;
            [self.navigationController pushViewController:webView animated:YES];
        }
            break;
        case 1:
        {
            ImageViewController *imageView = [[ImageViewController alloc]init];
            imageView.navTitle     = @"安全保障";
            imageView.imageType=ImageTypeSecurityAssurance;
            imageView.imageStr = @"about_tp";
            [self.navigationController pushViewController:imageView animated:YES];
        }
            break;
        case 2:
        {
            PlatformDataViewController *platfprmCtr=[[PlatformDataViewController alloc]init];
            [self.navigationController pushViewController:platfprmCtr animated:YES];
        }
            break;
        case 3:
        {
            NoticeViewController *noticeCtr=[[NoticeViewController alloc]init];
            [self.navigationController pushViewController:noticeCtr animated:YES];
        }
            break;
        case 4:
        {
            ActivityViewController *activityCtr=[[ActivityViewController alloc]init];
            [self.navigationController pushViewController:activityCtr animated:YES];
        }
            break;
        case 5:
        {
            DynamicViewController *dynamicCtr=[[DynamicViewController alloc]init];
            [self.navigationController pushViewController:dynamicCtr animated:YES];
        }
            break;
            
        default:
            break;
    }
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString*identifier=@"tableCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
   
    if (!cell) {
         cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.imageView.image=[UIImage imageNamed:_findListArray[indexPath.row][@"img"]];
    cell.textLabel.text=_findListArray[indexPath.row][@"title"];
    
    return cell;
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
