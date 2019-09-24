//
//  NSData+Gzip.h
//  iKeep Cloud
//
//  Created by hs on 2018/8/7.
//  Copyright © 2018年 hs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Gzip)

/**
 压缩
 @return <#return value description#>
 */
- (NSData *)gzipPack;

/**
 解压
 @return <#return value description#>
 */
- (NSData *)gzipUnpack;

/**
 检测数据压缩
 @return <#return value description#>
 */
-(BOOL)isExamineDataGzip;
@end
