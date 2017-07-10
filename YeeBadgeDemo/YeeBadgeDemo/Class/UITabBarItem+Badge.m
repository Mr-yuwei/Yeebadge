//
//  UITabBarItem+Badge.m
//  YeeBadgeDemo
//
//  Created by Yee on 2017/7/10.
//  Copyright © 2017年 CoderYee. All rights reserved.
//

#import "UITabBarItem+Badge.h"
#import "YeeBadgeLable.h"
#include <objc/runtime.h>
 const  static NSString *Yee_TabBar_BadgeLableString=@"Yee_TabBar_BadgeLableString";
@implementation UITabBarItem (Badge)

-(void)yee_MakeBadgeTextNum:(NSInteger )textNum
                  textColor:(UIColor *)tColor
                  backColor:(UIColor *)backColor
                       Font:(UIFont*)tfont{
    if (textNum>99) {
        
    }
}
-(void)yee_MakeRedBadge:(CGFloat)corner color:(UIColor *)cornerColor{
    
    UIView *TabBar_item_=[self valueForKey:@"_view"];
    UIView *UITabBarSwappableImageView=[self findSwappableImageViewByInView:TabBar_item_];
    if ([self yee_BadgeLable]==nil) {//如果没有绑定就重新创建,然后绑定
        YeeBadgeLable *badgeLable =[[YeeBadgeLable alloc] init];
        objc_setAssociatedObject(self, &Yee_TabBar_BadgeLableString, badgeLable, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
          [UITabBarSwappableImageView addSubview:badgeLable];
    }
    
    [[self yee_BadgeLable]setFrame:CGRectMake(UITabBarSwappableImageView.frame.size.width-corner, -corner, corner*2.0, corner*2.0)];
    
    [[self  yee_BadgeLable] makeBrdgeViewWithCor:corner CornerColor:cornerColor];

    
    
}
-(void)removeBadgeView{
    
    [[self yee_BadgeLable] removeFromSuperview];
}
-(YeeBadgeLable *)yee_BadgeLable{
    
    YeeBadgeLable *badgeLable=objc_getAssociatedObject(self, &Yee_TabBar_BadgeLableString);
    return badgeLable;
}
-(UIView *)findSwappableImageViewByInView:(UIView *)inView{
    
    for (UIView *subView in inView.subviews) {
        
        
        if ([subView isKindOfClass:[UIImageView class]]) {
            
            return subView;
        }
        
    }
    return nil;
}
@end
