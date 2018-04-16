//
//  YeeBadgeView.m
//  BadgeViewDemo
//
//  Created by Yee on 2018/4/13.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import "YeeBadgeView.h"

static UIImage *_circleDotImage(CGFloat redDotRadius,UIColor  *redDotColor){
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(redDotRadius*2,redDotRadius*2),NO, [UIScreen mainScreen].scale);
    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0,redDotRadius*2,redDotRadius*2) cornerRadius:redDotRadius];
    [redDotColor setFill];
    [roundedRectanglePath fill];
    UIImage *image= UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
static UIImage  *_yeeRedDotImage(CGFloat redDotRadius,UIColor  *redDotColor , CGSize lableSize){
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(lableSize.width+5,lableSize.height),NO, [UIScreen mainScreen].scale);
    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, lableSize.width+5, lableSize.height) cornerRadius:redDotRadius];
    [redDotColor setFill];
    [roundedRectanglePath fill];
    UIImage *image= UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@interface YeeBadgeView ()
@property(nonatomic,retain)UIImageView *m_pBadgeImageView;
@property(nonatomic,retain)UILabel     *m_pBadgeLable;
@end
@implementation YeeBadgeView

-(instancetype)init{
    
    if (self=[super init]) {
       
        [self initConfigureView];
    }
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    if (self=[super initWithCoder:aDecoder]) {
        
         [self initConfigureView];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self=[super initWithFrame:frame]) {
        
        [self initConfigureView];
    }
    return self;
}
-(void)initConfigureView{
    
    _redDotStytle    =YeeBadgeRedDotStytle;
    _redDotRadius    =3.0;
    _redDotBorderWith=0.0;
    _redDotNumber    =0;
    _redDotMaxNumber =99;
    _redDotColor     =[UIColor redColor];
    _redDotBoderColor=[UIColor clearColor];
    _redDotTextColor =[UIColor whiteColor];
    _redDotTextFont  = [UIFont systemFontOfSize:12];
    [self add_SubViews];
    [self make_SubViewLayout];
    [self update_subViews];
}
#pragma mark  add_SubViews
-(void)add_SubViews
{    
    [self addSubview:self.m_pBadgeImageView];
    [self addSubview:self.m_pBadgeLable];
}
#pragma mark  update_subViews
-(void)update_subViews{
    
    switch (_redDotStytle) {
        case YeeBadgeRedDotStytle:
        {
            self.m_pBadgeLable.hidden=YES;
            self.m_pBadgeImageView.image = _circleDotImage(_redDotRadius,_redDotColor);
        }
            break;
        default:
        {
            [self.m_pBadgeLable sizeToFit];
            self.m_pBadgeLable.hidden=NO;
            self.m_pBadgeImageView.image = _yeeRedDotImage(self.m_pBadgeLable.frame.size.height, _redDotColor,self.m_pBadgeLable.frame.size);
        }
        break;
    }
}
-(void)setRedDotStytle:(YeeBadgeStytle)redDotStytle{
    if (_redDotStytle ==redDotStytle) return;
     _redDotStytle = redDotStytle;
    [self update_subViews];
}
-(void)setRedDotRadius:(CGFloat)redDotRadius{
    
    if (_redDotRadius==redDotRadius||_redDotStytle!=YeeBadgeRedDotStytle) return;
    _redDotRadius = redDotRadius;
    [self update_subViews];
}
-(void)setRedDotColor:(UIColor *)redDotColor{
    if (_redDotColor ==redDotColor) return;
    _redDotColor = redDotColor;
     [self update_subViews];
}
-(void)setRedDotNumber:(NSInteger)redDotNumber{
    if (_redDotNumber==redDotNumber)return;
    _redDotStytle = YeeBadgeNumberStytle;
    _redDotNumber = redDotNumber;
    self.m_pBadgeLable.text =[NSString stringWithFormat:@"%@",redDotNumber>_redDotMaxNumber?@"99+":@(redDotNumber)];
    [self update_subViews];
}
-(void)setRedDotTextFont:(UIFont *)redDotTextFont{
    
     _redDotTextFont = redDotTextFont;
     self.m_pBadgeLable.font = _redDotTextFont;
     [self update_subViews];
}
-(void)setRedDotText:(NSString *)redDotText{
    
    if ([_redDotText isEqualToString:redDotText]||redDotText.length==0) return;
       _redDotStytle = YeeBadgeTextStytle;
       _redDotText = redDotText;
       self.m_pBadgeLable.text =[NSString stringWithFormat:@"%@",redDotText];
       [self update_subViews];
}
-(void)setRedDotTextColor:(UIColor *)redDotTextColor{
    _redDotTextColor = redDotTextColor;
    self.m_pBadgeLable.textColor  = _redDotTextColor;
}
#pragma mark  make_SubViewLayout
-(void)make_SubViewLayout{
    
    NSLayoutConstraint *LableViewcenterXlayoutConstraint=[NSLayoutConstraint  constraintWithItem:self.m_pBadgeLable attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint *LableViewcenterYlayoutConstraint=[NSLayoutConstraint  constraintWithItem:self.m_pBadgeLable attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    NSLayoutConstraint *ImageViewcenterXlayoutConstraint=[NSLayoutConstraint  constraintWithItem:self.m_pBadgeImageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint *ImageViewcenterYlayoutConstraint=[NSLayoutConstraint  constraintWithItem:self.m_pBadgeImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    [self addConstraints:@[ImageViewcenterXlayoutConstraint,ImageViewcenterYlayoutConstraint,LableViewcenterXlayoutConstraint,LableViewcenterYlayoutConstraint]];
}
#pragma mark  lazy method
-(UIImageView*)m_pBadgeImageView{
    
    if (!_m_pBadgeImageView) {
        _m_pBadgeImageView=[[UIImageView alloc] init];
        _m_pBadgeImageView.contentMode = UIViewContentModeScaleAspectFit;
        _m_pBadgeImageView.translatesAutoresizingMaskIntoConstraints =NO;
    }
    return _m_pBadgeImageView;
}
-(UILabel*)m_pBadgeLable{
    
    if (!_m_pBadgeLable) {
        _m_pBadgeLable=[[UILabel alloc] init];
        _m_pBadgeLable.font=[UIFont systemFontOfSize:10];
        _m_pBadgeLable.textColor =[UIColor whiteColor];
        _m_pBadgeLable.text = @"";
        [_m_pBadgeLable sizeToFit];
        _m_pBadgeLable.hidden=YES;
        _m_pBadgeLable.textAlignment = NSTextAlignmentCenter;
        _m_pBadgeLable.translatesAutoresizingMaskIntoConstraints =NO;
    }
    return _m_pBadgeLable;
}
@end
