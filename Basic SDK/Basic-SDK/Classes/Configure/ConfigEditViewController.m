//
//  ConfigEditViewController.m
//  Basic SDK
//
//  Created by Beat Zenerino on 5/21/14.
//  Copyright (c) 2014 BKON Connect LLC. All rights reserved.
//

#import "ConfigEditViewController.h"

@interface ConfigEditViewController ()
@property NSArray *settingsValues;
@property NSNumber *currentSelection;
@end

@implementation ConfigEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setSetting:(NSInteger)setting {
	_setting = setting;
	
	switch (setting) {
		case BeaconMajor: {
			self.title = @"Major";
			break;
		}
		case BeaconMinor: {
			self.title = @"Major";
			break;
		}
		case BeaconAdvRate: {
			self.title = @"Advertising Rate";
			_settingsValues =  @[[NSNumber numberWithFloat:100.00],
								 [NSNumber numberWithFloat:152.50],
								 [NSNumber numberWithFloat:211.25],
								 [NSNumber numberWithFloat:318.75],
								 [NSNumber numberWithFloat:417.50],
								 [NSNumber numberWithFloat:546.25],
								 [NSNumber numberWithFloat:760.00],
								 [NSNumber numberWithFloat:852.50],
								 [NSNumber numberWithFloat:1022.50],
								 [NSNumber numberWithFloat:1285.00]];
			_currentSelection = self.delegate.bp.advertisingRate;
			break;
		}
		case BeaconTxPower: {
			self.title = @"Power";
			_settingsValues =  @[[NSNumber numberWithChar:4],
								 [NSNumber numberWithChar:0],
								 [NSNumber numberWithChar:-4],
								 [NSNumber numberWithChar:-8],
								 [NSNumber numberWithChar:-12],
								 [NSNumber numberWithChar:-16],
								 [NSNumber numberWithChar:-20],
								 [NSNumber numberWithChar:-30]];
			_currentSelection = self.delegate.bp.txPower;
			break;
		}
		default:
			break;
	}
}

- (IBAction)cancelButton:(id)sender {
	[self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)doneButton:(id)sender {
	switch (_setting) {
		case BeaconMajor: {
			UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
			UITextField *textField = (UITextField *)[cell viewWithTag:321];
			UInt16 major = [textField.text intValue];
			if (major != [self.delegate.bp.major unsignedShortValue]) {
				self.delegate.writeSetting = _setting;
				self.delegate.writeValue = [NSNumber numberWithUnsignedShort:major];
				self.delegate.writePending = true;
			}
			break;
		}
		case BeaconMinor: {
			UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
			UITextField *textField = (UITextField *)[cell viewWithTag:321];
			UInt16 minor = [textField.text intValue];
			if (minor != [self.delegate.bp.minor unsignedShortValue]) {
				self.delegate.writeSetting = _setting;
				self.delegate.writeValue = [NSNumber numberWithUnsignedShort:minor];
				self.delegate.writePending = true;
			}
			break;
		}
		case BeaconAdvRate: {
			if ([_currentSelection unsignedShortValue] != [self.delegate.bp.advertisingRate unsignedShortValue]) {
				self.delegate.writeSetting = _setting;
				self.delegate.writeValue = _currentSelection;
				self.delegate.writePending = true;
			}
			break;
		}
		case BeaconTxPower: {
			if ([_currentSelection unsignedShortValue] != [self.delegate.bp.txPower unsignedShortValue]) {
				self.delegate.writeSetting = _setting;
				self.delegate.writeValue = _currentSelection;
				self.delegate.writePending = true;
			}
			break;
		}
		default:
			break;
	}
	[self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if (_setting == BeaconAdvRate || _setting == BeaconTxPower) {
		return _settingsValues.count;
	}
	return 1;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.row % 2 == 0)
		cell.backgroundColor = [UIColor colorWithRed:0.13 green:0.13 blue:0.13 alpha:1];
	else
		cell.backgroundColor = [UIColor colorWithRed:0.09 green:0.09 blue:0.09 alpha:1];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell;

	switch (_setting) {
		case BeaconMajor: {
			cell = [tableView dequeueReusableCellWithIdentifier:@"TextEditCell" forIndexPath:indexPath];
			UITextField *textField = (UITextField *)[cell viewWithTag:321];
			textField.text = [self.delegate.bp.major stringValue];
			break;
		}
		case BeaconMinor: {
			cell = [tableView dequeueReusableCellWithIdentifier:@"TextEditCell" forIndexPath:indexPath];
			UITextField *textField = (UITextField *)[cell viewWithTag:321];
			textField.text = [self.delegate.bp.minor stringValue];
			break;
		}
		case BeaconAdvRate: {
			cell = [tableView dequeueReusableCellWithIdentifier:@"ValueCell" forIndexPath:indexPath];
			NSNumber *myRate = _settingsValues[indexPath.row];
			cell.textLabel.text = [myRate stringValue];
			if ([myRate floatValue] == [_currentSelection floatValue])
				cell.accessoryType = UITableViewCellAccessoryCheckmark;
			else
				cell.accessoryType = UITableViewCellAccessoryNone;
			break;
		}
		case BeaconTxPower: {
			cell = [tableView dequeueReusableCellWithIdentifier:@"ValueCell" forIndexPath:indexPath];
			NSNumber *myPower = _settingsValues[indexPath.row];
			int pow = [myPower intValue];
			if (pow == 4) {
				cell.textLabel.text = [NSString stringWithFormat:@"%@ dBm - HIGH", myPower];
			} else if (pow == -8) {
				cell.textLabel.text = [NSString stringWithFormat:@"%@ dBm - MEDIUM", myPower];
			} else if (pow == -30) {
				cell.textLabel.text = [NSString stringWithFormat:@"%@ dBm - LOW", myPower];
			} else {
				cell.textLabel.text = [NSString stringWithFormat:@"%@ dBm", myPower];
			}
			if ([myPower charValue] == [_currentSelection charValue])
				cell.accessoryType = UITableViewCellAccessoryCheckmark;
			else
				cell.accessoryType = UITableViewCellAccessoryNone;
			break;
		}

		default:
			break;
	}
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if (_setting == BeaconAdvRate) {
		_currentSelection = _settingsValues[indexPath.row];
		[self.tableView reloadData];
	}
	else if (_setting == BeaconTxPower) {
		_currentSelection = _settingsValues[indexPath.row];
		[self.tableView reloadData];
	}
}

@end
