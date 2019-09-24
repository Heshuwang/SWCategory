//
//  NSArray+Handle.m
//  Image
//
//  Created by hs on 2018/7/13.
//  Copyright © 2018年 hs. All rights reserved.
//

#import "NSArray+Handle.h"
#import <objc/runtime.h>
@implementation NSArray (Handle)


#pragma mark ----数组去重------
/**
 数组去重
 @return <#return value description#>
 */
-(NSArray *)arrWithKeyValueDistinct{
    
    return [self valueForKeyPath:@"@distinctUnionOfObjects.self"];
    
}

/**
 数组去重 （NSSet去重）(因为NSSet是无序的  所以返回的数组是无序的)

 @return <#return value description#>
 */
-(NSArray *)arrWithSetDistinct{
    NSSet * set =[NSSet setWithArray:self];
    return [set allObjects];
}




/**
 数组去重  （NSOrderedSet去重）（据说是有序的  待实践）

 @return <#return value description#>
 */
-(NSArray *)arrWithOrderedSetDistinct{
    
   NSOrderedSet *set = [NSOrderedSet orderedSetWithArray:self];
    return set.array;
    
    
}



#pragma mark   ---- 数组转换 ---

/**
不可变转换成可变
 @return <#return value description#>
 */
-(NSMutableArray *)convertforMutable{
    NSMutableArray * Marr = [NSMutableArray arrayWithArray:self];
    return Marr;
    
}




@end
