//
//  UIImage+QRcode.h
//  Demo
//
//  Created by hs on 2017/10/17.
//  Copyright © 2017年 hs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (QRcode)
//生成图片二维码
+ (UIImage *)qrImageForString:(NSString *)string imageSize:(CGFloat)Imagesize logoImageSize:(CGFloat)waterImagesize;
//生成图片（添加logo）
- (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size waterImageSize:(CGFloat)waterImagesize;
//更改image图片颜色
- (UIImage*)imageBlackToTransparent:(UIImage*)image withRed:(CGFloat)red andGreen:(CGFloat)green andBlue:(CGFloat)blue;


@end




/**
   image 转 base64
 */
@interface UIImage (Bast64)

-(NSString*)getimageWithbase64:(UIImage *)image;

@end



/**
 根据颜色转图片
 */
@interface UIImage (Color)

+(UIImage *)imageWithColor:(UIColor *)color withSize:(CGSize)size;
@end
