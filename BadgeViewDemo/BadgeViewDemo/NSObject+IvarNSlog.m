//
//  NSObject+IvarNSlog.m
//  BadgeViewDemo
//
//  Created by Yee on 2018/4/13.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import "NSObject+IvarNSlog.h"
#import <objc/runtime.h>
@implementation NSObject (IvarNSlog)

+(void)PrintClassIvar:(Class)subClass{

    NSAssert(subClass, @"class should no be nil");
    unsigned int  count;
    Ivar  *ivarArry = class_copyIvarList([subClass class], &count);
    for (NSInteger i=0; i<count; i++) {
        Ivar  ivar = ivarArry [i];
        NSLog(@" ivar_ %s code_%s" ,ivar_getName(ivar),ivar_getTypeEncoding(ivar));
    }
    unsigned int  pcount ;
    objc_property_t *property_t = class_copyPropertyList([subClass class], &pcount);
    for (NSInteger i=0; i<pcount; i++) {
        objc_property_t  property = property_t[i];
    
        NSLog(@"objc_property_t %s code_%s" ,property_getName(property),property_getAttributes(property));
    }
    free(ivarArry);
    free(property_t);
}

+(void)PrintClassMethod:(Class)subClass{
    
    
}

@end
