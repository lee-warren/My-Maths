//
//  AppDelegate.h
//  Student Research Project
//
//  Created by Lee Warren on 15/06/2014.
//  Copyright (c) 2014 Lee Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>

// Preferred method for testing for Game Center
BOOL isGameCenterAvailable();


@class MainViewController;


@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    
    UIWindow *window;
    UIViewController *mainViewController;
    
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) IBOutlet UIViewController *mainViewController;


// currentPlayerID is the value of the playerID last time GameKit authenticated.
@property (retain,readwrite) NSString * currentPlayerID;

// isGameCenterAuthenticationComplete is set after authentication, and authenticateWithCompletionHandler's completionHandler block has been run. It is unset when the applicaiton is backgrounded.
@property (readwrite, getter=isGameCenterAuthenticationComplete) BOOL gameCenterAuthenticationComplete;





@end
