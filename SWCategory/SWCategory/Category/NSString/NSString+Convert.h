//
//  NSString+Convert.h
//  iKeep Cloud
//
//  Created by hs on 2018/8/16.
//  Copyright © 2018年 hs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Convert)

/**
 json字符串转字典
 @return <#return value description#>
 */
-(NSDictionary *)dictionaryByJsonString;



/**
 手机号隐藏中间四位
 @return <#return value description#>
 */
-(NSString *)phoneNumberConfidentiality;
@end
