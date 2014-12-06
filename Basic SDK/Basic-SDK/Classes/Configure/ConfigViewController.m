//
//  ConfigureTableViewController.m
//  Basic SDK
//
//  Created by Beat Zenerino on 5/20/14.
//  Copyright (c) 2014 BKON Connect LLC. All rights reserved.
//

#import "ConfigViewController.h"
#import "ConfigDetailViewController.h"

@interface ConfigViewController ()
@property BKONCentralManager *bkonManager;
@property NSArray *beacons;
@end

@implementation ConfigViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	_bkonManager = [[BKONCentralManager alloc] init];
	_bkonManager.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
	[self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated {
	[_bkonManager startScan];
}

- (IBAction)closeView:(id)sender {
	[_bkonManager stopScan];
	[self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return _beacons.count;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.row % 2 == 0)
		cell.backgroundColor = [UIColor colorWithRed:0.13 green:0.13 blue:0.13 alpha:1];
	else
		cell.backgroundColor = [UIColor colorWithRed:0.09 green:0.09 blue:0.09 alpha:1];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BeaconCell" forIndexPath:indexPath];

	BKONPeripheral *beacon = _beacons[indexPath.row];
	UILabel *majorLabel = (UILabel *)[cell viewWithTag:301];
	majorLabel.text = [beacon.major stringValue];
	UILabel *minorLabel = (UILabel *)[cell viewWithTag:302];
	minorLabel.text = [beacon.minor stringValue];
	UILabel *rssiLabel = (UILabel *)[cell viewWithTag:303];
	rssiLabel.text = [beacon.rssi stringValue];

	return cell;
}

#pragma mark - Navigation

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
	NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
	if ([_bkonManager connectToPeripheral:_beacons[indexPath.row]])
		return true;
	else
		return false;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
	ConfigDetailViewController *destination = [segue destinationViewController];
	[destination setPeripheral:_beacons[indexPath.row]];
	[destination setDelegate:self];
	_beacons = @[];
}

#pragma mark - BKONCentralManagerDelegate

- (void)centralManager:(BKONCentralManager *)manager refreshWithBeacons:(NSArray *)beacons {
	_beacons = beacons;
	dispatch_async(dispatch_get_main_queue(), ^{
		[self.tableView reloadData];
	});
}

- (void) managerStatePoweredOff {
    NSString *title     = @"Bluetooth Power";
    NSString *message   = @"You must turn on Bluetooth in Settings in order to use LE";
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
}

@end
