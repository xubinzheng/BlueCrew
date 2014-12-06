//
//  SelectViewController.m
//  Basic SDK
//
//  Created by Beat Zenerino on 6/23/14.
//  Copyright (c) 2014 BKON Connect LLC. All rights reserved.
//

#import "SelectViewController.h"
#import "NotifyViewController.h"
#import "RangeViewController.h"

@interface SelectViewController ()
@property BKONLocationManager *bkonManager;
@property BKONRegion *region;
@property NSArray *beacons;
@end

@implementation SelectViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	_bkonManager = [[BKONLocationManager alloc] init];
	_bkonManager.delegate = self;
	NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"C48C6716-193F-477B-B73A-C550CE582A22"];
	_region = [[BKONRegion alloc] initWithProximityUUID:uuid identifier:@"com.bkon.select"];
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
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _beacons.count;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.row % 2 == 0)
		cell.backgroundColor = [UIColor colorWithRed:0.13 green:0.13 blue:0.13 alpha:1];
	else
		cell.backgroundColor = [UIColor colorWithRed:0.09 green:0.09 blue:0.09 alpha:1];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SelectCell" forIndexPath:indexPath];

	BKONBeacon *beacon = _beacons[indexPath.row];

	UILabel *majorLabel = (UILabel *)[cell viewWithTag:301];
	majorLabel.text = [beacon.major stringValue];
	UILabel *minorLabel = (UILabel *)[cell viewWithTag:302];
	minorLabel.text = [beacon.minor stringValue];
	UILabel *rssiLabel = (UILabel *)[cell viewWithTag:303];
	rssiLabel.text = [NSString stringWithFormat:@"%ld", (long)beacon.rssi];

    return cell;
}

#pragma mark - BKONLocationManager delegate

- (void)bkonManager:(BKONLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(BKONRegion *)region {
	_beacons = beacons;
	[self.tableView reloadData];
}

#pragma mark - Navigation

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	BKONBeacon *beacon = _beacons[indexPath.row];

	if ([self.demoFunction isEqualToString:@"Notify"]) {
		NotifyViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"NotifyViewController"];
		vc.beacon = beacon;
		[self.navigationController pushViewController:vc animated:YES];
	}
	else {
		RangeViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"RangeViewController"];
		vc.beacon = beacon;
		[self.navigationController pushViewController:vc animated:YES];
	}
}

@end
