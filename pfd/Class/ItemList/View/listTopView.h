//
//  listTopView.h
//  pfd
//
//  Created by PFZC on 2017/6/13.
//  Copyright © 2017年 PFZC. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^listTopBlock)(NSInteger tag);
@interface listTopView : UIView
-(instancetype)initWithFrame:(CGRect)frame titleNames:(NSArray*)titles;
@property(nonatomic,copy)listTopBlock block;
@end
