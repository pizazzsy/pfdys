//
//  HomeViewController.m
//  pfd
//
//  Created by PFZC on 2017/6/9.
//  Copyright © 2017年 PFZC. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIScrollView *topScrollV;
@property (weak, nonatomic) IBOutlet UILabel *lable;
@property (nonatomic, retain)NSTimer* rotateTimer;  //让视图自动切换
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation HomeViewController

static NSString * identifier = @"HotSaleTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
      _topScrollV.contentSize = CGSizeMake(CGRectGetWidth(_topScrollV.frame)*3,0);
     _topScrollV.pagingEnabled = YES;
     _topScrollV.showsHorizontalScrollIndicator = NO;
       //启动定时器
    self.rotateTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(changeView) userInfo:nil repeats:YES];

    _scrollView.contentSize=CGSizeMake(MAINWIDTH, MAINHEIGTH+400);
//    _scrollView.contentSize=CGSizeMake(MAINWIDTH, 0);
    
    _bgView.frame=CGRectMake(0, 0, MAINWIDTH, MAINHEIGTH+600);
    [_scrollView addSubview:_bgView];
    _tableView.delegate=self;
    _tableView.dataSource=self;
}
-(void)viewDidLayoutSubviews{
    for (int i = 0; i< 3; i++) {
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(_topScrollV.frame)*i, 0, CGRectGetWidth(_topScrollV.frame), CGRectGetHeight(_topScrollV.frame))];
        img.image=[UIImage imageNamed:@"banner"];
        
        [_topScrollV addSubview:img];
    }

}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden=YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden=NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)changeView{
    //得到scrollView
    UIScrollView *scrollView = _topScrollV;
    //通过改变contentOffset来切换滚动视图的子界面
    float offset_X = scrollView.contentOffset.x;
    //每次切换一个屏幕
    offset_X += CGRectGetWidth(_topScrollV.frame);
    
    //说明要从最右边的多余视图开始滚动了，最右边的多余视图实际上就是第一个视图。所以偏移量需要更改为第一个视图的偏移量。
    if (offset_X > CGRectGetWidth(_topScrollV.frame)*3) {
        scrollView.contentOffset = CGPointMake(0, 0);
    }
    //得到最终的偏移量
    CGPoint resultPoint = CGPointMake(offset_X, 0);
    //切换视图时带动画效果
    
    
    //最右边的多余视图实际上就是第一个视图，现在是要从第一个视图向第二个视图偏移，所以偏移量为一个屏幕宽度
    if (offset_X >=CGRectGetWidth(_topScrollV.frame)*3) {
        [scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }else{
        [scrollView setContentOffset:resultPoint animated:YES];
    }
}


- (IBAction)investBtnClick:(UIButton *)sender {
    
    [self.navigationController pushViewController:[[ProjectDetailsTwoViewController alloc]init] animated:YES];
}


#pragma TableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HotSaleTableViewCell *cell = (HotSaleTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell= (HotSaleTableViewCell *)[[[NSBundle  mainBundle]  loadNibNamed:@"HotSaleTableViewCell" owner:self options:nil]  lastObject];
    }
    return cell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 125;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    [self.navigationController pushViewController:[[ProjectDetailsViewController alloc]init] animated:YES];
    
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
