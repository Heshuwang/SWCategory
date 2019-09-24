//
//  UITabBar+RedPoint.m
//  xinga
//
//  Created by 邵晓璐 on 2018/6/21.
//  Copyright © 2018年 huayu. All rights reserved.
//

#import "UITabBar+RedPoint.h"
#define TabCount 4   // tabbar的数量 如果是5个设置为5

@implementation UITabBar (RedPoint)

// 显示小红点
- (void)showBadgeOnTabIndex:(NSInteger)index{
    // 移除之前的小红点
    [self removeBadgeOnItemIndex:index];
    
    // 新建小红点
    UIView *badgeView = [[UIView alloc]init];
    badgeView.tag = 888 + index;
    badgeView.layer.cornerRadius = 5.0;// 圆形
    badgeView.backgroundColor = [UIColor redColor];// 颜色：红色
    CGRect tabFrame = self.frame;
    
    // 确定小红点的位置
    CGFloat percentX = (index + 0.6) / TabCount; // 0.6控制小红点位置，值越大小红点越靠右
    CGFloat x = ceilf(percentX * tabFrame.size.width);
    CGFloat y = ceilf(0.1 * tabFrame.size.height);
    badgeView.frame = CGRectMake(x, y, 10.0, 10.0);// 圆形大小为10
    badgeView.clipsToBounds = YES;
    [self addSubview:badgeView];
}

// 隐藏小红点
- (void)hideBadgeOnTabIndex:(NSInteger)index{
    // 移除小红点
    [self removeBadgeOnItemIndex:index];
}

// 移除小红点
- (void)removeBadgeOnItemIndex:(NSInteger)index{
    // 按照tag值进行移除
    for (UIView *subView in self.subviews) {
        if (subView.tag == 888 + index) {
            [subView removeFromSuperview];
        }
    }
}
@end
