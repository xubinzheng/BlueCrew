//
//  ViewController.m
//  Basic SDK
//
//  Created by Beat Zenerino on 5/11/14.
//  Copyright (c) 2014 BKON Connect LLC. All rights reserved.
//

#import "MasterViewController.h"
#import "SelectViewController.h"

#import <IBMData/IBMData.h>
#import <IBMBluemix/IBMBluemix.h>


@interface MasterViewController ()
@property BOOL changeView;
@end

@implementation MasterViewController


-(void)viewDidDisappear:(BOOL)animated {
//    NSString *applicationId = nil;
//    NSString *applicationSecret = nil;
//    NSString *applicationRoute = nil;
//    
//    
//    [IBMBluemix initializeWithApplicationId:applicationId andApplicationSecret:applicationSecret andApplicationRoute:applicationRoute];
//    [IBMData initializeService];

	[self deselectRow];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MasterCell" forIndexPath:indexPath];
	UITextField *textField = (UITextField *)[cell viewWithTag:100];
	// set cell background
	if (indexPath.row % 2 == 0)
		cell.contentView.backgroundColor = [UIColor colorWithRed:0.13 green:0.13 blue:0.13 alpha:1];
	else
		cell.contentView.backgroundColor = [UIColor colorWithRed:0.09 green:0.09 blue:0.09 alpha:1];

	switch (indexPath.row) {
		case 0:
			textField.text = @"Detect";
			break;
		case 1:
			textField.text = @"Notify";
			break;
		case 2:
			textField.text = @"Range";
			break;
		case 3:
			textField.text = @"Configure";
			break;
		default:
			break;
	}

	return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // The table view should not be re-orderable.
    return NO;
}

- (void)deselectRow {
	NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
	UITableViewCell *cell = (UITableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
	if (indexPath.row % 2 == 0)
		cell.contentView.backgroundColor = [UIColor colorWithRed:0.13 green:0.13 blue:0.13 alpha:1];
	else
		cell.contentView.backgroundColor = [UIColor colorWithRed:0.09 green:0.09 blue:0.09 alpha:1];
}

#pragma mark - Table view delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = (UITableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
	// set cell background
	UIColor * selectedCellColor = [UIColor colorWithRed:0.46 green:0.57 blue:0.22 alpha:1];
	cell.contentView.backgroundColor = selectedCellColor;
	cell.backgroundColor = selectedCellColor;

	switch (indexPath.row) {
		case 0: {
			UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetectViewController"];
			[self.navigationController pushViewController:vc animated:YES];
			break;
		}
		case 1: {
			SelectViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SelectViewController"];
			vc.demoFunction = @"Notify";
			[self.navigationController pushViewController:vc animated:YES];
			break;
		}
		case 2: {
			SelectViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SelectViewController"];
			vc.demoFunction = @"Range";
			[self.navigationController pushViewController:vc animated:YES];
			break;
		}
		case 3: {
			UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ConfigViewController"];
			[self.navigationController pushViewController:vc animated:YES];
			break;
		}
	}
}

@end
