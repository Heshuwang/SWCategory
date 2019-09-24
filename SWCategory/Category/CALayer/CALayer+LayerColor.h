//
//  CALayer+LayerColor.h
//  cncbk
//
//  Created by hs on 2017/9/22.
//  Copyright © 2017年 hs. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (LayerColor)

@property(nonatomic, assign) UIColor* borderIBColor;

@property(nonatomic, assign) UIColor* shadowIBColor;

@property(nonatomic, assign) UIColor* selectedColor;

- (void)setBorderColorFromUIColor:(UIColor *)color;
@end
