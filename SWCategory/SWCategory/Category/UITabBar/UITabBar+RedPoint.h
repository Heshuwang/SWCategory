//
//  UITabBar+RedPoint.h
//  xinga
//
//  Created by 邵晓璐 on 2018/6/21.
//  Copyright © 2018年 huayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (RedPoint)

/** 显示小红点 */
- (void)showBadgeOnTabIndex:(NSInteger)index;
/** 隐藏小红点 */
- (void)hideBadgeOnTabIndex:(NSInteger)index;

@end
