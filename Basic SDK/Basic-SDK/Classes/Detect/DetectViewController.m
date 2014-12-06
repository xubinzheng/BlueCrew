//
//  DetectViewController.m
//  Basic SDK
//
//  Created by Beat Zenerino on 6/22/14.
//  Copyright (c) 2014 BKON Connect LLC. All rights reserved.
//

#import "DetectViewController.h"

@interface DetectViewController ()
@property BKONLocationManager *bkonManager;
@property BKONRegion *region;
@property NSMutableDictionary *beacons;
@end

@implementation DetectViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	_beacons = [[NSMutableDictionary alloc] init];

	_bkonManager = [[BKONLocationManager alloc] init];
	_bkonManager.delegate = self;
	NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"C48C6716-193F-477B-B73A-C550CE582A22"];
	_region = [[BKONRegion alloc] initWithProximityUUID:uuid identifier:@"com.bkon.detect"];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
	[_bkonManager startRangingBeaconsInRegion:_region];
}

- (IBAction)closeView:(id)sender {
	[_bkonManager stopRangingBeaconsInRegion:_region];
	[self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _beacons.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	switch (section) {
		case 0:
			return [_beacons[@(CLProximityImmediate)] count];
		case 1:
			return [_beacons[@(CLProximityNear)] count];
		case 2:
			return [_beacons[@(CLProximityFar)] count];
		case 3:
			return [_beacons[@(CLProximityUnknown)] count];
		default:
			return 0;
	}
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	switch (section) {
        case 0:
            return @"Immediate Beacons";
        case 1:
            return @"Near Beacons";
        case 2:
            return @"Far Beacons";
        case 3:
            return @"Unknown Beacons";
		default:
			return @"";
			break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	CLBeacon *beacon;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetectCell" forIndexPath:indexPath];
	
	switch (indexPath.section) {
		case 0: {
			beacon = _beacons[@(CLProximityImmediate)][indexPath.row];
			break;
		}
		case 1: {
			beacon = _beacons[@(CLProximityNear)][indexPath.row];
			break;
		}
		case 2: {
			beacon = _beacons[@(CLProximityFar)][indexPath.row];
			break;
		}
		case 3: {
			beacon = _beacons[@(CLProximityUnknown)][indexPath.row];
			break;
		}
		default:
			break;
	}
	// Display the major, minor and accuracy
    NSString *formatString = NSLocalizedString(@"Major: %@, Minor: %@, Acc: %.2fm", @"Format string for ranging table cells.");
    cell.textLabel.text = [NSString stringWithFormat:formatString, beacon.major, beacon.minor, beacon.accuracy];
	
    return cell;
}

#pragma mark - BKONLocationManager delegate

- (void)bkonManager:(BKONLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(BKONRegion *)region {

	[_beacons removeAllObjects];

	for (NSNumber *range in @[@(CLProximityFar), @(CLProximityNear), @(CLProximityImmediate), @(CLProximityUnknown)])
	{
		NSArray *proximityBeacons = [beacons filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"proximity = %d", [range intValue]]];
		if([proximityBeacons count]) {
			_beacons[range] = proximityBeacons;
		}
		else {
			_beacons[range] = @[];
		}
	}

	[self.tableView reloadData];
}

@end
