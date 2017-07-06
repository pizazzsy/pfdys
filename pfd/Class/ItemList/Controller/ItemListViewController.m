//
//  ItemListViewController.m
//  pfd
//
//  Created by PFZC on 2017/6/9.
//  Copyright © 2017年 PFZC. All rights reserved.
//

#import "ItemListViewController.h"

@interface ItemListViewController ()<UIScrollViewDelegate>
@property(strong,nonatomic)listTopView *topView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(nonatomic,strong)NSArray*dataList;
@end

@implementation ItemListViewController

-(listTopView*)topView{
    if (!_topView) {
        _topView=[[listTopView alloc]initWithFrame:CGRectMake(0, 0, 200, 30) titleNames:self.dataList];
        __weak ItemListViewController *weakSelf = self;
        _topView.block = ^(NSInteger tag) {
            
            CGPoint point = CGPointMake(tag * MAINWIDTH ,weakSelf.scrollView.contentOffset.y);
            
            [weakSelf.scrollView setContentOffset:point animated:YES];
            
        };
    }
    return _topView;
}
-(NSArray *)dataList{
    if (!_dataList) {
        _dataList=@[@"如意推荐",@"散标投资",@"债权转让"];
    }
    return _dataList;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupNav];
    [self setupChildControllers];
}
-(void)viewWillAppear:(BOOL)animated{
    [self scrollViewDidEndScrollingAnimation:self.scrollView];
}
- (void)setupChildControllers {
    
    NSArray * vcNames = @[@"RecommendViewController",@"TransferViewController",@"InvestViewController"];
    
    for (NSInteger i = 0 ; i < vcNames.count; i ++) {
        
        UIViewController * liveVC = [[NSClassFromString(vcNames[i]) alloc] init];
        [self addChildViewController:liveVC];
    }
    
    self.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * _dataList.count, 0);
    
    self.scrollView.contentOffset = CGPointMake(0, 0);
    self.scrollView.scrollEnabled=NO;
    self.scrollView.delegate=self;
    
//    [self scrollViewDidEndScrollingAnimation:self.scrollView];

    
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    //contentScrollView的width
    CGFloat width = MAINWIDTH;//scrollView.frame.size.width;
    
//    CGFloat height = MAINHEIGTH;//scrollView.frame.size.height;
    
    CGFloat offsetX = scrollView.contentOffset.x;
    
    //获取索引
    NSInteger index = offsetX / width;
    
    UIViewController * childVC = self.childViewControllers[index];
    
    //视图控制器是否加载过
    if ([childVC isViewLoaded]) return;
    
    childVC.view.frame = CGRectMake(index*width, 0, scrollView.frame.size.width, 1000);
    [scrollView addSubview:childVC.view];

}

-(void)setupNav{
    self.navigationItem.titleView=self.topView;
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
