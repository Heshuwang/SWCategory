//
//  NSString+Md5.m
//  cncbk
//
//  Created by on 2017/6/6.
//  Copyright © 2017年 . All rights reserved.
//

#import "NSString+Md5.h"
#import <CommonCrypto/CommonDigest.h>
#define  frontStr @""
#define rearStr  @""
@implementation NSString (Md5)


/**
 *  32位MD5加密-->>加密后小写
 *
 *  @return 加密后的字符串
 */
-(NSString*)strWithChangMd5{
    
   // NSString * str= [NSString stringWithFormat:@"%@%@%@",frontStr,self,rearStr];
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

/**
 *  32位MD5加密-->>加密后大写
 *
 *  @return 加密后的字符串
 */
-(NSString*)strWithChangMaxMd5{
    
    
    
    
    NSString * str= [NSString stringWithFormat:@"%@%@%@",frontStr,self,rearStr];
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5( cStr,(CC_LONG)strlen(cStr), result );
    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
    
}
@end
