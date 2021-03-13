//
//  GameModeViewController.m
//  Student Research Project
//
//  Created by Lee Warren on 2/07/2014.
//  Copyright (c) 2014 Lee Warren. All rights reserved.
//

#import "GameModeViewController.h"
#import "ViewController.h"

@interface GameModeViewController ()

@end

@implementation GameModeViewController

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
    
    //iphone 4 support
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    if (screenRect.size.height == 568){
        //iphone 5
        _operationImage.image = [UIImage imageNamed:@"PlusMinusTimesDivide.png"];
    } else {
        //iphone 4 or other
        //this sets up the differences for the iphone 4 screen size
        
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

- (IBAction)playButtonPlusMode:(id)sender {
    
    ViewController *VC = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    VC.GameType = @"plus";
    
    switch (self.timeModeSegmentedControlPlus.selectedSegmentIndex) {
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

- (IBAction)playButtonMinusMode:(id)sender {
    
    ViewController *VC = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    VC.GameType = @"minus";
    
    switch (self.timeModeSegmentedControlMinus.selectedSegmentIndex) {
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

- (IBAction)playButtonTimesMode:(id)sender {
    
    ViewController *VC = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    VC.GameType = @"times";
    
    switch (self.timeModeSegmentedControlTimes.selectedSegmentIndex) {
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

- (IBAction)playButtonDivideMode:(id)sender {
    
    ViewController *VC = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    VC.GameType = @"divide";
    
    switch (self.timeModeSegmentedControlDivide.selectedSegmentIndex) {
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
@end
