//
//  ViewController.m
//  webivew 事件与内容获取
//
//  Created by zkingsoft on 15/5/15.
//  Copyright (c) 2015年 zkingsoft. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>
{
  
    UIWebView *_webV;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _webV=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    NSURL *url=[NSURL URLWithString:@"https://www.baidu.com"];
    NSURLRequest *request=[[NSURLRequest alloc]initWithURL:url];
    _webV.delegate=self;
    _webV.scalesPageToFit=YES;
    [_webV loadRequest:request];
    [self.view addSubview:_webV];
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if (navigationType==UIWebViewNavigationTypeLinkClicked) {
        NSLog(@"用户触发了一个链接");
    }
    else if (navigationType==UIWebViewNavigationTypeFormSubmitted) {
        NSLog(@"用户提交了一个表单");
    }
    else if (navigationType==UIWebViewNavigationTypeBackForward) {
        NSLog(@"用户触击前进或返回按钮");
    }
    else if (navigationType==UIWebViewNavigationTypeReload) {
        NSLog(@"用户触击重新加载的按钮");
    }
    else if (navigationType==UIWebViewNavigationTypeFormResubmitted) {
        NSLog(@"用户重复提交表单");
    }
    else
    {
       NSLog(@"发生其他行为");
    }
    
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{

}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSString *currentURL = [webView stringByEvaluatingJavaScriptFromString:@"document.location.href"];
    NSLog(@"当前url地址：%@",currentURL);
    NSString *title=[webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    NSLog(@"当前页面标题：%@",title);
    //修改界面元素的值
   // NSString *js_result = [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByName('q')[0].value='朱祁林';"];
    //提交表单
    //NSString *js_result2 = [webView stringByEvaluatingJavaScriptFromString:@"document.forms[0].submit(); "];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"发生错误：%@",error);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
