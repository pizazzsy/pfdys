//
//  AppUtils.h
//  pfd
//
//  Created by PFZC on 2017/6/15.
//  Copyright © 2017年 PFZC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppUtils : NSObject

/********************* SVProgressHUD **********************/
//弹出提示框
+ (void)showTipsMessage:(NSString *)message;
//弹出操作错误信息提示框
+ (void)showErrorMessage:(NSString *)message;
//弹出操作成功信息提示框
+ (void)showSuccessMessage:(NSString *)message;
//弹出加载提示框
+ (void)showProgressMessage:(NSString *) message;
//取消弹出框
+ (void)dismissHUD;

@end
