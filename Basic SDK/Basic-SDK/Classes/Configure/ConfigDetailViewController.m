//
//  ConfigDetailViewController.m
//  Basic SDK
//
//  Created by Beat Zenerino on 5/20/14.
//  Copyright (c) 2014 BKON Connect LLC. All rights reserved.
//

#import "ConfigDetailViewController.h"
#import "ConfigEditViewController.h"
#import "UpdateViewController.h"

@interface ConfigDetailViewController ()
@property UpdateViewController *updateVC;
@property BOOL dirty;
@property BOOL readMajor;
@property BOOL readMinor;
@end

@implementation ConfigDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	_readMajor = false;
	_readMinor = false;
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	if (self.writePending) {
		self.navigationController.modalPresentationStyle = UIModalPresentationCurrentContext;
		_updateVC = [self.storyboard instantiateViewControllerWithIdentifier:@"UpdateViewController"];
		[self presentViewController:_updateVC animated:NO completion:nil];
		[self performSelector:@selector(writeNewSetting) withObject:nil afterDelay:0.1];
	}
}

- (void)writeNewSetting {
	switch (self.writeSetting) {
		case BeaconMajor:
			[self.bp writeMajor:self.writeValue];
			break;
		case BeaconMinor:
			[self.bp writeMinor:self.writeValue];
			break;
		case BeaconAdvRate:
			[self.bp writeAdvertisingRate:self.writeValue];
			break;
		case BeaconTxPower:
			[self.bp writeTxPower:self.writeValue];
			break;
			
		default:
			break;
	}
}

- (IBAction)closeView:(id)sender {
	[self.bp writeReset];
	[self.navigationController popViewControllerAnimated:YES];
}

- (void)setPeripheral:(BKONPeripheral *)peripheral {
	self.bp = peripheral;
	self.bp.delegate = self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return 5;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.row % 2 == 0)
		cell.backgroundColor = [UIColor colorWithRed:0.13 green:0.13 blue:0.13 alpha:1];
	else
		cell.backgroundColor = [UIColor colorWithRed:0.09 green:0.09 blue:0.09 alpha:1];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell;
	
	if (indexPath.row <= BeaconTxPower) {
		cell = [tableView dequeueReusableCellWithIdentifier:@"DetailBeaconCell" forIndexPath:indexPath];
		UILabel *textLabel = (UILabel *)[cell viewWithTag:310];
		UILabel *detailTextLabel = (UILabel *)[cell viewWithTag:311];
		UIActivityIndicatorView *spinner = (UIActivityIndicatorView *)[cell viewWithTag:312];
		switch (indexPath.row) {
			case BeaconMajor: {
				textLabel.text = @"Major";
				if (_readMajor) {
					[spinner stopAnimating];
					detailTextLabel.text = [self.bp.major stringValue];
				} else {
					[spinner startAnimating];
					detailTextLabel.text = @"";
				}
				break;
			}
			case BeaconMinor: {
				textLabel.text = @"Minor";
				if (_readMinor) {
					[spinner stopAnimating];
					detailTextLabel.text = [self.bp.minor stringValue];
				} else {
					[spinner startAnimating];
					detailTextLabel.text = @"";
				}
				break;
			}
			case BeaconAdvRate: {
				textLabel.text = @"Advertising Rate";
				if (self.bp.advertisingRate) {
					[spinner stopAnimating];
					detailTextLabel.text = [NSString stringWithFormat:@"%@ ms",	[self.bp.advertisingRate stringValue]];
				} else {
					[spinner startAnimating];
					detailTextLabel.text = @"";
				}
				break;
			}
			case BeaconTxPower: {
				textLabel.text = @"TX Power";
				if (self.bp.txPower) {
					[spinner stopAnimating];
					detailTextLabel.text = [NSString stringWithFormat:@"%@ dBm", [self.bp.txPower stringValue]];
				} else {
					[spinner startAnimating];
					detailTextLabel.text = @"";
				}
				break;
			}
			default:
				break;
		}
	} else {
		cell = [tableView dequeueReusableCellWithIdentifier:@"BeaconIdentifyCell" forIndexPath:indexPath];
	}
	return cell;
}

#pragma mark - Navigation

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.row == BeaconIdentify) {
		[self.bp pulseLED];
	}
	else {
		ConfigEditViewController *configVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ConfigEditViewController"];
		[configVC setDelegate:self];
		[configVC setSetting:indexPath.row];
		[self.navigationController pushViewController:configVC animated:YES];
	}
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - BLEPeripheralDelegate

//- (void)peripheralDidRefresh {
- (void)peripheral:(BKONPeripheral *)peripheral didUpdateAttribute:(BKONAttribute)attribute error:(NSError *)error {
	dispatch_async(dispatch_get_main_queue(), ^{
		if (attribute == BKONMajor) {
			_readMajor = true;
			_readMinor = true;
		}
		if (_updateVC) {
			[_updateVC dismissViewControllerAnimated:YES completion:nil];
			_updateVC = nil;
			self.writePending = false;
		}
		[self.tableView reloadData];
	});
}

@end
