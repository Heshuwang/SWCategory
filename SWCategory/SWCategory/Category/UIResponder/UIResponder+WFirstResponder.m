//
//  UIResponder+WFirstResponder.m
//  HYPlatform
//
//  Created by hs on 2018/7/14.
//  Copyright © 2018年 hs. All rights reserved.
//

#import "UIResponder+WFirstResponder.h"

static __weak id currentFirstResponder;
@implementation UIResponder (WFirstResponder)

+ (id)currentFirstResponder {
    currentFirstResponder = nil;
    [[UIApplication sharedApplication] sendAction:@selector(findFirstResponder:) to:nil from:nil forEvent:nil];
    return currentFirstResponder;
}

- (void)findFirstResponder:(id)sender {
    currentFirstResponder = self;
}



@end
