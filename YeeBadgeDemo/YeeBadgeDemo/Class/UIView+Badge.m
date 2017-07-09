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
const static  void *YeeBadgeLableString =&YeeBadgeLableString;
@interface YeeBadgeLable : UILabel
{
    UIColor  *m_pTextClolor;         //字体颜色
    UIColor  *m_pBackGroundClolor;   //背景颜色
    UIFont   *m_pLableFont;          //字体大小
    CGSize    m_CMinSize;             //最小大小
    NSTextAlignment m_tTextAlignment; //对齐方式
}
@end

@implementation YeeBadgeLable

-(instancetype)init{
    
    if (self=[super init]) {
        
        m_pTextClolor=[UIColor  whiteColor];
        m_pBackGroundClolor=[UIColor  redColor];
        m_pLableFont=[UIFont systemFontOfSize:10];
        m_CMinSize=CGSizeMake(10, 10);
        m_tTextAlignment=NSTextAlignmentCenter;
    }
    return self;
}
-(void)makeBrdgeViewWithText:(NSString *)text textColor:(UIColor *)textColor   backColor:(UIColor *)backGColor textFont:(UIFont *)font tframe:(CGRect )frame{
    
    if (text.length==0) {
        
        CGFloat x_margin=frame.size.width-10; //12
        CGFloat y_margin=frame.size.height-10; //13
        self.frame=CGRectMake(frame.origin.x+x_margin*0.5, frame.origin.y+y_margin*0.5, 10, 10);
    }else{
       self.frame=frame;
    }
        self.backgroundColor=backGColor;
        self.textColor=textColor;
        self.font=font;
        self.text=text;
        self.textAlignment=m_tTextAlignment;
        self.layer.masksToBounds=YES;
        self.layer.cornerRadius=frame.size.height*0.5;
        m_pTextClolor=textColor;
        m_pBackGroundClolor=backGColor;
        m_pLableFont=font;
}
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    //根据自己的情况
    UIView *view = [super hitTest:point withEvent:event];
    if (view==self) {
        
        return self.superview;
    }
    return [super hitTest:point withEvent:event];
}

@end

@implementation UIView (Badge)

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
            
        }else if ([self isKindOfClass:[UITabBarItem class]]){
    
    
    
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
