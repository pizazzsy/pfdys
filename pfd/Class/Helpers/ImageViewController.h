//
//  ImageViewController.h
//  pfd
//
//  Created by PFZC on 2017/6/15.
//  Copyright © 2017年 PFZC. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, ImageType)
{
    ImageTypeNone = 0,
    ImageTypeSecurityAssurance = 1, //安全保障
};
@interface ImageViewController : UIViewController

@property (strong, nonatomic) NSString *navTitle;

@property (strong, nonatomic) NSString *imageStr;

@property (assign, nonatomic) ImageType imageType;
@end
