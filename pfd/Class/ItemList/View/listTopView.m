//
//  listTopView.m
//  pfd
//
//  Created by PFZC on 2017/6/13.
//  Copyright © 2017年 PFZC. All rights reserved.
//

#import "listTopView.h"



@interface listTopView ()
@property(strong ,nonatomic)UIButton*btn;

@end
@implementation listTopView



-(instancetype)initWithFrame:(CGRect)frame titleNames:(NSArray *)titles{
    
    self=[super initWithFrame:frame];
    if (self) {
        CGFloat btnW=self.frame.size.width/titles.count;
        CGFloat btnH=self.frame.size.height;
        for (NSInteger i=0; i<titles.count; i++) {
            UIButton *titleBtn=[UIButton buttonWithType:UIButtonTypeCustom];
            NSString * vcName=titles[i];
            [titleBtn setTitle:vcName forState:UIControlStateNormal];
            [titleBtn setTitleColor:RGB(255,55,0,1) forState:UIControlStateNormal];
            titleBtn.titleLabel.font=[UIFont systemFontOfSize:12];
            
            titleBtn.tag=i;
            
            titleBtn.frame=CGRectMake(i*btnW, 8, btnW, btnH);
            [titleBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
            [titleBtn setBackgroundImage:[UIImage imageNamed:@"xmlb_tb"] forState:UIControlStateNormal];
            [titleBtn setBackgroundImage:[UIImage imageNamed:@"xmlb_tb2"] forState:UIControlStateSelected];
            [self addSubview:titleBtn];
            
            if (i == 0)
            {
                [titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal
                 ];
                [titleBtn setSelected:YES];
                _btn=titleBtn;
            }
        }
    }

    return  self;
}
-(void)titleClick:(UIButton*)sender{
    
    self.block(sender.tag);
    
    if(_btn== sender) {
        //上次点击过的按钮，不做处理
    } else{
        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal
         ];
         [sender setSelected:YES];
        //本次点击的按钮设为红色
        [_btn setTitleColor:RGB(255,55,0,1) forState:UIControlStateNormal];
        //将上次点击过的按钮设为黑色
        [_btn setSelected:NO];
    }
    _btn= sender;
   
    }


@end
