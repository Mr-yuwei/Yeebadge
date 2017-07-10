//
//  UITabBarItem+Badge.h
//  YeeBadgeDemo
//
//  Created by Yee on 2017/7/10.
//  Copyright © 2017年 CoderYee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarItem (Badge)

-(void)yee_MakeBadgeTextNum:(NSInteger )textNum
                  textColor:(UIColor *)tColor
                  backColor:(UIColor *)backColor
                       Font:(UIFont*)tfont;

-(void)yee_MakeRedBadge:(CGFloat)corner color:(UIColor *)cornerColor;


-(void)removeBadgeView;

@end
