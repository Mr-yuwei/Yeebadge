//
//  UITabBarItem+YeeBadge.m
//  YeeBadgeView
//
//  Created by Yee on 2018/4/13.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import "UITabBarItem+YeeBadge.h"
#include <objc/runtime.h>
#import "UIView+YeeBadge.h"
#import "YeeBadgeView.h"

static NSString *Yee_BadgeViewRedBorderWidthKey= @"Yee_BadgeViewRedBorderWidthKey";
static NSString *Yee_BadgeViewRedBorderColorKey  = @"Yee_BadgeViewRedBorderColorKey";
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-implementation"
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"
@implementation UITabBarItem (YeeBadge)
- (id)forwardingTargetForSelector:(SEL)aSelector{

    struct objc_method_description  description = protocol_getMethodDescription(@protocol(YeeBadgeProtocol), aSelector, NO, YES);
    if (description.name != NULL) {
        
        return [self findBadgeTargetView];
    }
    return  [super forwardingTargetForSelector:aSelector];;
}
- (UIView*)findBadgeTargetView{
    UIView *view= [self valueForKey:@"_view"];
    UIView *_badgeView;
    for (UIView *subViews in view.subviews) {
        if ([subViews isKindOfClass:[UIImageView class]]) {
            _badgeView = subViews;
            break;
        }
    }
    return _badgeView;
}
- (void)setRedDotBorderColor:(UIColor *)redDotBorderColor{
    objc_setAssociatedObject(self, &Yee_BadgeViewRedBorderColorKey, redDotBorderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [[self findBadgeTargetView] _yeeBadgeView].redDotBoderColor = redDotBorderColor;
}

-(UIColor *)redDotBorderColor{
    return objc_getAssociatedObject(self, &Yee_BadgeViewRedBorderColorKey);
    
}

- (void)setRedDotBorderWidth:(CGFloat)redDotBorderWidth{
    objc_setAssociatedObject(self, &Yee_BadgeViewRedBorderWidthKey, [NSNumber numberWithFloat:redDotBorderWidth], OBJC_ASSOCIATION_ASSIGN);
    [[self findBadgeTargetView] _yeeBadgeView].redDotBorderWith = redDotBorderWidth;
}

- (CGFloat)redDotBorderWidth{
    return [objc_getAssociatedObject(self, &Yee_BadgeViewRedBorderWidthKey) floatValue];
}


- (void)hideBadgeView{
    [[self findBadgeTargetView] hideBadgeView];
    
}

- (void)ShowBadgeView{
    
    [[self findBadgeTargetView] ShowBadgeView];
}


@end

#pragma clang diagnostic pop
#pragma clang diagnostic pop
