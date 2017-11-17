//
//  YeeBaseViiew.m
//  YeeBadgeDemo
//
//  Created by Yee on 2017/9/15.
//  Copyright © 2017年 CoderYee. All rights reserved.
//

#import "YeeBaseView.h"

@implementation YeeBaseView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self=[super initWithFrame:frame])
    {

        [self addOwnView];
        [self configureViews];
        [self bindViewModel];
    }
    
    return self;
}
//添加子视图
-(void)addOwnView{
    
    
}
//配置视图
-(void)configureViews{
    
    
}

//绑定ViewModel
-(void)bindViewModel{
    
    
}
@end
