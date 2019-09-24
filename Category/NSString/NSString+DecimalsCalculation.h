//
//  NSString+DecimalsCalculation.h
//  
//
//  Created by  on 2017/12/5.
//

#import <Foundation/Foundation.h>

@interface NSString (DecimalsCalculation)

// 加
/**
 加法计算，默认保留两位小数，默认采用四舍五入的方式处理计算结果,
 roundingModel决定四舍五入的方式，scale决定保留小数个数
 @param stringNumber 被加数
 @return 返回结果
 */
- (NSString *)xp_stringByAdding:(NSString *)stringNumber;
- (NSString *)xp_stringByAdding:(NSString *)stringNumber withRoundingMode:(NSRoundingMode)roundingModel;
- (NSString *)xp_stringByAdding:(NSString *)stringNumber withRoundingMode:(NSRoundingMode)roundingModel scale:(NSInteger)scale;

// 减
/**
 减法计算，默认保留两位小数，默认采用四舍五入的方式处理计算结果
 roundingModel决定四舍五入的方式，scale决定保留小数个数
 @param stringNumber 减数
 @return 返回结果
 */
- (NSString *)xp_stringBySubtracting:(NSString *)stringNumber;
- (NSString *)xp_stringBySubtracting:(NSString *)stringNumber withRoundingMode:(NSRoundingMode)roundingModel;
- (NSString *)xp_stringBySubtracting:(NSString *)stringNumber withRoundingMode:(NSRoundingMode)roundingModel scale:(NSInteger)scale;

// 乘
/**
 乘法计算，默认保留两位小数，默认采用四舍五入的方式处理计算结果
 roundingModel决定四舍五入的方式，scale决定保留小数个数
 @param stringNumber 减数
 @return 返回结果
 */
- (NSString *)xp_stringByMultiplyingBy:(NSString *)stringNumber;
- (NSString *)xp_stringByMultiplyingBy:(NSString *)stringNumber withRoundingMode:(NSRoundingMode)roundingModel;
- (NSString *)xp_stringByMultiplyingBy:(NSString *)stringNumber withRoundingMode:(NSRoundingMode)roundingModel scale:(NSInteger)scale;

// 除
/**
 除法计算，默认保留两位小数，默认采用四舍五入的方式处理计算结果
 roundingModel决定四舍五入的方式，scale决定保留小数个数
 @param stringNumber 减数
 @return 返回结果
 */
- (NSString *)xp_stringByDividingBy:(NSString *)stringNumber;
- (NSString *)xp_stringByDividingBy:(NSString *)stringNumber withRoundingMode:(NSRoundingMode)roundingModel;
- (NSString *)xp_stringByDividingBy:(NSString *)stringNumber withRoundingMode:(NSRoundingMode)roundingModel scale:(NSInteger)scale;



//比较
- (BOOL)xp_stringCompareBy:(NSString *)stringNumber;

@end
