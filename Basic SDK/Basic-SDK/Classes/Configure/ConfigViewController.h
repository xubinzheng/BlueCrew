//
//  ConfigureTableViewController.h
//  Basic SDK
//
//  Created by Beat Zenerino on 5/20/14.
//  Copyright (c) 2014 BKON Connect LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BKON-SDK/BKON-SDK.h>

@interface ConfigViewController : UIViewController <UITableViewDelegate,BKONCentralManagerDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

- (IBAction)closeView:(id)sender;

@end
