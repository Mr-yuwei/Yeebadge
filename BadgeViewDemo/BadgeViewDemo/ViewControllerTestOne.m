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
    if (@available(iOS 10.0, *)) {
        self.tabBarItem.badgeColor =[UIColor redColor];
    } else {
        // Fallback on earlier versions
    }

    UITabBarItem *tabBar = self.tabBarItem;
      NSLog(@"%@ ",tabBar);
    UIView *UITabBarButton  = [tabBar  valueForKey:@"view"];
 
    
  
    for (UIView *view in UITabBarButton.subviews) {
        
        NSLog(@" calssName_ %@",NSStringFromClass([view class]));
    }
    
    
    //[NSObject PrintClassIvar:[YeeBadgeView class]];
}
-(void)add_OwnView{
    
    m_pContentView=[[UIView alloc] initWithFrame:CGRectMake(35, 120, 100, 35)];
    [m_pContentView setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:m_pContentView];
    YeeBadgeView *m_pBadgeView=[YeeBadgeView  new];
////    m_pBadgeView.redDotNumber = 2;
//    m_pBadgeView.redDotText=@"12";
//      m_pBadgeView.redDotText=@"12";
    [m_pContentView addSubview:m_pBadgeView];
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
