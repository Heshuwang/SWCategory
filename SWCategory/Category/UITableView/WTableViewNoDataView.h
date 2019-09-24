//
//  UITableView+placeholder.h
//  BeautifulAgent
//
//  Created by  on 2017/7/20.
//  Copyright © 2017年 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTableViewNoDataView : UIView


- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)img title:(NSString * )tiitle viewClick:(void(^)(void))clickBlock;

@end
