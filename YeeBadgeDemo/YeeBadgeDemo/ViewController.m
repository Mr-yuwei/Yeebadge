//
//  ViewController.m
//  YeeBadgeDemo
//
//  Created by Yee on 2017/7/9.
//  Copyright © 2017年 CoderYee. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Badge.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //UIButton
    //UIImageView
    //UIView
    
    UIView *blueView=[[UIView alloc] init];
    
    [blueView setFrame:CGRectMake(40, 70, 200, 20)];
    [blueView  yee_MakeBadgeText:@"" textColor:[UIColor whiteColor] backColor:[UIColor redColor] Font:[UIFont systemFontOfSize:10]];
    [blueView setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:blueView];
    
    UIView *grayView=[[UIView alloc] init];
    
    [grayView setFrame:CGRectMake(40, 120, 200, 20)];
    [grayView  yee_MakeBadgeText:@"100" textColor:[UIColor whiteColor] backColor:[UIColor redColor] Font:[UIFont systemFontOfSize:10]];
    [grayView setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:grayView];
    
    
    UIButton *buttonView=[UIButton buttonWithType:UIButtonTypeCustom];
    [buttonView setFrame:CGRectMake(40, 180, 50, 40)];
    [buttonView setImage:[UIImage imageNamed:@"artical_detail_icon_comment_disabled"] forState:UIControlStateNormal];
    [buttonView  yee_MakeBadgeText:@"2345" textColor:[UIColor whiteColor] backColor:[UIColor redColor] Font:[UIFont systemFontOfSize:9]];
    
    [self.view addSubview:buttonView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
