//
//  NSString+SizeFits.m
//  WuYouTianXia
//
//  Created by hs on 2017/11/1.
//

#import "NSString+SizeFits.h"

@implementation NSString (SizeFits)

-(CGSize)sizeWithTextFont:(UIFont *)font maxW:(CGFloat)maxW maxH:(CGFloat)maxH
{
    NSMutableDictionary *attrs=[NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;

    CGSize maxSize = CGSizeMake(0, 0);
    if (maxH > 0) {
        maxSize =CGSizeMake(maxW, maxH);
    }else{
       maxSize  =CGSizeMake(maxW, MAXFLOAT);
    }
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}


@end
