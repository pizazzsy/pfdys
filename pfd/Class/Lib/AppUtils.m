//
//  AppUtils.m
//  pfd
//
//  Created by PFZC on 2017/6/15.
//  Copyright © 2017年 PFZC. All rights reserved.
//

#import "AppUtils.h"

@implementation AppUtils




/********************* SVProgressHUD **********************/
+ (void)showTipsMessage:(NSString *)message
{
    [SVProgressHUD showImage:nil status:message];
}

+ (void)showSuccessMessage:(NSString *)message
{
    [SVProgressHUD showSuccessWithStatus:message];
}

+ (void)showErrorMessage:(NSString *)message
{
    [SVProgressHUD showErrorWithStatus:message];
}

+ (void)showProgressMessage:(NSString *) message
{
    [SVProgressHUD showWithStatus:message];
}

+ (void)dismissHUD
{
    [SVProgressHUD dismiss];
}

@end
