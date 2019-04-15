//
//  JCViewController.m
//  JCNetworking
//
//  Created by huqigu on 04/12/2019.
//  Copyright (c) 2019 huqigu. All rights reserved.
//

#import "JCViewController.h"
#import "FirstRequest.h"
#import "SecondRequest.h"
#import "JCNetwork.h"
@interface JCViewController ()

@end

@implementation JCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    for (int i = 0; i < 2; i ++) {
        
        CGFloat btnX = ([UIScreen mainScreen].bounds.size.width - 100) / 2.0;
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(btnX, 200 + 100 * i, 100, 50)];
        btn.backgroundColor = [UIColor greenColor];
        btn.tag = i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    
    [JCNetworkConfigManager updateNetworkConfig:^(JCNetworkConfig *config) {
        config.dataKey = @"data";
        config.code = @"10000";
        config.codeKey = @"code";
        config.messageKey = @"message";
    } forCategory:kFirstRequestCategoryKey];
}

- (void)btnClick:(UIButton *)btn {
    if (btn.tag == 0) {
        [self firstRequest];
    }else {
        [self secondRequest];
    }
}

- (void)firstRequest {
    FirstRequest *request = [[FirstRequest alloc] init];
    [request requestWithSuccess:^(id responseObj) {
        if (responseObj) {
            [self showAlertViewWithMessage:@"first request success"];
        }
    } failure:^(NSError *error) {
        [self showAlertViewWithMessage:error.localizedDescription];
    }];
}

- (void)secondRequest {
    SecondRequest *request = [[SecondRequest alloc] init];
    [request requestWithSuccess:^(id responseObj) {
        if (responseObj) {
            [self showAlertViewWithMessage:@"second request success"];
        }
    } failure:^(NSError *error) {
        [self showAlertViewWithMessage:error.localizedDescription];
    }];
}

- (void)showAlertViewWithMessage:(NSString *)message {
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alertVC addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController:alertVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
