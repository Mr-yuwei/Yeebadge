//
//  TabBarViewController.m
//  BadgeViewDemo
//
//  Created by Yee on 2018/4/13.
//  Copyright © 2018年 Yee. All rights reserved.
//
/*
 一定要自己写,不能再借鉴了 两天要写完
 */

#import "TabBarViewController.h"
#import "ViewControllerTestOne.h"
#import "ViewControllerTestTwo.h"
#import "NSObject+IvarNSlog.h"
@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self addChildrenVC];
    [NSObject PrintClassIvar:[UITabBarItem class]];
}
-(void)addChildrenVC{
    
    ViewControllerTestOne *one= [[ViewControllerTestOne alloc] init];
     ViewControllerTestTwo *two= [[ViewControllerTestTwo alloc] init];
    UINavigationController *testOneNav=[[UINavigationController alloc] initWithRootViewController:one];
    UINavigationController *testTwoNav=[[UINavigationController alloc] initWithRootViewController:two];
    one.tabBarItem.image = [UIImage imageNamed:@"icon_gouwuche_yidianji"];
    one.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_gouwuche_yidianji"];
    testOneNav.title=@"one";
    testTwoNav.title=@"two";
    two.tabBarItem.image = [UIImage imageNamed:@"icon_gouwuche_yidianji"];
    two.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_gouwuche_yidianji"];
    self.viewControllers = @[testOneNav,testTwoNav];
    
}
- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
