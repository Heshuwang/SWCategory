//
//  UIResponder+Router.m
//  iKeep Cloud
//
//  Created by hs on 2018/8/22.
//  Copyright © 2018年 hs. All rights reserved.
//

#import "UIResponder+Router.h"

@implementation UIResponder (Router)

- (void)routerWithEventName:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    if (self.nextResponder) {
        [[self nextResponder] routerWithEventName:eventName userInfo:userInfo];
    }
}

@end
