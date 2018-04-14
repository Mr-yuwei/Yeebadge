//
//  ViewControllerTestOne.m
//  BadgeViewDemo
//
//  Created by Yee on 2018/4/13.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import "ViewControllerTestOne.h"
#import "YeeBadgeView.h"
#import "NSObject+IvarNSlog.h"
#import "YeeBadgeViewHeader.h"
@interface ViewControllerTestOne ()
{
    UIView *m_pContentView;
}
@end

@implementation ViewControllerTestOne

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title=@"one";
    [self add_OwnView];
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(0, 0, 25, 35)];
    [btn setTitle:@"test" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    UIBarButtonItem *barItem=[[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem =barItem;
    self.tabBarItem.redDotColor =[UIColor blueColor];
    self.tabBarItem.redDotNumber = 100;
    [self.tabBarItem ShowBadgeView];
    
    self.navigationItem.leftBarButtonItem.redDotColor =[UIColor blueColor];
    self.navigationItem.leftBarButtonItem.redDotRadius = 5.0;
    self.navigationItem.leftBarButtonItem.redDotNumber = 100;
    [self.navigationItem.leftBarButtonItem ShowBadgeView];
    
    [NSObject PrintClassIvar:[UIBarButtonItem class]];
}
-(void)add_OwnView{
    
    m_pContentView=[[UIView alloc] initWithFrame:CGRectMake(35, 120, 100, 35)];
    [m_pContentView setBackgroundColor:[UIColor blueColor]];
    [m_pContentView ShowBadgeView];
    [self.view addSubview:m_pContentView];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    self.tabBarItem.redDotNumber = arc4random()%100;
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
