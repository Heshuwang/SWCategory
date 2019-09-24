//
//  WTableViewLogOutView.h
//  tableView无数据占位图
//
//  Created by hs on 2017/10/27.
//  Copyright © 2017年 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTableViewLogOutView : UIView

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)img  btnTitle:(NSString *)btnTitle viewClick:(void(^)(void))clickBlock;

@end
