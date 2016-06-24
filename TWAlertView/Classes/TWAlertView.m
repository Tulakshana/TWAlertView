//
//  TWAlertView.m
//  TWAlertView
//
//  Created by Tulakshana Weerasooriya on 6/24/16.
//  Copyright © 2016 tulakshanaw. All rights reserved.
//

#import "TWAlertView.h"

@interface UIViewController (RMSViewController)

- (UIViewController *)topVisibleViewController;

@end

@implementation UIViewController (RMSViewController)

- (UIViewController *)topVisibleViewController
{
    if ([self isKindOfClass:[UITabBarController class]])
    {
        UITabBarController *tabBarController = (UITabBarController *)self;
        return [tabBarController.selectedViewController topVisibleViewController];
    }
    else if ([self isKindOfClass:[UINavigationController class]])
    {
        UINavigationController *navigationController = (UINavigationController *)self;
        return [navigationController.visibleViewController topVisibleViewController];
    }
    else if (self.presentedViewController)
    {
        return [self.presentedViewController topVisibleViewController];
    }
    else if (self.childViewControllers.count > 0)
    {
        return [self.childViewControllers.lastObject topVisibleViewController];
    }
    
    return self;
}

@end


@implementation TWAlertView

+ (void)topViewControllerWithCallback:(void(^)(UIViewController *vc))callback;
{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIViewController *rootVC = [[[[UIApplication sharedApplication]delegate] window] rootViewController];
        callback([rootVC topVisibleViewController]);
    });
}

+ (void)showAlert:(NSString *)title message:(NSString *)message callback:(void(^)(NSError *error))callback{
    
    [self topViewControllerWithCallback:^(UIViewController *vc) {
        if (vc == nil) {
            callback([self alertError:[NSString stringWithFormat:@"RMSAlertView cannot show message '%@'. No UIViewController available to present",message]]);
        }else if ([vc isKindOfClass:[UIAlertController class]]) {
            callback([self alertError:[NSString stringWithFormat:@"RMSAlertView cannot show message '%@'. Another UIAlertController is already presented",message]]);
        }else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:action];
            [vc presentViewController:alert animated:TRUE completion:^{
                callback(nil);
            }];
        }
    }];
}

+ (NSError *)alertError:(NSString *)message{
    NSDictionary *userInfo = @{
                               NSLocalizedDescriptionKey: message,
                               NSLocalizedFailureReasonErrorKey: message,
                               NSLocalizedRecoverySuggestionErrorKey: message
                               };
    NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
    return [[NSError alloc] initWithDomain:bundleIdentifier code:1 userInfo:userInfo];
}

@end
