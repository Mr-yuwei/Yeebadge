//
//  UIView+Badge.m
//  Yeebadge
//
//  Created by Yee on 2017/7/9.
//  Copyright © 2017年 CoderYee. All rights reserved.
//

#import "UIView+Badge.h"
#include <objc/runtime.h>
#import <UIKit/UIKit.h>
#import "YeeBadgeLable.h"
const static  void *YeeBadgeLableString =&YeeBadgeLableString;
@implementation UIView (Badge)
//只是设置圆点
-(void)yee_MakeRedBadge:(CGFloat)corner color:(UIColor *)cornerColor{
  //圆点大小
  //圆点颜色
    if ([self yee_BadgeLable]==nil) {//如果没有绑定就重新创建,然后绑定
        YeeBadgeLable *badgeLable =[[YeeBadgeLable alloc] init];
        objc_setAssociatedObject(self, YeeBadgeLableString, badgeLable, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self addSubview:badgeLable];
    }
    [[self yee_BadgeLable]setFrame:CGRectMake(self.frame.size.width-corner, -corner, corner*2.0, corner*2.0)];
    [[self  yee_BadgeLable] makeBrdgeViewWithCor:corner CornerColor:cornerColor];
}
-(void)yee_MakeBadgeText:(NSString *)text
               textColor:(UIColor *)tColor
               backColor:(UIColor *)backColor
                    Font:(UIFont*)tfont{
    if ([self yee_BadgeLable]==nil) {//如果没有绑定就重新创建,然后绑定
        YeeBadgeLable *badgeLable =[[YeeBadgeLable alloc] init];
        objc_setAssociatedObject(self, YeeBadgeLableString, badgeLable, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self addSubview:badgeLable];
    }
    CGSize textSize=[self sizeWithString:text font:tfont constrainedToWidth:self.frame.size.width];
        if ([self isKindOfClass:[UIButton class]]) {
            UIButton *weakButton=(UIButton*)self;
            [[self  yee_BadgeLable] makeBrdgeViewWithText:text textColor:tColor backColor:backColor textFont:tfont tframe:CGRectMake(weakButton.imageView.frame.size.width*0.5+weakButton.imageView.frame.origin.x,weakButton.imageView.frame.origin.y, textSize.width+8.0, textSize.height)];
        }else{
    
         [[self  yee_BadgeLable] makeBrdgeViewWithText:text textColor:tColor backColor:backColor textFont:tfont tframe:CGRectMake(self.frame.size.width-(textSize.width+8.0)*0.5, -textSize.height*0.5, textSize.width+8.0, textSize.height)];
        }
}
-(void)removeBadgeView{
    
    [[self yee_BadgeLable] removeFromSuperview];
  
}
-(YeeBadgeLable *)yee_BadgeLable{
    
    YeeBadgeLable *badgeLable=objc_getAssociatedObject(self, YeeBadgeLableString);
    return badgeLable;
}
#pragma mark sizeLableText
-(CGSize)sizeWithString:(NSString *)string font:(UIFont *)font constrainedToWidth:(CGFloat)width{
    UIFont *textFont = font ? font : [UIFont systemFontOfSize:[UIFont systemFontSize]];
    
    CGSize textSize;
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED < 70000
    if ([string respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)])
    {
        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
        paragraph.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{NSFontAttributeName: textFont,
                                     NSParagraphStyleAttributeName: paragraph};
        textSize = [string boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                        options:(NSStringDrawingUsesLineFragmentOrigin |
                                                 NSStringDrawingTruncatesLastVisibleLine)
                                     attributes:attributes
                                        context:nil].size;
    } else
    {
        textSize = [string sizeWithFont:textFont
                      constrainedToSize:CGSizeMake(width, CGFLOAT_MAX)
                          lineBreakMode:NSLineBreakByWordWrapping];
    }
#else
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName: textFont,
                                 NSParagraphStyleAttributeName: paragraph};
    textSize = [string boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                    options:(NSStringDrawingUsesLineFragmentOrigin |
                                             NSStringDrawingTruncatesLastVisibleLine)
                                 attributes:attributes
                                    context:nil].size;
#endif
    
    return CGSizeMake(ceil(textSize.width), ceil(textSize.height));
    
}

@end
