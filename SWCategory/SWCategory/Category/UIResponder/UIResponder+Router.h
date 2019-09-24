//
//  UIResponder+Router.h
//  iKeep Cloud
//
//  Created by hs on 2018/8/22.
//  Copyright © 2018年 hs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (Router)

/**
 路由
 @param eventName <#eventName description#>
 @param userInfo <#userInfo description#>
 */
- (void)routerWithEventName:(NSString *)eventName userInfo:(NSDictionary *)userInfo;
@end
