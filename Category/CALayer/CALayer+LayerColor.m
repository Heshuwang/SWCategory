//
//  CALayer+LayerColor.m
//  cncbk
//
//  Created by hs on 2017/9/22.
//  Copyright © 2017年 hs. All rights reserved.
//

#import "CALayer+LayerColor.h"

@implementation CALayer (LayerColor)

- (void)setBorderColorFromUIColor:(UIColor *)color
 {
        self.borderColor = color.CGColor;
}


//*******************   borderIBColor  *****************
-(void)setBorderIBColor:(UIColor*)color
{
    self.borderColor = color.CGColor;
}

-(UIColor*)borderIBColor
{
    return [UIColor colorWithCGColor:self.borderColor];
}



//**************   shadowIBColor   ****************
-(void)setShadowIBColor:(UIColor*)color
{
    self.shadowColor = color.CGColor;
}

-(UIColor*)shadowIBColor
{
    return [UIColor colorWithCGColor:self.shadowColor];
}


//*************** selectedColor  ***********
-(void)setSelectedColor:(UIColor*)color
{
    self.backgroundColor = color.CGColor;
}

-(UIColor*)selectedColor
{
    return [UIColor colorWithCGColor:self.backgroundColor];
}

@end
