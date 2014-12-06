//
//  SelectViewController.h
//  Basic SDK
//
//  Created by Beat Zenerino on 6/23/14.
//  Copyright (c) 2014 BKON Connect LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BKON-SDK/BKON-SDK.h>


@interface SelectViewController : UIViewController <UITableViewDelegate,BKONLocationManagerDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSString *demoFunction;

- (IBAction)closeView:(id)sender;

@end
