//
//  WQZNewfeatureViewController.m
//
//
//  Created by  on 15/11/17.
//  Copyright (c) 2015年 . All rights reserved.
//

#import "UIWindow+Extension.h"
#import "CBaseTabBarController.h"
#import "CHomeViewController.h"
//#import "SLogInViewController.h"
#import "CBaseNavigationController.h"
//#import "LaunchIntroductionView.h"
@implementation UIWindow (Extension)
- (void)switchRootViewController
{
    NSString *key = @"CFBundleVersion";
    // 上一次的使用版本（存储在沙盒中的版本号）
     id temp = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    NSString *lastVersion = @"";
    if (temp != nil) {
        lastVersion =temp;
    }
    // 当前软件的版本号（从Info.plist中获得）
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    if ([currentVersion isEqualToString:lastVersion]) {
        // 版本号相同：这次打开和上次打开的是同一个版本
//         self.rootViewController = [[CBaseTabBarController alloc] init];
        CHomeViewController * home =[[CHomeViewController alloc]init];
        CBaseNavigationController * nav =[[CBaseNavigationController alloc]initWithRootViewController:home];
        self.rootViewController = nav;
    } else {
//        self.rootViewController = [[CBaseTabBarController alloc] init];
        CHomeViewController * home =[[CHomeViewController alloc]init];
        CBaseNavigationController * nav =[[CBaseNavigationController alloc]initWithRootViewController:home];
        self.rootViewController = nav;
//        // 这次打开的版本和上一次不一样，显示引导页
//        SHomeViewController * featureVC = [[SHomeViewController alloc] init];
//        MainNavigationController *nav = [[MainNavigationController alloc] initWithRootViewController:featureVC];
//        self.rootViewController = nav;
        // 将当前的版本号存进沙盒
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}



@end
