//
//  TAppDelegate.m
//  TAlertView
//
//  Created by tulakshana on 06/24/2016.
//  Copyright (c) 2016 tulakshana. All rights reserved.
//

#import "TAppDelegate.h"

#import "TWAlertView.h"

@implementation TAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    [TWAlertView showAlert:@"Hello" message:@"What do you like to do today?" buttonsArray:[NSArray arrayWithObjects:@"Socialise",@"Code", nil] callback:^(NSError *error, int buttonIndex) {
        if (error) {
            NSLog(@"%@",error.debugDescription);
        }else{
            switch (buttonIndex) {
                case 0:
                    [self socialise];
                    break;
                case 1:
                    [self code];
                    break;
                default:
                    break;
            }
        }
    }];

    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - 

- (void)socialise{
    [TWAlertView showAlert:@"Warning!" message:@"Are you sure you want to compromise your valuable time?" buttonsArray:[NSArray arrayWithObjects:@"Yes",@"No", nil] callback:^(NSError *error, int buttonIndex) {
        if (error) {
            NSLog(@"%@",error.debugDescription);
        }else{
            switch (buttonIndex) {
                case 0:
                    [TWAlertView showAlert:@"Warning!" message:@"You are now on your own."];
                    break;
                case 1:
                    [self code];
                    break;
                default:
                    break;
            }
        }
    }];
}

- (void)code{
    [TWAlertView showAlert:@"Nice!" message:@"Good choice buddy"];
}


@end
