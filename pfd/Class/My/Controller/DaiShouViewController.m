//
//  DaiShouViewController.m
//  pfd
//
//  Created by PFZC on 2017/6/16.
//  Copyright © 2017年 PFZC. All rights reserved.
//

#import "DaiShouViewController.h"

@interface DaiShouViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentCtr;
@property (strong, nonatomic) IBOutlet UIView *daishouView;
@property (strong, nonatomic) IBOutlet UIView *yishouView;
@property (weak, nonatomic) IBOutlet UIView *bgView;

@end

@implementation DaiShouViewController
- (IBAction)segmentClick:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex) {
        _daishouView.hidden=YES;
        _yishouView.hidden=NO;
    }else{
       
        _yishouView.hidden=YES;
        _daishouView.hidden=NO;
    }
}

-(void)viewDidLayoutSubviews{
  
    _daishouView.frame=_bgView.bounds;
    _yishouView.frame=_bgView.bounds;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"待收明细";
    
    self.view.backgroundColor=RGB(0, 169, 255, 1);
  
    [_bgView addSubview:_daishouView];
    
//    _yishouView.frame=_bgView.bounds;
    [_bgView addSubview:_yishouView];
    

    _yishouView.hidden=YES;
    
   
    
    // Do any additional setup after loading the view from its nib.
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
