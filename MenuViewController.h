//
//  MenuViewController.h
//  Student Research Project
//
//  Created by Lee Warren on 29/06/2014.
//  Copyright (c) 2014 Lee Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>

@interface MenuViewController : UIViewController {

    //gamecenter stuff
    GKGameCenterViewController *gameCenterController;
    
    NSURL *facebookPage;
    
}


- (IBAction)leaderboardButton:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *leaderboardButton;



- (IBAction)facebookButton:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *facebookButton;




@property (strong, nonatomic) IBOutlet UIButton *aboutButton;

@property (strong, nonatomic) IBOutlet UIImageView *operationImage;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;

- (IBAction)playButton:(id)sender;

@property (strong, nonatomic) IBOutlet UISegmentedControl *timeModeSegmentedControlNormal;

@end
