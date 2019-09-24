//
//  NSArray+Sort.h
//  iKeep Cloud
//
//  Created by hs on 2018/8/23.
//  Copyright © 2018年 hs. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,SortType)
{
    SortTypeReverse,//倒序
    SortTypeSequence //顺序
};



@interface NSArray (Sort)


/**
 NSEnumerator 方式排序

 @return <#return value description#>
 */
- (NSArray *)enumeratorSortType:(SortType)type;
@end
