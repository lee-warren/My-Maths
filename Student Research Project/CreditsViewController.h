//
//  CreditsViewController.h
//  Student Research Project
//
//  Created by Lee Warren on 3/07/2014.
//  Copyright (c) 2014 Lee Warren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreditsViewController : UIViewController {
    
    NSURL *myOtherApps;
    
}

@property (strong, nonatomic) IBOutlet UIButton *returnToMenuButton;

@property (strong, nonatomic) IBOutlet UIScrollView *creditsScrollView;


@property (strong, nonatomic) IBOutlet UILabel *otherText;
@property (strong, nonatomic) IBOutlet UILabel *moreAppsText;
@property (strong, nonatomic) IBOutlet UIButton *moreAppsButton;
- (IBAction)moreAppsButton:(id)sender;

@end
