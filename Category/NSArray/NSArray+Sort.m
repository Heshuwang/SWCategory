//
//  NSArray+Sort.m
//  iKeep Cloud
//
//  Created by hs on 2018/8/23.
//  Copyright © 2018年 hs. All rights reserved.
//

#import "NSArray+Sort.h"

@implementation NSArray (Sort)


/**
 NSEnumerator 方式排序
 
 @return <#return value description#>
 */
- (NSArray *)enumeratorSortType:(SortType)type{
    //  NSEnumerator 迭代器(字典也可以使用)
    
    if (!self) return nil;

    NSEnumerator *enumerator;
    if (type == SortTypeSequence) {
        enumerator = self.objectEnumerator;
    }else{
       enumerator = self.reverseObjectEnumerator;
    }
    
   
    return [enumerator allObjects];
}
@end
