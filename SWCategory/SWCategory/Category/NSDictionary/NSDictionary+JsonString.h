//
//  NSDictionary+JsonString.h
//  iKeep Cloud
//
//  Created by hs on 2018/8/16.
//  Copyright © 2018年 hs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JsonString)

/**
 字典转json字符串
 @return <#return value description#>
 */
-(NSString *)jsonStrByDictionary;
@end
