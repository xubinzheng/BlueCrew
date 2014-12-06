//-------------------------------------------------------------------------------
// Copyright 2014 IBM Corp. All Rights Reserved
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//-------------------------------------------------------------------------------

#import <IBMBluemix/IBMBluemix.h>
#import <IBMData/IBMData.h>
#import "IBM_AppDelegate.h"
#import <BKON-SDK/BKON-SDK.h>

@implementation IBM_AppDelegate

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

@end
