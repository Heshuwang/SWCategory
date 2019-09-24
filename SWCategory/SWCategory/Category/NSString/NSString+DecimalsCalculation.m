//
//  NSString+DecimalsCalculation.m
//
//
//  Created by  on 2017/12/5.
//

#import "NSString+DecimalsCalculation.h"

// CalculationType
typedef NS_ENUM(NSInteger,CalculationType){
    CalculationAdding,
    CalculationSubtracting,
    CalculationMultiplying,
    CalculationDividing,
};

@implementation NSString (DecimalsCalculation)

// Adding
- (NSString *)xp_stringByAdding:(NSString *)stringNumber {
    return [self xp_stringByAdding:stringNumber withRoundingMode:NSRoundPlain scale:2];
}
- (NSString *)xp_stringByAdding:(NSString *)stringNumber withRoundingMode:(NSRoundingMode)roundingModel {
    return [self xp_stringByAdding:stringNumber withRoundingMode:roundingModel scale:2];
}
- (NSString *)xp_stringByAdding:(NSString *)stringNumber withRoundingMode:(NSRoundingMode)roundingModel scale:(NSInteger)scale {
    return [self _stringByCalculationType:CalculationAdding by:stringNumber roundingMode:roundingModel scale:scale];
}

// Substracting
- (NSString *)xp_stringBySubtracting:(NSString *)stringNumber {
    return [self  xp_stringBySubtracting:stringNumber withRoundingMode:NSRoundPlain scale:2];
}
- (NSString *)xp_stringBySubtracting:(NSString *)stringNumber withRoundingMode:(NSRoundingMode)roundingModel {
    return [self  xp_stringBySubtracting:stringNumber withRoundingMode:roundingModel scale:2];
}
- (NSString *)xp_stringBySubtracting:(NSString *)stringNumber withRoundingMode:(NSRoundingMode)roundingModel scale:(NSInteger)scale {
    return [self _stringByCalculationType:CalculationSubtracting by:stringNumber roundingMode:roundingModel scale:scale];
}

// Multiplying
- (NSString *)xp_stringByMultiplyingBy:(NSString *)stringNumber {
    return [self xp_stringByMultiplyingBy:stringNumber withRoundingMode:NSRoundPlain scale:2];
}
- (NSString *)xp_stringByMultiplyingBy:(NSString *)stringNumber withRoundingMode:(NSRoundingMode)roundingModel {
    return [self xp_stringByMultiplyingBy:stringNumber withRoundingMode:roundingModel scale:2];
}
- (NSString *)xp_stringByMultiplyingBy:(NSString *)stringNumber withRoundingMode:(NSRoundingMode)roundingModel scale:(NSInteger)scale {
    return [self _stringByCalculationType:CalculationMultiplying by:stringNumber roundingMode:roundingModel scale:scale];
}

// Dividing
- (NSString *)xp_stringByDividingBy:(NSString *)stringNumber {
    return [self xp_stringByDividingBy:stringNumber withRoundingMode:NSRoundPlain scale:2];
}
- (NSString *)xp_stringByDividingBy:(NSString *)stringNumber withRoundingMode:(NSRoundingMode)roundingModel {
    return [self xp_stringByDividingBy:stringNumber withRoundingMode:roundingModel scale:2];
}
- (NSString *)xp_stringByDividingBy:(NSString *)stringNumber withRoundingMode:(NSRoundingMode)roundingModel scale:(NSInteger)scale {
    return [self _stringByCalculationType:CalculationDividing by:stringNumber roundingMode:roundingModel scale:scale];
}


- (NSString *)_stringByCalculationType:(CalculationType)type by:(NSString *)stringNumber roundingMode:(NSRoundingMode)roundingModel scale:(NSUInteger)scale{
    
    NSDecimalNumber *selfNumber = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *calcuationNumber = [NSDecimalNumber decimalNumberWithString:stringNumber];
    NSDecimalNumberHandler *handler = [[NSDecimalNumberHandler alloc] initWithRoundingMode:roundingModel scale:scale raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    
    NSDecimalNumber *result = nil;
    switch (type) {
        case CalculationAdding:
            result = [selfNumber decimalNumberByAdding:calcuationNumber withBehavior:handler];
            break;
        case CalculationSubtracting:
            result =  [selfNumber decimalNumberBySubtracting:calcuationNumber withBehavior:handler];
            break;
        case CalculationMultiplying:
            result = [selfNumber decimalNumberByMultiplyingBy:calcuationNumber withBehavior:handler];
            break;
        case CalculationDividing:
            result =[selfNumber decimalNumberByDividingBy:calcuationNumber withBehavior:handler];
            break;
    }
    
    // 如果自定义了结果格式化工具使用自定义formatter
    
    NSNumberFormatter *numberFormatter = [self _numberFormatterWithScale:scale];
    return [numberFormatter stringFromNumber:result];
}

- (NSNumberFormatter *)_numberFormatterWithScale:(NSInteger)scale{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.alwaysShowsDecimalSeparator = YES;
    numberFormatter.minimumIntegerDigits = 1;
    numberFormatter.numberStyle = NSNumberFormatterNoStyle;
    numberFormatter.minimumFractionDigits = scale;
    return numberFormatter;
}



//比较
- (BOOL)xp_stringCompareBy:(NSString *)stringNumber{
    NSDecimalNumber * number1 = [NSDecimalNumber decimalNumberWithString:self];
     NSDecimalNumber * number2 = [NSDecimalNumber decimalNumberWithString:stringNumber];
    
    //self.number1  <  self.number2
    if ([number1 compare:number2] == NSOrderedAscending) {
         return NO;
        NSLog(@"number1  <  number2");
    }else if([number1 compare:number2] ==NSOrderedDescending){//self.number1  >  self.number2
        NSLog(@"number1  >  number2");
         return YES;
    }else if ([number1 compare:number2] == NSOrderedSame){
        //self.number1  =  self.number2
        NSLog(@"number1  =  number2");
          return YES;
        
    }
     return NO;
}

@end
