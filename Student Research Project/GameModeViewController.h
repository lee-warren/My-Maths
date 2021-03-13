//
//  GameModeViewController.h
//  Student Research Project
//
//  Created by Lee Warren on 2/07/2014.
//  Copyright (c) 2014 Lee Warren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameModeViewController : UIViewController

- (IBAction)playButtonPlusMode:(id)sender;

- (IBAction)playButtonMinusMode:(id)sender;

- (IBAction)playButtonTimesMode:(id)sender;

- (IBAction)playButtonDivideMode:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *operationImage;

@property (strong, nonatomic) IBOutlet UISegmentedControl *timeModeSegmentedControlPlus;

@property (strong, nonatomic) IBOutlet UISegmentedControl *timeModeSegmentedControlMinus;

@property (strong, nonatomic) IBOutlet UISegmentedControl *timeModeSegmentedControlTimes;

@property (strong, nonatomic) IBOutlet UISegmentedControl *timeModeSegmentedControlDivide;


@end
