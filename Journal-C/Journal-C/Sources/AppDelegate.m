//
//  AppDelegate.m
//  Journal-C
//
//  Created by Jordan Lamb on 10/7/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

#import "AppDelegate.h"
#import "JLEntryController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [[JLEntryController sharedController] saveToPersistentStorage];
}

@end
