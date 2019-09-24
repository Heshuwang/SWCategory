//
//  NSString+Convert.m
//  iKeep Cloud
//
//  Created by hs on 2018/8/16.
//  Copyright © 2018年 hs. All rights reserved.
//

#import "NSString+Convert.h"

@implementation NSString (Convert)

-(NSDictionary *)dictionaryByJsonString{
    
    if (!self) return nil;
    
    NSData * data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    
    return jsonDict;
    
}


/**
 手机号隐藏中间四位

 @return <#return value description#>
 */
-(NSString *)phoneNumberConfidentiality{
    BOOL isOk = [self sw_isValidMobile];
    if (isOk) {
        //如果是手机号码的话
        NSString *numberString = [self stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
        return numberString;
        
    }
    return self;
    
}

@end
