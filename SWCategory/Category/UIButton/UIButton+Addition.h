//
//
//  TPO
//
//  Created by  on 14-5-20.
//  Copyright (c) 2014年 . All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonClickCallback)(UIButton* button);

@interface UIButton (Addition)

- (void)handleClickCallBack:(ButtonClickCallback)callBack;

- (void)handleClickEvent:(UIControlEvents)aEvent
               callBack:(ButtonClickCallback)callBack;


#pragma mark   --------  展示按钮图片   ------------
- (void)w_setImageWithURL:(NSString *)imageUrl;
- (void)w_setImageWithURL:(NSString *)imageUrl placeholderImage:(NSString *)placeImageStr;

- (void)w_setBackgroundImageWithURL:(NSString *)imageUrl;
- (void)w_setBackgroundImageWithURL:(NSString *)imageUrl placeholderImage:(NSString *)placeImageStr;

@end
