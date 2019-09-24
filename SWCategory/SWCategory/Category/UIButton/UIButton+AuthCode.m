//
//  UIButton+AuthCode.m
//  personal
//
//  Created by  on 2017/8/8.
//  Copyright © 2017年 . All rights reserved.
//

#import "UIButton+AuthCode.h"

#define RGBOF(rgbValue)     [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@implementation UIButton (AuthCode)


// 开启倒计时效果
-(void)openCountdownWithTime:(NSTimeInterval)iTime
{
    [self buttonWithcolor:nil iTime:iTime];
}

-(void)buttonWithcolor:(UIColor *)color iTime:(NSTimeInterval)iTime{
    __block NSInteger time = iTime - 1; //倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        
        if(time <= 0){ //倒计时结束，关闭
            
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setTitle:@"获取验证码" forState:UIControlStateNormal];
                [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                if (!color) {
                    self.backgroundColor =kColorToStr(@"#a3a3a3");
                }else{
                    self.backgroundColor =color;
                }
                self.userInteractionEnabled = YES;
                self.enabled = YES;
            });
            
        }else{
            
            int seconds = time % 90;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮显示读秒效果
                [self setTitle:[NSString stringWithFormat:@"%.2ds后重新发送", seconds] forState:UIControlStateNormal];
                self.titleLabel.font = [UIFont systemFontOfSize:13];
                [self setTitleColor:kColorToStr(@"#4593d5") forState:UIControlStateNormal];
                self.backgroundColor=[UIColor whiteColor];
                self.userInteractionEnabled = NO;
                self.enabled = NO;
            });
            time--;
        }
    });
    
    dispatch_resume(_timer);
}

@end
