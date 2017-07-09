//
//  UIView+Badge.h
//  Yeebadge
//
//  Created by Yee on 2017/7/9.
//  Copyright © 2017年 CoderYee. All rights reserved.
// 需要根据文字的多少显示UI布局
// 有的只需要显示小红点-->无标题
// 有数字标题栏

#import <UIKit/UIKit.h>

@interface UIView (Badge)

//设
-(void)yee_MakeBadgeText:(NSString *)text
               textColor:(UIColor *)tColor
               backColor:(UIColor *)backColor
                    Font:(UIFont*)tfont;

//只设置小圆点
//-(void)yee_MakeRedBadge:(CGFloat)corners color:(UIColor *)circleColor;

-(void)removeBadgeView;

@end
