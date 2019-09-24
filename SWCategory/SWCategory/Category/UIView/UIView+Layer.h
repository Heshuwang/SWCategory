//
//  UIView+Layer.h
//  Demo
//
//  Created by hs on 2017/9/7.
//  Copyright © 2017年 . All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,WLayoutCornerRadiusType) {
    WLayoutCornerRadiusTop = 0,
    WLayoutCornerRadiusLeft = 1,
    WLayoutCornerRadiusBottom = 2,
    WLayoutCornerRadiusRight = 3,
    WLayoutCornerRadiusAll = 4,
    WLayoutCornerdeleteTopleft = 5,
};



@interface UIView (Layer)


/*
 *@pragma radius 圆角大小
 *
 */
-(void)layercircular:(CGFloat)radius;

/*
 *@pragma borderwidth。边框宽度
 *@pragma color。 边框颜色
 *@pragma radius 圆角大小
 */
-(void)layerborder:(CGFloat)borderwidth atcolor:(UIColor *)color circular:(CGFloat)radius;




/**
 圆角设置
 @param sideType <#sideType description#>
 @param cornerRadius <#cornerRadius description#>
 */
-(void)layoutCornerRadiusType:(UIRectCorner)sideType withCornerRadius:(CGFloat)cornerRadius;
@end
