//
//  RecognizeViewController.m
//  Basic SDK
//
//  Created by Beat Zenerino on 5/15/14.
//  Copyright (c) 2014 BKON Connect LLC. All rights reserved.
//

#import "NotifyViewController.h"

//#define NOTIFY_LOG

#ifdef NOTIFY_LOG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#endif

@interface NotifyViewController ()
@property BKONLocationManager *bkonManager;
@property BKONRegion *region;
@end

@implementation NotifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

	_bkonManager = [[BKONLocationManager alloc] init];
	_bkonManager.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
	// set up region
	_region = [[BKONRegion alloc] initWithProximityUUID:self.beacon.proximityUUID
												  major:[self.beacon.major unsignedShortValue]
												  minor:[self.beacon.minor unsignedShortValue]
											 identifier:@"com.bkon.notify"];
	_region.notifyEntryStateOnDisplay = YES;
	_region.notifyOnEntry = YES;
	_region.notifyOnExit = YES;
	
	[_bkonManager startMonitoringForRegion:_region];
	[_bkonManager requestStateForRegion:_region];
}

- (IBAction)closeView:(id)sender {
	[_bkonManager stopMonitoringForRegion:_region];
	[self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)changeNotify:(id)sender; {
	[_bkonManager stopMonitoringForRegion:_region];

	_region.notifyEntryStateOnDisplay = self.notifyOnDisplay.isOn;
	_region.notifyOnEntry = self.notifyOnEntry.isOn;
	_region.notifyOnExit = self.notifyOnExit.isOn;

	[_bkonManager startMonitoringForRegion:_region];
}


#pragma mark - CLLocationManager Delegate

- (void)bkonManager:(BKONLocationManager *)manager didStartMonitoringForRegion:(BKONRegion *)region {
	DLog(@"didStartMonintoringForRegion");
    [self.bkonManager requestStateForRegion:_region];
}

- (void)bkonManager:(BKONLocationManager *)manager didDetermineState:(CLRegionState)state forRegion:(CLRegion *)region {
	if (state == CLRegionStateUnknown) {
		DLog(@"didDetermineState: CLRegionStateUnknown");
	}
	else if (state == CLRegionStateInside) {
		DLog(@"didDetermineState: CLRegionStateInside");
	}
	else if	(state == CLRegionStateOutside) {
		DLog(@"didDetermineState: CLRegionStateOutside");
	}
}

- (void)bkonManager:(BKONLocationManager *)manager didEnterRegion:(CLRegion *)region {
	DLog(@"didEnterRegion");
    UILocalNotification *notification = [UILocalNotification new];
    notification.alertBody = @"Entered BKON region.";

    [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
}

- (void)bkonManager:(BKONLocationManager *)manager didExitRegion:(CLRegion *)region {
	DLog(@"didEnterRegion");
    UILocalNotification *notification = [UILocalNotification new];
    notification.alertBody = @"Exited BKON region.";

    [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
}

- (void)bkonManager:(BKONLocationManager *)manager rangingBeaconsDidFailForRegion:(BKONRegion *)region withError:(NSError *)error {
	DLog(@"%@",[error localizedDescription]);
}

@end
