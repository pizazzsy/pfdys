//
//  WebViewController.h
//  pfd
//
//  Created by PFZC on 2017/6/15.
//  Copyright © 2017年 PFZC. All rights reserved.
//
typedef NS_ENUM(NSInteger, ProtocolType)
{
    ProtocolTypeNone = 0,
    ProtocolTypeRgisterHelp = 1, //注册帮助
    ProtocolTypeCashValueHelp, //充值提现帮助
    ProtocolTypeMarkHelp, //标类帮助
    ProtocolTyReturnedMoneyHelp,//回款帮助
    ProtocolTypeActivityHelp,//活动类帮助
    ProtocolAssignmentOfDebtHelp,//债权转让帮助
    ProtocolTypeAbout, //关于我们
    ProtocolTypeRule,  //规则说明
};
#import <UIKit/UIKit.h>


@interface WebViewController : UIViewController

@property (strong, nonatomic) NSString *navTitle;

@property (strong, nonatomic) NSString *urlStr;


@property (assign, nonatomic) ProtocolType protocolType;

@end
