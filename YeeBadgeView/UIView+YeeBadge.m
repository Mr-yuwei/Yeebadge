//
//  UIView+YeeBadge.m
//  YeeBadgeView
//
//  Created by Yee on 2018/4/13.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import "UIView+YeeBadge.h"
#include <objc/runtime.h>
#import "YeeBadgeView.h"
#import "YeeBadgeProtocol.h"
static NSString *Yee_BadgeViewKey= @"Yee_BadgeViewKey";
static NSString *Yee_BadgeViewTopConstraintKey  = @"Yee_BadgeViewTopConstraintKey";
static NSString *Yee_BadgeViewRightConstraintKey= @"Yee_BadgeViewRightConstraintKey";
@implementation UIView (YeeBadge)
- (YeeBadgeView*)_yeeBadgeView{
    YeeBadgeView *yeeBadgeView = objc_getAssociatedObject(self,&Yee_BadgeViewKey);
    if (!yeeBadgeView) {
        yeeBadgeView  = [[YeeBadgeView alloc] init];
        yeeBadgeView.hidden = YES;
        yeeBadgeView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:yeeBadgeView];
        objc_setAssociatedObject(self,&Yee_BadgeViewKey,yeeBadgeView,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return yeeBadgeView;
}
- (void)_yeeLayoutBadgeView{
    NSLayoutConstraint *topConstraint   = objc_getAssociatedObject(self, &Yee_BadgeViewTopConstraintKey);
    NSLayoutConstraint *rightConstraint = objc_getAssociatedObject(self, &Yee_BadgeViewRightConstraintKey);
    if (topConstraint)   [self removeConstraint:topConstraint];
    if (rightConstraint) [self removeConstraint:rightConstraint];
    topConstraint = [NSLayoutConstraint constraintWithItem:[self _yeeBadgeView] attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:self.redDotOffset.y];
    rightConstraint = [NSLayoutConstraint constraintWithItem:[self _yeeBadgeView] attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:self.redDotOffset.x];
    [self addConstraints:@[topConstraint,rightConstraint]];
    objc_setAssociatedObject(self, &Yee_BadgeViewTopConstraintKey,topConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, &Yee_BadgeViewRightConstraintKey,rightConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)setRedDotRadius:(CGFloat)redDotRadius{
    [self _yeeBadgeView].redDotRadius = redDotRadius;
}
- (CGFloat)redDotRadius{
    return [self _yeeBadgeView].redDotRadius;
}
- (void)setRedDotNumber:(NSInteger)redDotNumber{
    if (redDotNumber == 0) [self hideBadgeView];
    [self _yeeBadgeView].redDotNumber = redDotNumber;
}
- (NSInteger)redDotNumber{
    return  [self _yeeBadgeView].redDotNumber;
}
- (void)setRedDotMaxNumber:(NSInteger)redDotMaxNumber{
    if (redDotMaxNumber == 0) return;
    [self _yeeBadgeView].redDotMaxNumber = redDotMaxNumber;
}
- (NSInteger)redDotMaxNumber{
    return [self _yeeBadgeView].redDotMaxNumber;
}
- (void)setRedDotColor:(UIColor *)redDotColor{
    if (redDotColor == nil) redDotColor = [UIColor redColor];
    [self _yeeBadgeView].redDotColor = redDotColor;
}
- (UIColor*)redDotColor{
    return  [self _yeeBadgeView].redDotColor;
}
- (void)setRedDotText:(NSString *)redDotText{
    if (redDotText.length == 0) [self hideBadgeView];
    [self _yeeBadgeView].redDotText = redDotText;
}
- (NSString*)redDotText{
    return [self  _yeeBadgeView].redDotText;
}
- (void)setRedDotTextColor:(UIColor *)redDotTextColor{
    if (redDotTextColor == nil) redDotTextColor = [UIColor whiteColor];
    [self _yeeBadgeView].redDotTextColor = redDotTextColor;
}
- (UIColor*)redDotTextColor{
    return [self _yeeBadgeView].redDotTextColor;
}
- (void)setRedDotTextFont:(UIFont *)redDotTextFont{
    if (redDotTextFont == nil) redDotTextFont = [UIFont systemFontOfSize:12];
    [self _yeeBadgeView].redDotTextFont = redDotTextFont;
}
- (UIFont*)redDotTextFont{
    return  [self _yeeBadgeView].redDotTextFont;
}
- (void)setRedDotOffset:(CGPoint)redDotOffset{
    [self _yeeBadgeView].redDotOffset = redDotOffset;
    [self _yeeLayoutBadgeView];
}
- (CGPoint)redDotOffset{
    return [self _yeeBadgeView].redDotOffset;
}
- (void)setRedDotBorderColor:(UIColor *)redDotBorderColor{
    if (redDotBorderColor == nil) redDotBorderColor = [UIColor clearColor];
    [self _yeeBadgeView].redDotBorderColor = redDotBorderColor ;
}
- (UIColor*)redDotBorderColor{
    return [self _yeeBadgeView].redDotBorderColor;
}
- (void)setRedDotBorderWidth:(CGFloat)redDotBorderWidth{
    [self _yeeBadgeView].redDotBorderWith = redDotBorderWidth;
}
- (CGFloat)redDotBorderWidth{
    return [self _yeeBadgeView].redDotBorderWidth;
}
- (void)ShowBadgeView{
    if ([self _yeeBadgeView].hidden == YES) {
        [self _yeeBadgeView].hidden = NO;
    }
    [self _yeeLayoutBadgeView];
}
- (void)hideBadgeView{
    if ([self _yeeBadgeView].hidden == YES) return;
    [self _yeeBadgeView].hidden = YES;
}
@end
