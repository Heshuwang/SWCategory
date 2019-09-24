//
//  NSString+Null.m
//  xinga
//
//  Created by justin on 2018/6/7.
//  Copyright © 2018年 huayu. All rights reserved.
//

#import "NSString+Null.h"

@implementation NSString (Null)
-(BOOL)isNull:(id)object

{
        // 判断是否为空串

    if ([object isEqual:[NSNull null]]) {
        
        return NO;
        
    }
    
    else if ([object isKindOfClass:[NSNull class]])
        
        {
        
        return NO;
        
        }
    
    else if (object==nil){
        
        return NO;
        
    }
    
    return YES;
    
}

@end
