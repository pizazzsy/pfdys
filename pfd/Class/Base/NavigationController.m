//
//  NavigationController.m
//  pfd
//
//  Created by PFZC on 2017/6/9.
//  Copyright © 2017年 PFZC. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIColor * bgcolor = [UIColor colorWithRed:7/255.0 green:178/255.0 blue:247/255.0 alpha:1];
    
    self.navigationBar.barTintColor = bgcolor;
    
    self.navigationBar.tintColor = [UIColor whiteColor];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];

    if ((self.viewControllers.count > 0) && (viewController != self.viewControllers[0])) {
        
        viewController.hidesBottomBarWhenPushed = YES;
        
    }
    
    [super pushViewController:viewController animated:animated];
    
//    [viewController.navigationController setNavigationBarHidden:YES];
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
