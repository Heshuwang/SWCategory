//
//  NSDictionary+JsonString.m
//  iKeep Cloud
//
//  Created by hs on 2018/8/16.
//  Copyright © 2018年 hs. All rights reserved.
//

#import "NSDictionary+JsonString.h"

@implementation NSDictionary (JsonString)
-(NSString *)jsonStrByDictionary{
    if (!self) return nil;
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (jsonData == nil) {
        return nil;
    }
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];

    
    //return jsonString;
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];

    NSRange range = {0,jsonString.length};

    [mutStr replaceOccurrencesOfString:@" "withString:@""options:NSLiteralSearch range:range];

    NSRange range2 = {0,mutStr.length};

    [mutStr replaceOccurrencesOfString:@"\n"withString:@""options:NSLiteralSearch range:range2];
    
    NSRange range3 = {0,mutStr.length};
    
    [mutStr replaceOccurrencesOfString:@"\\" withString:@"" options:NSLiteralSearch range:range3];
    

    return mutStr;
    
    
 
    
}
@end
