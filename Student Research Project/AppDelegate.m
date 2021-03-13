//
//  AppDelegate.m
//  Student Research Project
//
//  Created by Lee Warren on 15/06/2014.
//  Copyright (c) 2014 Lee Warren. All rights reserved.
//

#include <sys/types.h>
#include <sys/sysctl.h>


#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window;
@synthesize mainViewController;

#pragma mark -
#pragma mark Game Center Support

@synthesize currentPlayerID,
gameCenterAuthenticationComplete;



#pragma mark -
#pragma mark Game Center Support

// Check for the availability of Game Center API.
BOOL isGameCenterAPIAvailable()
{
    // Check for presence of GKLocalPlayer API.
    Class gcClass = (NSClassFromString(@"GKLocalPlayer"));
    
    // The device must be running running iOS 4.1 or later.
    NSString *reqSysVer = @"4.1";
    NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
    BOOL osVersionSupported = ([currSysVer compare:reqSysVer options:NSNumericSearch] != NSOrderedAscending);
    
    return (gcClass && osVersionSupported);
}

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    // Add the main view controller's view to the window and display.
    [self.window addSubview:mainViewController.view];
    [self.window makeKeyAndVisible];
    
    self.gameCenterAuthenticationComplete = NO;
    
    if (!isGameCenterAPIAvailable()) {
        // Game Center is not available.
        NSLog(@"Not availible");
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Game Center Connection"
                                                        message:@"You must be connected to game center to save highscores."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
        self.gameCenterAuthenticationComplete = NO;
    } else {
        
        GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
        
        /*
         The authenticateWithCompletionHandler method is like all completion handler methods and runs a block
         of code after completing its task. The difference with this method is that it does not release the
         completion handler after calling it. Whenever your application returns to the foreground after
         running in the background, Game Kit re-authenticates the user and calls the retained completion
         handler. This means the authenticateWithCompletionHandler: method only needs to be called once each
         time your application is launched. This is the reason the sample authenticates in the application
         delegate's application:didFinishLaunchingWithOptions: method instead of in the view controller's
         viewDidLoad method.
         
         Remember this call returns immediately, before the user is authenticated. This is because it uses
         Grand Central Dispatch to call the block asynchronously once authentication completes.
         */
        [[GKLocalPlayer localPlayer] authenticateWithCompletionHandler:^(NSError *error) {
            // If there is an error, do not assume local player is not authenticated.
            if (localPlayer.isAuthenticated) {
                
                // Enable Game Center Functionality
                self.gameCenterAuthenticationComplete = YES;
                
                if (! self.currentPlayerID || ! [self.currentPlayerID isEqualToString:localPlayer.playerID]) {
                    
                    // Current playerID has changed. Create/Load a game state around the new user.
                    self.currentPlayerID = localPlayer.playerID;
                    
                    // Load game instance for new current player, if none exists create a new.
                }
            } else {
                // No user is logged into Game Center, run without Game Center support or user interface.
                NSLog(@"Not availible");
                
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Game Center Connection"
                                                                message:@"You must be connected to game center to save highscores."
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
                [alert show];
                
                self.gameCenterAuthenticationComplete = NO;
            }
        }];
    }
    
    // The user is not authenticated until the Completion Handler block is called.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    /*
     Invalidate Game Center GKAuthentication and save game state, so the game doesn't start until the GKAuthentication
     Completion Handler is run. This prevents a new user from using the old users game state.
     */
    self.gameCenterAuthenticationComplete = NO;
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}




@end
