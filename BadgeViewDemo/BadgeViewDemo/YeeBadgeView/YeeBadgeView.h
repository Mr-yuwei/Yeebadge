//
//  YeeBadgeView.h
//  BadgeViewDemo
//
//  Created by Yee on 2018/4/13.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,YeeBadgeStytle){
   YeeBadgeRedDotStytle,
   YeeBadgeNumberStytle,
   YeeBadgeTextStytle,
};
@interface YeeBadgeView : UIView

@property(nonatomic,assign)YeeBadgeStytle redDotStytle;
@property(nonatomic,assign)CGFloat   redDotRadius;     // only RedDotStytle   default is  3
@property(nonatomic,assign)CGFloat   redDotBorderWith; // default is  0
@property(nonatomic,assign)NSInteger redDotNumber;     // default is  0
@property(nonatomic,assign)NSInteger redDotMaxNumber; // default 99
@property(nonatomic,copy)  NSString  *redDotText;
@property(nonatomic,retain)UIColor   *redDotColor;
@property(nonatomic,retain)UIColor   *redDotBoderColor;
@property(nonatomic,retain)UIColor   *redDotTextColor;
@property(nonatomic,retain)UIFont    *redDotTextFont;
@property(nonatomic,assign)CGPoint   redDotOffset;   // default is (0.0)

@end
