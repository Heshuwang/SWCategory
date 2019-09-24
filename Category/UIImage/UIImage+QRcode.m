//
//  UIImage+QRcode.m
//  Demo
//
//  Created by hs on 2017/10/17.
//  Copyright © 2017年 hs. All rights reserved.
//

#import "UIImage+QRcode.h"

@implementation UIImage (QRcode)
+ (UIImage *)qrImageForString:(NSString *)string imageSize:(CGFloat)Imagesize logoImageSize:(CGFloat)waterImagesize{
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKey:@"inputMessage"];//通过kvo方式给一个字符串，生成二维码
    [filter setValue:@"H" forKey:@"inputCorrectionLevel"];//设置二维码的纠错水平，越高纠错水平越高，可以污损的范围越大
    CIImage *outPutImage = [filter outputImage];//拿到二维码图片
        
    return [[self alloc] createNonInterpolatedUIImageFormCIImage:outPutImage withSize:Imagesize waterImageSize:waterImagesize];
}

//添加logo
- (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size waterImageSize:(CGFloat)waterImagesize{
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    //创建一个DeviceGray颜色空间
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    //CGBitmapContextCreate(void * _Nullable data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef  _Nullable space, uint32_t bitmapInfo)
    //width：图片宽度像素
    //height：图片高度像素
    //bitsPerComponent：每个颜色的比特值，例如在rgba-32模式下为8
    //bitmapInfo：指定的位图应该包含一个alpha通道。
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    //创建CoreGraphics image
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef); CGImageRelease(bitmapImage);
    
    //原图
    UIImage *outputImage = [UIImage imageWithCGImage:scaledImage];
    
    
    if (waterImagesize <= 0) {
        return outputImage;
    }
    //给二维码加 logo 图
    UIGraphicsBeginImageContextWithOptions(outputImage.size, NO, [[UIScreen mainScreen] scale]);
    [outputImage drawInRect:CGRectMake(0,0 , size, size)];
    //logo图
    UIImage *waterimage = [UIImage imageNamed:@"wuyou_logo"];
    //把logo图画到生成的二维码图片上，注意尺寸不要太大（最大不超过二维码图片的%30），太大会造成扫不出来
    [waterimage drawInRect:CGRectMake((size-waterImagesize)/2.0, (size-waterImagesize)/2.0, waterImagesize, waterImagesize)];
    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newPic;
}


//设置image图片的颜色
- (UIImage*)imageBlackToTransparent:(UIImage*)image withRed:(CGFloat)red andGreen:(CGFloat)green andBlue:(CGFloat)blue{
    const int imageWidth = image.size.width;
    const int imageHeight = image.size.height;
    size_t bytesPerRow = imageWidth * 4;
    uint32_t* rgbImageBuf = (uint32_t*)malloc(bytesPerRow * imageHeight);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(rgbImageBuf, imageWidth, imageHeight, 8, bytesPerRow, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipLast);
    CGContextDrawImage(context, CGRectMake(0, 0, imageWidth, imageHeight), image.CGImage); // 遍历像素
    int pixelNum = imageWidth * imageHeight;
    uint32_t* pCurPtr = rgbImageBuf;
    for (int i = 0; i < pixelNum; i++, pCurPtr++){
        if ((*pCurPtr & 0xFFFFFF00) < 0x99999900) // 将白色变成透明
        {
            // 改成下面的代码，会将图片转成想要的颜色
            uint8_t* ptr = (uint8_t*)pCurPtr;
            ptr[3] = red; //0~255
            ptr[2] = green;
            ptr[1] = blue;
        } else {
            uint8_t* ptr = (uint8_t*)pCurPtr;
            ptr[0] = 0;
        }
    }
    // 输出图片
    CGDataProviderRef dataProvider = CGDataProviderCreateWithData(NULL, rgbImageBuf, bytesPerRow * imageHeight, nil);
    CGImageRef imageRef = CGImageCreate(imageWidth, imageHeight, 8, 32, bytesPerRow, colorSpace, kCGImageAlphaLast | kCGBitmapByteOrder32Little, dataProvider, NULL, true, kCGRenderingIntentDefault);
    CGDataProviderRelease(dataProvider);
    UIImage* resultUIImage = [UIImage imageWithCGImage:imageRef]; // 清理空间
    CGImageRelease(imageRef);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    return resultUIImage;
}


@end

@implementation UIImage (Bast64)
-(NSString*)getimageWithbase64:(UIImage *)image{
    
    NSData *imageData = UIImageJPEGRepresentation(image, 0.2);
    NSString *base64 = [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return base64;
    
}


@end



/**
 颜色值转图片
 */
@implementation UIImage (Color)
+(UIImage *)imageWithColor:(UIColor *)color withSize:(CGSize)size{
    UIGraphicsBeginImageContextWithOptions(size, NO, .0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [color set];
    CGContextFillRect(context, CGRectMake(.0, .0, size.width, size.height));
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}



@end


