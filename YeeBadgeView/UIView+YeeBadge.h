//
//  UIView+YeeBadge.h
//  YeeBadgeView
//
//  Created by Yee on 2018/4/13.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YeeBadgeProtocol.h"
@interface UIView (YeeBadge)<YeeBadgeProtocol>
@property(nonatomic,assign)CGFloat   redDotRadius;
@property(nonatomic,assign)NSInteger redDotNumber;
@property(nonatomic,assign)NSInteger redDotMaxNumber;
@property(nonatomic,copy)  NSString  *redDotText;
@property(nonatomic,retain)UIColor   *redDotColor;
@property(nonatomic,retain)UIColor   *redDotTextColor;
@property(nonatomic,retain)UIFont    *redDotTextFont;
@property(nonatomic,assign)CGPoint   redDotOffset;   // default is (0.0)
@property(nonatomic,assign)CGFloat   redDotBorderWidth;
@property(nonatomic,retain)UIColor   *redDotBorderColor;
// show badgeView
- (void)ShowBadgeView;
// hiden badgeView
- (void)hideBadgeView;

@end
