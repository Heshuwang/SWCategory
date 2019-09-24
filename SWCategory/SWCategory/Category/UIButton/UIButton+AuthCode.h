//
//  UIButton+AuthCode.h
//  personal
//
//  Created by  on 2017/8/8.
//  Copyright © 2017年 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (AuthCode)

/** 开启倒计时效果
 *iTime 倒计时事件
 **/
-(void)openCountdownWithTime:(NSTimeInterval)iTime;

-(void)buttonWithcolor:(UIColor *)color iTime:(NSTimeInterval)iTime;
@end
