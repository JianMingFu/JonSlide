//
//  JFSlideManager.m
//  JonLeftSlide
//
//  Created by Jon Fu on 2018/6/25.
//  Copyright © 2018年 Jon Fu. All rights reserved.
//

#import "JFSlideManager.h"

@implementation JFSlideManager

static id _instance;
+ (instancetype)sharedInstance {
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        _instance = [[self alloc] init];
    });
    return _instance;
}

@end
