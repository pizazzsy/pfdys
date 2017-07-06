//
//  ImageViewController.m
//  pfd
//
//  Created by PFZC on 2017/6/15.
//  Copyright © 2017年 PFZC. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ImageViewController
- (id)init
{
    if (self == [super init]) {
        _imageType = ImageTypeNone;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = _navTitle;
//    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back2"] style:UIBarButtonItemStyleDone target:self action:@selector(goBackAction:)];
//    self.navigationItem.leftBarButtonItem = leftItem;
    
    [self showHtmlWithProtocolType:_imageType];
    

}
- (void)showHtmlWithProtocolType:(ImageType)imageType
{
    switch (imageType) {
        case ImageTypeNone:
        {
           
        }
             break;
        case ImageTypeSecurityAssurance:
        {
            [_imageView setImage:[UIImage imageNamed:_imageStr]];
        }
             break;
            default:
            break;
    }
}
-(void)goBackAction:(UIBarButtonItem *)sender
{

    [self.navigationController popViewControllerAnimated:YES];
    
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
