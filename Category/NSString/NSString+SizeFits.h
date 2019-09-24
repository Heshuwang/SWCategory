//
//  NSString+SizeFits.h
//  WuYouTianXia
//
//  Created by hs on 2017/11/1.
//

#import <Foundation/Foundation.h>

@interface NSString (SizeFits)

/**
 文字自适应

 @param font 文字大小
 @param maxW 最大宽度
 @param maxH 最大高度
 @return  算出的大小
 */
-(CGSize )sizeWithTextFont:(UIFont *)font maxW:(CGFloat)maxW maxH:(CGFloat)maxH;

@end
