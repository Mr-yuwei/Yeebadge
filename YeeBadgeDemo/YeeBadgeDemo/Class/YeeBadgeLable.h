//
//  YeeBadgeLable.h
//  YeeBadgeDemo
//
//  Created by Yee on 2017/7/10.
//  Copyright © 2017年 CoderYee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YeeBadgeLable : UILabel

-(void)makeBrdgeViewWithText:(NSString *)text textColor:(UIColor *)textColor   backColor:(UIColor *)backGColor textFont:(UIFont *)font tframe:(CGRect )frame;

-(void)makeBrdgeViewWithCor:(CGFloat )corner CornerColor:(UIColor *)cornerColor;


@end
