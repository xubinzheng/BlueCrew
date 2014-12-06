//
//  RecognizeViewController.h
//  Basic SDK
//
//  Created by Beat Zenerino on 5/15/14.
//  Copyright (c) 2014 BKON Connect LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BKON-SDK/BKON-SDK.h>

@interface NotifyViewController : UIViewController <BKONLocationManagerDelegate>

@property (weak) IBOutlet UIView *detailView;
@property (nonatomic, weak) IBOutlet UISwitch *notifyOnEntry;
@property (nonatomic, weak) IBOutlet UISwitch *notifyOnExit;
@property (nonatomic, weak) IBOutlet UISwitch *notifyOnDisplay;
@property (nonatomic, strong) BKONBeacon *beacon;

- (IBAction)changeNotify:(id)sender;
- (IBAction)closeView:(id)sender;

@end
