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

@implementation UITabBarItem (YeeBadge)
- (id)forwardingTargetForSelector:(SEL)aSelector{
    struct objc_method_description  description =
    protocol_getMethodDescription(@protocol(YeeBadgeProtocol), aSelector, NO, YES);
    if (description.name != NULL) {
        return  [self findBadgeTargetView];
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
@end


