//
//  ViewController.m
//  YeeBadgeDemo
//
//  Created by Yee on 2017/7/9.
//  Copyright © 2017年 CoderYee. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Badge.h"
#include <objc/runtime.h>
#import "UITabBarItem+Badge.h"

@interface ViewController ()
{
    
    NSInteger    m_iCount;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //UIButton
    //UIImageView
    //UIView
    
    UIView *blueView=[[UIView alloc] init];
    
    [blueView setFrame:CGRectMake(40, 70, 200, 20)];
    [blueView  yee_MakeBadgeText:@"1" textColor:[UIColor whiteColor] backColor:[UIColor greenColor] Font:[UIFont systemFontOfSize:10]];
    [blueView setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:blueView];
    
    UIView *grayView=[[UIView alloc] init];
    
    [grayView setFrame:CGRectMake(40, 120, 200, 20)];
    [grayView  yee_MakeRedBadge:3.0 color:[UIColor redColor]];
    
    
    [grayView setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:grayView];
    
    
    UIButton *buttonView=[UIButton buttonWithType:UIButtonTypeCustom];
    [buttonView setFrame:CGRectMake(40, 180, 50, 40)];
    [buttonView setImage:[UIImage imageNamed:@"artical_detail_icon_comment_disabled"] forState:UIControlStateNormal];
    [buttonView  yee_MakeBadgeText:@"2345" textColor:[UIColor whiteColor] backColor:[UIColor redColor] Font:[UIFont systemFontOfSize:9]];
    
    [self.view addSubview:buttonView];
    
    [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
      
        [buttonView  yee_MakeBadgeText:[NSString stringWithFormat:@"%ld",m_iCount]  textColor:[UIColor whiteColor] backColor:[UIColor redColor] Font:[UIFont systemFontOfSize:9]];
        m_iCount++;
    }];
    
    
    unsigned int count = 0;
    Ivar *property = class_copyIvarList([UITabBarItem class], &count);
    for (int i = 0; i < count; i++) {
        
        Ivar var = property[i];
        const char *name = ivar_getName(var);
        const char *type = ivar_getTypeEncoding(var);
        NSLog(@"%s =============== %s",name,type);
        
    }
    
   // UIView *TabBar_item_=[self.tabBarItem valueForKey:@"_view"];
    
    

//    UIView *UITabBarSwappableImageView=[TabBar_item_ valueForKey:@"UITabBarSwappableImageView"];
    
    
    
    [self.tabBarItem yee_MakeRedBadge:2.0 color:[UIColor blueColor]];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.tabBarItem removeBadgeView];
    });
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
