//
//  TabBarViewController.m
//  YeeBadgeDemo
//
//  Created by Yee on 2017/7/10.
//  Copyright © 2017年 CoderYee. All rights reserved.
//

#import "TabBarViewController.h"
#include <objc/runtime.h>
@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureTab];
    
    NSArray *vcNames = @[@"ViewController", @"ViewController",@"UIViewController",  @"ViewController",@"ViewController"];
    
    NSArray *imageArray=@[@"icon_shouye_weidianji",@"icon_shoucang_weidianji",@"icon_gouwuche_weidianji",@"icon_gouwuche_weidianji",@"icon_shezhi_weidianji"];
    
    NSArray *selectedimageArray=@[@"icon_shouye_yidianji",@"icon_shoucang_yidianji",@"icon_gouwuche_yidianji",@"icon_gouwuche_yidianji",@"icon_shezhi_yidianji"];
    
    NSArray *titleArray=@[@"首页",@"类别",@"分类 ",@"购物车",@"我的"];
    NSMutableArray *vcArr = [NSMutableArray array];
    NSMutableArray *nvArr = [NSMutableArray array];
    for (NSInteger i = 0; i < vcNames.count; i++)
    {
        Class vcClass = NSClassFromString(vcNames[i]);
        UIViewController *vc = [[vcClass alloc] init];
        vc.title = titleArray[i];
        vc.tabBarItem.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageArray[i]] ];
        //vc.tabBarItem.badgeValue=@"1099";
        vc.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@",selectedimageArray[i]]];
        UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
        [vcArr addObject:vc];
        [nvArr addObject:nc];
    }
    self.viewControllers = nvArr;

   
   
    // Do any additional setup after loading the view.
}

#pragma mark --配置相关字体等
-(void)configureTab
{
    UITabBarItem *item                 = [UITabBarItem appearance];
    //设置默认状态文字的颜色
    NSMutableDictionary *md            = [NSMutableDictionary dictionary];
    
    md[NSForegroundColorAttributeName] = [UIColor  grayColor];
    [item setTitleTextAttributes:md forState:UIControlStateNormal];
    //设置高亮状态文字的颜色
    NSMutableDictionary *higMd            = [NSMutableDictionary dictionary];
    higMd[NSForegroundColorAttributeName] =[UIColor redColor];;
    [item setTitleTextAttributes:higMd forState:UIControlStateSelected];
    self.tabBar.tintColor = [UIColor redColor];
    
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
