//
//  TWAlertView.h
//  TWAlertView
//
//  Created by Tulakshana Weerasooriya on 6/24/16.
//  Copyright © 2016 tulakshana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TWAlertView : NSObject

+ (void)showAlert:(NSString *)title message:(NSString *)message;
+ (void)showAlert:(NSString *)title message:(NSString *)message buttonsArray:(NSArray<NSString *> *)buttonsArray callback:(void(^)(NSError *error,int buttonIndex))callback;
@end
