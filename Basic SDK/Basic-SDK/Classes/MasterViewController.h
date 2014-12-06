//
//  ViewController.h
//  Basic SDK
//
//  Created by Beat Zenerino on 5/11/14.
//  Copyright (c) 2014 BKON Connect LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterViewController : UIViewController <UITableViewDelegate,NSURLConnectionDelegate>

@property (nonatomic, strong, readwrite) NSInputStream *consumerStream;
@property (nonatomic, strong, readwrite) NSURLConnection *connection;

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end
