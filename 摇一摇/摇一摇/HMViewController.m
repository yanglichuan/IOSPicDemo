//
//  HMViewController.m
//  摇一摇
//
//  Created by apple on 14-9-4.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HMViewController.h"

@interface HMViewController ()

@end

@implementation HMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    // 发送请求
    NSLog(@"motionBegan");
}



@end
