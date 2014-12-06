//
//  ConfigDetailViewController.h
//  Basic SDK
//
//  Created by Beat Zenerino on 5/20/14.
//  Copyright (c) 2014 BKON Connect LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConfigViewController.h"

typedef enum {
	BeaconMajor = 0,
	BeaconMinor,
	BeaconAdvRate,
	BeaconTxPower,
	BeaconIdentify
} BeaconIndex;


@interface ConfigDetailViewController : UIViewController <UITableViewDelegate,BKONPeripheralDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) ConfigViewController *delegate;
@property (nonatomic, strong) BKONPeripheral *bp;

@property (nonatomic, assign) NSInteger writeSetting;
@property (nonatomic, strong) id writeValue;
@property (nonatomic, assign) BOOL writePending;

- (void)setPeripheral:(BKONPeripheral *)peripheral;
- (IBAction)closeView:(id)sender;

@end
