//
//  DetectViewController.h
//  Basic SDK
//
//  Created by Beat Zenerino on 6/22/14.
//  Copyright (c) 2014 BKON Connect LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BKON-SDK/BKON-SDK.h>

@interface DetectViewController : UIViewController <UITableViewDelegate,BKONLocationManagerDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

- (IBAction)closeView:(id)sender;

@end
