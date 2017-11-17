//
//  YeeProtocol.h
//  YeeBadgeDemo
//
//  Created by Yee on 2017/9/15.
//  Copyright © 2017年 CoderYee. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YeeProtocol <NSObject>

@optional

//添加子视图
-(void)addOwnViews;

//配置视图
-(void)configureViews;

//绑定ViewModel
-(void)bindViewModel;

@end
