//
//  RangeViewController.m
//  Basic SDK
//
//  Created by Beat Zenerino on 5/16/14.
//  Copyright (c) 2014 BKON Connect LLC. All rights reserved.
//

#import "RangeViewController.h"

//#define RANGE_LOG

#ifdef RANGE_LOG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#endif

@interface RangeViewController ()
@property BKONLocationManager *bkonManager;
@property BKONRegion *region;
@property BOOL logoVisible;
@property NSTimer *animeTimer;
@property NSInteger rssi;
@property CGFloat moveHeight;
@end

@implementation RangeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
	alphaAnimation.fromValue = [NSNumber numberWithFloat:1.0];
	alphaAnimation.toValue = [NSNumber numberWithFloat:0.0];
	alphaAnimation.duration = 1.0;
	alphaAnimation.repeatCount = HUGE_VALF;
	alphaAnimation.autoreverses =YES;
	[_bkonGlow.layer addAnimation:alphaAnimation forKey:@"opacity"];
	[self hideLogo];
	
	_bkonManager = [[BKONLocationManager alloc] init];
	_bkonManager.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated {
	_moveHeight = self.view.bounds.size.height - 88.0;
	
	_region = [[BKONRegion alloc] initWithProximityUUID:self.beacon.proximityUUID
												  major:[self.beacon.major unsignedShortValue]
												  minor:[self.beacon.minor unsignedShortValue]
											 identifier:@"com.bkon.range"];
	[_bkonManager startRangingBeaconsInRegion:_region];
}

- (IBAction)closeView:(id)sender {
	[_animeTimer invalidate];
	[_bkonManager stopRangingBeaconsInRegion:_region];
	[self.navigationController popViewControllerAnimated:YES];
}

- (void)showLogo {
	_bkonLogo.hidden = false;
	_logoVisible = true;
	_animeTimer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(moveLogo) userInfo:nil repeats:YES];
}

- (void)hideLogo {
	_bkonLogo.hidden = true;
	_logoVisible = false;
	[_animeTimer invalidate];
}

- (void)moveLogo {
	static float oldY = 50.0;
	float newY;

	if (_rssi != 0 ) {
		DLog(@"rssi: %lu", _rssi);
		float distFactor = ((float)_rssi + 30.0) / -60.0;
		newY = _moveHeight - (distFactor * 380.0);
		if (newY > 440.0)
			newY = 440.0;
		DLog(@"newYPos: %.2f", newY);
		// animate smoother
		if (oldY > newY) {
			// moving down
			float dy = oldY - newY;
			if (dy > 20.0)
				newY = oldY - 20.0;
			if (dy > 10.0)
				newY = oldY - 10.0;
			else if (dy > 6)
				newY = oldY - 6.0;
			else if (dy > 4)
				newY = oldY - 4.0;
			else if (dy > 2)
				newY = oldY - 2.0;
		} else {
			float dy = newY - oldY;
			if (dy > 20.0)
				newY = oldY + 20.0;
			if (dy > 10.0)
				newY = oldY + 10.0;
			else if (dy > 6.0)
				newY = oldY + 6.0;
			else if (dy > 4.0)
				newY = oldY + 4.0;
			else if (dy > 2.0)
				newY = oldY + 2.0;
		}
	}
	else {
		newY = 50.0;
	}
	oldY = newY;
	_bkonLogo.center = CGPointMake(self.view.bounds.size.width / 2, newY);
}

#pragma mark - BKONLocationManager delegate

- (void)bkonManager:(BKONLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(BKONRegion *)region {
	if (beacons.count > 0) {
		BKONBeacon *bkon = beacons[0];
		if (_logoVisible == false)
			[self showLogo];
		_rssi = bkon.rssi;
		self.rssiLabel.text = [NSString stringWithFormat:@"%ld", (long)_rssi];
	} else {
		if (_logoVisible == true) {
			[self hideLogo];
			self.rssiLabel.text = @"";
		}
	}
}

@end
