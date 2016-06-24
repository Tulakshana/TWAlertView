//
//  TAlertView.h
//  TAlertView
//
//  Created by Tulakshana Weerasooriya on 6/24/16.
//  Copyright © 2016 tulakshana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TAlertView : NSObject

+ (void)showAlert:(NSString *)title message:(NSString *)message callback:(void(^)(NSError *error))callback;

@end
