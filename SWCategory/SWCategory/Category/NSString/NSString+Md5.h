//
//  NSString+Md5.h
//  cncbk
//
//  Created by on 2017/6/6.
//  Copyright © 2017年 . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Md5)


/**
 *  32位MD5加密-->>加密后大写
 *
 *  @return 加密后的字符串
 */
-(NSString*)strWithChangMaxMd5;

/**
 *  32位MD5加密-->>加密后小写
 *
 *  @return 加密后的字符串
 */
-(NSString*)strWithChangMd5;
@end
