//
//  ViewController.m
//  CircleButton
//
//  Created by zhaoxiafei on 17/3/24.
//  Copyright © 2017年 xigu. All rights reserved.
//

#import "ViewController.h"
#import "BlackBgView.h"
#import "CircleView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    BlackBgView *bgView = [[BlackBgView alloc]initWithFrame:CGRectMake(100, 10, 300, 300)];
    [self.view addSubview:bgView];
    bgView.backgroundColor = [UIColor blackColor];
    bgView.handleCircleView = ^(NSInteger viewTag1,NSInteger viewTag2)
    {
        NSLog(@"%ld---%ld",viewTag1,viewTag2);
        if ([[self.view viewWithTag:viewTag1] isMemberOfClass:[CircleView class]]) {
            CircleView *view = (CircleView *)[self.view viewWithTag:viewTag1];
            [view setCircleColor:[UIColor whiteColor]];
        }
        if ([[self.view viewWithTag:viewTag2] isMemberOfClass:[CircleView class]]) {
            CircleView *view = (CircleView *)[self.view viewWithTag:viewTag2];
            [view setCircleColor:[UIColor grayColor]];
        }
    };

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
