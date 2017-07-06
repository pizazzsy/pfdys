//
//  HomeTopView.m
//  pfd
//
//  Created by PFZC on 2017/6/13.
//  Copyright © 2017年 PFZC. All rights reserved.
//

#import "HomeTopView.h"

@implementation HomeTopView

-(instancetype)initWithFrame:(CGRect)frame titleNames:(NSArray *)titles{
    
    self=[super initWithFrame:frame];
    if (self) {
        CGFloat btnW=self.frame.size.width/titles.count;
        CGFloat btnH=self.frame.size.height;
        for (NSInteger i=0; i<titles.count; i++) {
            UIButton *titleBtn=[UIButton buttonWithType:UIButtonTypeCustom];
            NSString * vcName=titles[i];
            [titleBtn setTitle:vcName forState:UIControlStateNormal];
            [titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            titleBtn.titleLabel.font=[UIFont systemFontOfSize:18];
            titleBtn.frame=CGRectMake(i*btnW, 0, btnW, btnH);
            [titleBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:titleBtn];
        }
    }
    return  self;
}
-(void)titleClick:(id)sender{
    
}
@end
