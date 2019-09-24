//
//  UIView+Gline.m
//  WuYouTianXia
//
//  Created by hs on 2017/11/3.
//

#import "UIView+Gline.h"

@implementation UIView (Gline)

-(void)viewBorderSideTypes:(NSArray *)typeArr colors:(UIColor *)linColor borderWidth:(CGFloat)borderWidth {
    if (typeArr == nil) return;

    for (int a = 0; a < typeArr.count; a++) {
        id temp =typeArr[a];
       
        [self viewBorderSideType:(UIBorderSideType)[temp intValue] color:linColor borderWidth:borderWidth];

    }
    
}
-(void)viewBorderSideType:(UIBorderSideType)borderType color:(UIColor *)linColor  borderWidth:(CGFloat)borderWidth{
    
    [self viewBorderSideType:borderType color:linColor borderWidth:borderWidth length:0];
    
}


-(void)viewBorderSideType:(UIBorderSideType)borderType color:(UIColor *)linColor  borderWidth:(CGFloat)borderWidth  length:(CGFloat)linelenght{
    if (borderType == UIBorderSideTypeAll) {
        self.layer.borderWidth = borderWidth;
        self.layer.borderColor = linColor.CGColor;
        return ;
    }
    /// 线的路径
    UIBezierPath * bezierPath = [UIBezierPath bezierPath];
    CGFloat lineL = linelenght;
    
    if (linelenght == 0) {
        if (borderType == UIBorderSideTypeLeft || borderType == UIBorderSideTypeRight) {
            lineL = self.frame.size.height;
        }else{
            lineL = self.frame.size.width;
            
        }
    }else{
        
        lineL = linelenght;
        
    }
    
    /// 左侧
    if (borderType & UIBorderSideTypeLeft) {
        /// 左侧线路径
        [bezierPath moveToPoint:CGPointMake(0.0f, 0.0f)];
        [bezierPath addLineToPoint:CGPointMake(0.0f, lineL)];
    }
    
    /// 右侧
    if (borderType & UIBorderSideTypeRight) {
        /// 右侧线路径
        [bezierPath moveToPoint:CGPointMake(self.frame.size.width, 0.0f)];
        [bezierPath addLineToPoint:CGPointMake(self.frame.size.width, lineL)];
    }
    
    /// top
    if (borderType & UIBorderSideTypeTop) {
        /// top线路径
        [bezierPath moveToPoint:CGPointMake(0.0f, 0.0f)];
        [bezierPath addLineToPoint:CGPointMake(lineL, 0.0f)];
    }
    
    /// bottom
    if (borderType & UIBorderSideTypeBottom) {
        /// bottom线路径
        [bezierPath moveToPoint:CGPointMake(0.0f, self.frame.size.height)];
        [bezierPath addLineToPoint:CGPointMake(lineL, self.frame.size.height)];
        
    }
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = linColor.CGColor;
    shapeLayer.fillColor  = [UIColor clearColor].CGColor;
    /// 添加路径
    shapeLayer.path = bezierPath.CGPath;
    /// 线宽度
    shapeLayer.lineWidth = borderWidth;
    
    [self.layer addSublayer:shapeLayer];
    
}


/**
 绘制虚线
 @param linelength 虚线长度
 @param spacing 虚线间隔
 @param radius 圆角
 */
-(void)viewlayerWithDottedlinelength:(CGFloat)linelength spacing:(CGFloat)spacing cornerRadius:(CGFloat)radius{
    
    CAShapeLayer *border = [CAShapeLayer layer];
    //虚线的颜色
    border.strokeColor = [UIColor grayColor].CGColor;
    //填充的颜色
    border.fillColor = [UIColor clearColor].CGColor;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:radius];
    
    //设置路径
    border.path = path.CGPath;
    
    border.frame = self.bounds;
    //虚线的宽度
    border.lineWidth = 1.f;
    
    
    //设置线条的样式
    //    border.lineCap = @"square";
    //虚线的间隔
    NSNumber * lineL =[NSNumber numberWithFloat:linelength];
    NSNumber * lineSpecing =[NSNumber numberWithFloat:spacing];
    border.lineDashPattern = @[lineL, lineSpecing];
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
    
    [self.layer addSublayer:border];
    
    
}


@end
