//
//  UIView+Layer.m
//  Demo
//
//  Created by hs on 2017/9/7.
//  Copyright © 2017年 . All rights reserved.
//

#import "UIView+Layer.h"

@implementation UIView (Layer)


#pragma mark   ---------------layer----------------

-(void)layercircular:(CGFloat)radius{
    if (radius<=0) {
        return;
    }
    self.layer.cornerRadius=radius;
    self.layer.masksToBounds=YES;
    
}

-(void)layerborder:(CGFloat)borderwidth atcolor:(UIColor *)color circular:(CGFloat)radius{
    
    if (radius>0) {
        self.layer.cornerRadius=radius;
        self.layer.masksToBounds=YES;
    }
    self.layer.borderColor=color.CGColor;
    self.layer.borderWidth=borderwidth;
}




-(void)imageToBackGroundColor:(NSString *)imageName{
    
    UIImage *image = [UIImage imageNamed:imageName];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5) resizingMode:UIImageResizingModeStretch];
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.f);
    [image drawInRect:self.bounds];
    UIImage *lastImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.backgroundColor = [UIColor colorWithPatternImage:lastImage];


}




/**
圆角设置
 @param sideType <#sideType description#>
 @param cornerRadius <#cornerRadius description#>
 */
-(void)layoutCornerRadiusType:(UIRectCorner)sideType withCornerRadius:(CGFloat)cornerRadius
{
    
    CGSize cornerSize = CGSizeMake(cornerRadius, cornerRadius);
    UIBezierPath *maskPath;
    
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:sideType
                                           cornerRadii:cornerSize];
    
//    switch (sideType) {
//        case WLayoutCornerRadiusTop:
//        {
//            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
//                                             byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight)
//                                                   cornerRadii:cornerSize];
//        }
//            break;
//        case WLayoutCornerRadiusLeft:
//        {
//            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
//                                             byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerBottomLeft)
//                                                   cornerRadii:cornerSize];
//        }
//            break;
//        case WLayoutCornerRadiusBottom:
//        {
//            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
//                                             byRoundingCorners:(UIRectCornerBottomLeft|UIRectCornerBottomRight)
//                                                   cornerRadii:cornerSize];
//        }
//            break;
//        case WLayoutCornerRadiusRight:
//        {
//            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
//                                             byRoundingCorners:(UIRectCornerTopRight|UIRectCornerBottomRight)
//                                                   cornerRadii:cornerSize];
//        }
//            break;
//        case WLayoutCornerdeleteTopleft:
//        {
//            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
//                                             byRoundingCorners:(UIRectCornerTopRight|UIRectCornerBottomRight|UIRectCornerBottomLeft)
//                                                   cornerRadii:cornerSize];
//        }
//            break;
//        default:
//        {
//            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
//                                             byRoundingCorners:UIRectCornerAllCorners
//                                                   cornerRadii:cornerSize];
//        }
//            break;
//    }
//
    // Create the shape layer and set its path
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    
    // Set the newly created shape layer as the mask for the image view's layer
    self.layer.mask = maskLayer;
    
    [self.layer setMasksToBounds:YES];
}

@end
