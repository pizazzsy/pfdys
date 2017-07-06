//
//  ProjectDetailsTwoViewController.m
//  pfd
//
//  Created by PFZC on 2017/6/22.
//  Copyright © 2017年 PFZC. All rights reserved.
//

#import "ProjectDetailsTwoViewController.h"


static NSString * identifier = @"DepositsHistoryCell";

@interface ProjectDetailsTwoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollw;
@property (strong, nonatomic) IBOutlet UIView *ProjectInforView;
@property (strong, nonatomic) IBOutlet UIView *RiskCtrSecurityView;
@property (strong, nonatomic) IBOutlet UIView *RecordView;
@property (strong, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIScrollView *bgScrollw;
@property (weak, nonatomic) IBOutlet UIButton *defultButton;
@property (weak, nonatomic) IBOutlet UIImageView *lineView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic )UIButton *btn;

@end

@implementation ProjectDetailsTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"项目详情";
    _bgScrollw.contentSize=CGSizeMake(MAINWIDTH, MAINHEIGTH*2);
    _bgView.frame=CGRectMake(0, 0, _bgScrollw.frame.size.width, MAINHEIGTH*3);
    [_bgScrollw addSubview:_bgView];
    
    
     [_scrollw addSubview:_RecordView];
    [_scrollw addSubview:_ProjectInforView];
    [_scrollw addSubview:_RiskCtrSecurityView];

     _scrollw.contentSize=CGSizeMake(MAINWIDTH*3, 0);
    
     [self selectBtnClick:_defultButton];
    _lineView.frame=CGRectMake(0, 47, MAINWIDTH/3, 2);
    [self setupChildViews];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    // Do any additional setup after loading the view from its nib.
}

- (void)setupChildViews{
    
    _ProjectInforView.frame=CGRectMake(0, 0, MAINWIDTH, MAINHEIGTH);
    _RiskCtrSecurityView.frame=CGRectMake(MAINWIDTH, 0, MAINWIDTH, MAINHEIGTH);
    _RecordView.frame=CGRectMake(MAINWIDTH*2, 0, MAINWIDTH, 320);
    _scrollw.scrollEnabled=NO;
    [_scrollw addSubview:_ProjectInforView];
    [_scrollw addSubview:_RiskCtrSecurityView];
    [_scrollw addSubview:_RecordView];
    
}

- (IBAction)nextClick:(UIButton *)sender {
    [self.navigationController pushViewController:[[BuyViewController alloc]init] animated:YES];
}
- (IBAction)selectBtnClick:(UIButton *)sender {
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

    CGPoint point = CGPointMake(sender.tag * MAINWIDTH ,0);
    
    [_scrollw setContentOffset:point animated:YES];
}
#pragma TableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 30;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DepositsHistoryTableViewCell *cell = (DepositsHistoryTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell= (DepositsHistoryTableViewCell *)[[[NSBundle  mainBundle]  loadNibNamed:@"DepositsHistoryTableViewCell" owner:self options:nil]  lastObject];
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
