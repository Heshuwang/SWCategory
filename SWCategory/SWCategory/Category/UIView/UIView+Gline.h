//
//  UIView+Gline.h
//  WuYouTianXia
//
//  Created by hs on 2017/11/3.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, UIBorderSideType) {
    UIBorderSideTypeAll    = 0,
    UIBorderSideTypeTop    = 1 << 1,//2
    UIBorderSideTypeBottom = 1 << 2,//4
    UIBorderSideTypeLeft   = 1 << 3,//8
    UIBorderSideTypeRight  = 1 << 4,//16
};
@interface UIView (Gline)


/**
 @param typeArr  类型数组
 @param linColor 线颜色
 @param borderWidth 宽度
 */
-(void)viewBorderSideTypes:(NSArray *)typeArr colors:(UIColor *)linColor borderWidth:(CGFloat)borderWidth;

/**
 @param borderType 类型
 @param linColor 线颜色
 @param borderWidth 线宽度
 */
-(void)viewBorderSideType:(UIBorderSideType)borderType color:(UIColor *)linColor  borderWidth:(CGFloat)borderWidth;
/**

 @param borderType 类型
 @param linColor 线颜色
 @param borderWidth 线的宽度
 @param linelenght 线长度
 */
-(void)viewBorderSideType:(UIBorderSideType)borderType color:(UIColor *)linColor  borderWidth:(CGFloat)borderWidth length:(CGFloat)linelenght;



/**
 绘制虚线
 @param linelength 虚线长度
 @param spacing 虚线间隔
 @param radius 圆角
 */
-(void)viewlayerWithDottedlinelength:(CGFloat)linelength spacing:(CGFloat)spacing cornerRadius:(CGFloat)radius;
@end
