//
//  RangeViewController.h
//  Basic SDK
//
//  Created by Beat Zenerino on 5/16/14.
//  Copyright (c) 2014 BKON Connect LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BKON-SDK/BKON-SDK.h>

@interface RangeViewController : UIViewController <BKONLocationManagerDelegate>

@property (weak) IBOutlet UIView *bkonLogo;
@property (weak) IBOutlet UIImageView *bkonGlow;
@property (weak) IBOutlet UILabel *rssiLabel;
@property (nonatomic, strong) BKONBeacon *beacon;

- (IBAction)closeView:(id)sender;

@end
