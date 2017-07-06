//
//  InvestViewController.m
//  pfd
//
//  Created by PFZC on 2017/6/13.
//  Copyright © 2017年 PFZC. All rights reserved.
//

#import "InvestViewController.h"
static NSString * identifier = @"RecommendTableViewCell";
@interface InvestViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *defultButton;
@property (weak, nonatomic) IBOutlet UIImageView *lineView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic )UIButton *btn;

@end

@implementation InvestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
   
    _tableView.frame=CGRectMake(0, 32, MAINWIDTH, MAINHEIGTH-132);
    _tableView.delegate=self;
    _tableView.dataSource=self;

    [self btnClick:_defultButton];
     _lineView.frame=CGRectMake(0, 30, MAINWIDTH/3, 2);

}
- (IBAction)btnClick:(UIButton *)sender {
    
    if(_btn== sender) {
        //        //上次点击过的按钮，不做处理
    } else{
        [_btn setTitleColor:RGB(165,167,169,1) forState:UIControlStateNormal
         ];
        //本次点击的按钮设为红色
        [sender setTitleColor:RGB(255,55,0,1) forState:UIControlStateNormal];
    }
    _btn= sender;
    
    [UIView animateWithDuration:0.5 animations:^{
        CGPoint p=CGPointMake(sender.center.x, _lineView.center.y);
        _lineView.center= p;
        NSLog(@"%f",_lineView.center.x);
    }];

}

#pragma TableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 150;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewController:[[ProjectDetailsTwoViewController alloc]init] animated:YES];
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RecommendTableViewCell *cell = (RecommendTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell= (RecommendTableViewCell *)[[[NSBundle  mainBundle]  loadNibNamed:@"RecommendTableViewCell" owner:self options:nil]  lastObject];
    }
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
