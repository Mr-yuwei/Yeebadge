# Yeebadge

```
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


```
为任意视图添加小圆点和角标文字
