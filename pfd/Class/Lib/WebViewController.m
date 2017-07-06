//
//  WebViewController.m
//  pfd
//
//  Created by PFZC on 2017/6/15.
//  Copyright © 2017年 PFZC. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UIWebViewDelegate>

@property (strong, nonatomic) UIWebView *webView;

@property (strong, nonatomic) UIActivityIndicatorView *loadingView;

@property (strong, nonatomic) UILabel *loadingtipsLab;

@end

@implementation WebViewController
- (id)init
{
    if (self == [super init]) {
        _protocolType = ProtocolTypeNone;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = _navTitle;
    [self setupView];
    
    [self showHtmlWithProtocolType:_protocolType];
    


}
- (void)showHtmlWithProtocolType:(ProtocolType)protocolType
{
    switch (protocolType) {
        case ProtocolTypeNone:
        {
            if (![_urlStr hasPrefix:@"http"]) {
                _urlStr = [NSString stringWithFormat:@"http://%@",_urlStr];
            }
            NSLog(@"_urlStr=%@",_urlStr);
            NSURL *url = [NSURL URLWithString:_urlStr];
            
            [_webView loadRequest:[NSURLRequest requestWithURL:url]];
            break;
        }
        case ProtocolTypeRgisterHelp:
        {
            NSURL *url = [NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"RegisterHelp" ofType:@"html"]];
            [_webView loadRequest:[NSURLRequest requestWithURL:url]];
            
            break;
        }
        case ProtocolTypeCashValueHelp:
        {
            NSURL *url = [NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"CashValueHelp" ofType:@"html"]];
            [_webView loadRequest:[NSURLRequest requestWithURL:url]];
            break;
        }
        case ProtocolTypeMarkHelp:
        {
            NSURL *url = [NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"MarkHelp" ofType:@"html"]];
            [_webView loadRequest:[NSURLRequest requestWithURL:url]];
            break;
        }
        case ProtocolTyReturnedMoneyHelp:
        {
            NSURL *url = [NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"ReturnedHelp" ofType:@"html"]];
            [_webView loadRequest:[NSURLRequest requestWithURL:url]];
            break;

            break;
        }
        case ProtocolTypeActivityHelp:
        {
            NSURL *url = [NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"ActivityHelp" ofType:@"html"]];
            [_webView loadRequest:[NSURLRequest requestWithURL:url]];
            break;
            break;
        }
        case ProtocolAssignmentOfDebtHelp:
        {
            NSURL *url = [NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"AssignmentOfDebtHelp" ofType:@"html"]];
            [_webView loadRequest:[NSURLRequest requestWithURL:url]];
            break;
            break;
        }
        case ProtocolTypeAbout:
        {
            NSURL *url = [NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"aboutUs" ofType:@"html"]];
            [_webView loadRequest:[NSURLRequest requestWithURL:url]];
            break;
        }
        case ProtocolTypeRule:
        {
            NSURL *url = [NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"ruleDescription" ofType:@"html"]];
            [_webView loadRequest:[NSURLRequest requestWithURL:url]];
            break;
        }

        default:
            break;
    }
}
- (void)setupView
{
//    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back2"] style:UIBarButtonItemStyleDone target:self action:@selector(goBackAction:)];
//    self.navigationItem.leftBarButtonItem = leftItem;
    
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, MAINWIDTH, MAINHEIGTH)];
    _webView.scalesPageToFit = YES;
    _webView.backgroundColor = COLOR_BG;
    _webView.delegate = self;
    [self.view addSubview:_webView];
    
    
    
    _loadingView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(100, 280, 20, 20)];
    
    _loadingView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    
    [self.view addSubview:_loadingView];
    
    _loadingtipsLab = [[UILabel alloc]initWithFrame:CGRectMake(122, 280, 86, 21)];
    _loadingtipsLab.textColor = RGB(58, 58, 58, 1);
    _loadingtipsLab.font = [UIFont systemFontOfSize:15];
    _loadingtipsLab.text = @"正在载入...";
    [self.view addSubview:_loadingtipsLab];
    
}
- (void)viewDidDisappear:(BOOL)animated
{
    self.webView = nil;
    _urlStr = nil;
    
    [SVProgressHUD dismiss];
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    _loadingView.hidden = NO;
    _loadingtipsLab.hidden = NO;
    [_loadingView startAnimating];
    
    
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    _loadingView.hidden = YES;
    _loadingtipsLab.hidden = YES;
    [_loadingView stopAnimating];
    
    
    //计算webView 显示的内容高度
    //    const CGFloat defaultWebViewHeight = 22.0;
    //    //reset webview size
    //    CGRect originalFrame = webView.frame;
    //    webView.frame = CGRectMakes(originalFrame.origin.x, originalFrame.origin.y, 320, defaultWebViewHeight);
    //
    //    CGSize actualSize = [webView sizeThatFits:CGSizeZero];
    //    if (actualSize.height <= defaultWebViewHeight) {
    //        actualSize.height = defaultWebViewHeight;
    //    }
    //    CGRect webViewFrame = webView.frame;
    //    webViewFrame.size.height = actualSize.height;
    //    webView.frame = webViewFrame;
    
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    _loadingView.hidden = YES;
    _loadingtipsLab.hidden = YES;
    [_loadingView stopAnimating];
    NSLog(@"%@",error);
    
    if ([error code] == NSURLErrorCancelled) {
        return;
    }
    
    
    if (error) {
        [AppUtils showErrorMessage:@"加载失败，请稍后再试！"];
    }else
    {
        [AppUtils dismissHUD];
    }
    
}

-(void) goBackAction:(UIBarButtonItem *)sender
{
    if ([_webView canGoBack]) {
        [_webView goBack];
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
        
    }
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
