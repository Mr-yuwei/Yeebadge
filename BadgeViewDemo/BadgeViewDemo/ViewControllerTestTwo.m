//
//  ViewControllerTestTwo.m
//  BadgeViewDemo
//
//  Created by Yee on 2018/4/13.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import "ViewControllerTestTwo.h"

@interface ViewControllerTestTwo ()
{

    
    
}
@end

@implementation ViewControllerTestTwo

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title=@"two";
    self.tabBarItem.badgeValue=@"1355";
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
