//
//  ConfigEditViewController.h
//  Basic SDK
//
//  Created by Beat Zenerino on 5/21/14.
//  Copyright (c) 2014 BKON Connect LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConfigDetailViewController.h"

@interface ConfigEditViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) ConfigDetailViewController *delegate;
@property (nonatomic, assign) NSInteger setting;

- (IBAction)cancelButton:(id)sender;
- (IBAction)doneButton:(id)sender;

@end
