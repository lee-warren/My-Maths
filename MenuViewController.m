//
//  MenuViewController.m
//  Student Research Project
//
//  Created by Lee Warren on 29/06/2014.
//  Copyright (c) 2014 Lee Warren. All rights reserved.
//

#import "MenuViewController.h"
#import "ViewController.h"
#import <GameKit/GameKit.h>

@interface MenuViewController ()

@end

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    //_operationImage.image = [UIImage imageNamed:@"PlusMinusTimesDivide.png"];
    _operationImage.alpha = 1;
    _backgroundImage.image = [UIImage imageNamed:@"black.png"];
    _backgroundImage.alpha = 0;
    
    facebookPage = [NSURL URLWithString:@"https://www.facebook.com/MyMathsApp"];
    
    
    //iphone 4 support
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    if (screenRect.size.height == 568){
        //iphone 5
        _operationImage.image = [UIImage imageNamed:@"PlusMinusTimesDivide.png"];
    } else {
        //iphone 4 or other
        
        CGRect frame = _aboutButton.frame;
        frame.origin.y= _aboutButton.frame.origin.y - 90; //pass the cordinate which you want
        frame.origin.x= _aboutButton.frame.origin.x; //pass the cordinate which you want
        _aboutButton.frame = frame;
        
        frame = _leaderboardButton.frame;
        frame.origin.y= _leaderboardButton.frame.origin.y - 90; //pass the cordinate which you want
        frame.origin.x= _leaderboardButton.frame.origin.x; //pass the cordinate which you want
        _leaderboardButton.frame = frame;
        
        frame = _facebookButton.frame;
        frame.origin.y= _facebookButton.frame.origin.y - 90; //pass the cordinate which you want
        frame.origin.x= _facebookButton.frame.origin.x; //pass the cordinate which you want
        _facebookButton.frame = frame;
        
       //for some reason doesnt work????
        _operationImage.image = [UIImage imageNamed:@"PlusMinusTimesDivide-iPhone4.png"];
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)playButton:(id)sender {
    
    ViewController *VC = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    VC.GameType = @"normal";
    
    switch (self.timeModeSegmentedControlNormal.selectedSegmentIndex) {
        case 0:
            VC.timeLeftForGameMode = 60;
            VC.TimeType = @"1Min";
            break;
        case 1:
            VC.timeLeftForGameMode = 120;
            VC.TimeType = @"2Min";
            break;
        case 2:
            VC.timeLeftForGameMode = 180;
            VC.TimeType = @"3Min";
            break;
        default:
            break;
    }
    
    [self presentViewController:VC animated:YES completion:nil];
    
}

- (void)gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController
{
    [gameCenterViewController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (IBAction)leaderboardButton:(id)sender {
    
    //create the page that has the highscore on it
    gameCenterController = [[GKGameCenterViewController alloc] init];
    
    gameCenterController.gameCenterDelegate = self;
    gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
    
    [self presentViewController: gameCenterController animated: YES completion:nil];
    
}
- (IBAction)facebookButton:(id)sender {
    
    facebookPage = [NSURL URLWithString:@"https://www.facebook.com/MyMathsApp"];

    [[UIApplication sharedApplication] openURL:facebookPage];
    
}
@end
