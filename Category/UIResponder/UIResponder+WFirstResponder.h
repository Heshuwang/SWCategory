//
//  UIResponder+WFirstResponder.h
//  HYPlatform
//
//  Created by hs on 2018/7/14.
//  Copyright © 2018年 hs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (WFirstResponder)

/**
 获取当前第一相应者
 @return <#return value description#>
 */
+ (id)currentFirstResponder;

@end
