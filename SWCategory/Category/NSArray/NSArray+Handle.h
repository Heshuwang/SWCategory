//
//  NSArray+Handle.h
//  Image
//
//  Created by hs on 2018/7/13.
//  Copyright © 2018年 hs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Handle)

/**
 数组去重(KeyValue去重) (无序的)
 @return <#return value description#>
 */
-(NSArray *)arrWithKeyValueDistinct;

/**
 数组去重 （NSSet去重）(因为NSSet是无序的  所以返回的数组是无序的)
 
 @return <#return value description#>
 */
-(NSArray *)arrWithSetDistinct;

/**
 数组去重  （NSOrderedSet去重）（据说是有序的  待实践）
 
 @return <#return value description#>
 */
-(NSArray *)arrWithOrderedSetDistinct;


/**
 不可变转换成可变
 @return <#return value description#>
 */
-(NSMutableArray *)convertforMutable;




@end
