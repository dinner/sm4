//
//  ViewController.m
//  sm4Demo
//
//  Created by  on 17/4/13.
//  Copyright © 2017年 James. All rights reserved.
//

#import "ViewController.h"
#import "HexToStr.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString* input = @"today is Monday";
    unsigned char* ch_enc = [HexToStr hexEnc:input];//加密
    NSString* strEnc = [NSString stringWithFormat:@"%s",ch_enc];
    NSLog(@"%@",strEnc);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
