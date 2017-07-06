//
//  ProjectDetailsViewController.m
//  pfd
//
//  Created by PFZC on 2017/6/16.
//  Copyright © 2017年 PFZC. All rights reserved.
//

#import "ProjectDetailsViewController.h"

@interface ProjectDetailsViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *bgScrollView;
@property (strong, nonatomic) IBOutlet UIView *bgView;
@property (strong, nonatomic) IBOutlet UIView *bottomView;
@property (strong, nonatomic) IBOutlet UIScrollView *bottomScrollView;
@property (nonatomic, assign) NSInteger page;//当前页数
@property (weak, nonatomic) IBOutlet UIImageView *lineView;
@property (weak, nonatomic) IBOutlet UIButton *defultButton;
@property (nonatomic, assign) CGFloat lastcontentOffset; //添加此属性的作用，根据差值，判断ScrollView是上滑还是下拉
@property(strong,nonatomic )UIButton *btn;
@end

@implementation ProjectDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //第一分页
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"项目详情";
    _bgScrollView.contentSize=CGSizeMake(MAINWIDTH, MAINHEIGTH-64);
    _bgView.frame=CGRectMake(0, 0, MAINWIDTH, MAINHEIGTH-64);
    _bgScrollView.showsHorizontalScrollIndicator=NO;
    _bgScrollView.showsVerticalScrollIndicator=NO;
    _bgScrollView.pagingEnabled=YES;
    _bgScrollView.delegate=self;
    [_bgScrollView addSubview:_bgView];
    
    
    //第二分页
    _bottomView.frame=CGRectMake(0, 0, MAINWIDTH, MAINHEIGTH);
    [_bottomScrollView addSubview:_bottomView];
    _bgScrollView.secondScrollView=_bottomScrollView;
    _bottomScrollView.contentSize=CGSizeMake(MAINWIDTH, MAINHEIGTH);
   
    
    UIView *btnView=[[UIView alloc]initWithFrame:CGRectMake(0, MAINHEIGTH-124, MAINWIDTH, 60)];
    [btnView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:btnView];
    
    UIButton * investBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    investBtn.frame=CGRectMake(10,10, MAINWIDTH-20, 40);
    [investBtn setTitle:@"立即投资" forState:UIControlStateNormal];
    [investBtn setBackgroundColor:RGB(0, 169, 255, 1)];
    investBtn.clipsToBounds=YES;
    investBtn.layer.cornerRadius=5;
    [investBtn addTarget:self action:@selector(nextClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [btnView addSubview:investBtn];
    
     [self secectBtnClick:_defultButton];
     _lineView.frame=CGRectMake(0, 37, MAINWIDTH/3, 3);
    
    
}
- (IBAction)secectBtnClick:(UIButton *)sender {
    
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
-(void)nextClick:(UIButton*)sender{
    [self.navigationController pushViewController:[[BuySecondViewController alloc]init] animated:YES];
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
