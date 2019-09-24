//
//  UIViewController+ImagePicker.h
//  superOutlet
//
//  Created by hs on 2019/6/13.
//  Copyright © 2019 zyy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^ImagePickerCompletionHandler)(NSData *imageData, UIImage *image);
@interface UIViewController (ImagePicker)
- (void)pickImageWithCompletionHandler:(ImagePickerCompletionHandler)completionHandler;
- (void)pickImageWithpickImageCutImageWithImageSize:(CGSize)imageSize CompletionHandler:(ImagePickerCompletionHandler)completionHandler;
@end

NS_ASSUME_NONNULL_END
