//
//
//  TPO
//
//  Created by  on 14-5-20.
//  Copyright (c) 2014年 . All rights reserved.
//

#import "UIButton+Addition.h"
#import <objc/runtime.h>
#import "UIButton+WebCache.h"

static char *overViewKey;

@implementation UIButton (Addition)

- (void)handleClickCallBack:(ButtonClickCallback)callBack {
    [self handleClickEvent:UIControlEventTouchUpInside callBack:callBack];
}

- (void)handleClickEvent:(UIControlEvents)aEvent
               callBack:(ButtonClickCallback)callBack;
{
    objc_setAssociatedObject(self, &overViewKey, callBack, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(buttonClick) forControlEvents:aEvent];
}

- (void)buttonClick {
    ButtonClickCallback callBack = objc_getAssociatedObject(self, &overViewKey);
    if (callBack!= nil)
    {
        callBack(self);
    }
}



#pragma mark --- btn 获取image
- (void)w_setImageWithURL:(NSString *)imageUrl
{

    NSString * imgUrl = [imageUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    if ([imgUrl hasPrefix:@"http"] || [imgUrl hasPrefix:@"https"]) {

          [self sd_setImageWithURL:[NSURL URLWithString:imgUrl] forState:UIControlStateNormal];
    }
    else
    {

       // [self sd_setImageWithURL:[NSURL URLWithString:kImageURL(imageUrl)] forState:UIControlStateNormal];
    }
    
    //另一种方式
    //[self w_setImageWithURL:imageUrl placeholderImage:nil];
}

- (void)w_setImageWithURL:(NSString *)imageUrl placeholderImage:(NSString *)placeImageStr
{
    NSString * imgUrl = [imageUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    if ([imgUrl hasPrefix:@"http"] || [imgUrl hasPrefix:@"https"]) {
        
        [self sd_setImageWithURL:[NSURL URLWithString:imageUrl] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:placeImageStr ==nil ? @"" : placeImageStr]];
    }
    else
    {
          // [self sd_setImageWithURL:[NSURL URLWithString:kImageURL(imageUrl)] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:placeImageStr ==nil ? @"" : placeImageStr]];
    }
}


- (void)w_setBackgroundImageWithURL:(NSString *)imageUrl
{
    NSString * imgUrl = [imageUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    if ([imgUrl hasPrefix:@"http"] || [imgUrl hasPrefix:@"https"]) {

        [self sd_setBackgroundImageWithURL:[NSURL URLWithString:imgUrl] forState:UIControlStateNormal];

    }
    else
    {
        //[self sd_setBackgroundImageWithURL:[NSURL URLWithString:kImageURL(imgUrl)] forState:UIControlStateNormal];
    }
    
    //另一种方式
   // [self w_setBackgroundImageWithURL:imageUrl placeholderImage:nil];
}

- (void)w_setBackgroundImageWithURL:(NSString *)imageUrl placeholderImage:(NSString *)placeImageStr
{
    NSString * imgUrl = [imageUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    if ([imgUrl hasPrefix:@"http"] || [imgUrl hasPrefix:@"https"]) {
        
        [self sd_setBackgroundImageWithURL:[NSURL URLWithString:imageUrl] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:placeImageStr ==nil ? @"" : placeImageStr]];
    }
    else
    {
        [self sd_setBackgroundImageWithURL:[NSURL URLWithString:kImageURL(imgUrl)] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:placeImageStr ==nil ? @"" : placeImageStr]];
    }
    
}

@end
