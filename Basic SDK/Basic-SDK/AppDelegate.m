//
//  AppDelegate.m
//  Basic SDK
//
//  Created by Beat Zenerino on 5/11/14.
//  Copyright (c) 2014 BKON Connect LLC. All rights reserved.
//

#import "AppDelegate.h"
#import <IBMData/IBMData.h>
#import <IBMBluemix/IBMBluemix.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    NSString *applicationId = nil;
    NSString *applicationSecret = nil;
    NSString *applicationRoute = nil;
    
    BOOL hasValidConfiguration = YES;
    NSString *errorMessage = @"";
    
    // Read the applicationId from the bluelist.plist.
    NSString *configurationPath = [[NSBundle mainBundle] pathForResource:@"bluelist" ofType:@"plist"];
    if(configurationPath){
        NSDictionary *configuration = [[NSDictionary alloc] initWithContentsOfFile:configurationPath];
        applicationId = [configuration objectForKey:@"applicationId"];
        if(!applicationId || [applicationId isEqualToString:@""]){
            hasValidConfiguration = NO;
            errorMessage = @"Open the bluelist.plist and set the applicationId to the BlueMix applicationId";
        }
        applicationSecret = [configuration objectForKey:@"applicationSecret"];
        if(!applicationSecret || [applicationSecret isEqualToString:@""]){
            hasValidConfiguration = NO;
            errorMessage = @"Open the bluelist.plist and set the applicationSecret with your BlueMix application's secret";
        }
        applicationRoute = [configuration objectForKey:@"applicationRoute"];
        if(!applicationRoute || [applicationRoute isEqualToString:@""]){
            hasValidConfiguration = NO;
            errorMessage = @"Open the bluelist.plist and set the applicationRoute to the BlueMix application's route";
        }
    }
    
    if(hasValidConfiguration){
        // Initialize the SDK and BlueMix services
        [IBMBluemix initializeWithApplicationId:applicationId andApplicationSecret:applicationSecret andApplicationRoute:applicationRoute];
        [IBMData initializeService];
    }else{
        [NSException raise:@"InvalidApplicationConfiguration" format: @"%@", errorMessage];
    }
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

@end
