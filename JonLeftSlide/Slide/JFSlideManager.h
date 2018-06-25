//
//  JFSlideManager.h
//  JonLeftSlide
//
//  Created by Jon Fu on 2018/6/25.
//  Copyright © 2018年 Jon Fu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JFSlideViewController.h"

@interface JFSlideManager : NSObject

+ (instancetype)sharedInstance;

@property (strong, nonatomic) JFSlideViewController *slideVC;

@end
