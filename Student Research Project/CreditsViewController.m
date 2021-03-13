//
//  CreditsViewController.m
//  Student Research Project
//
//  Created by Lee Warren on 3/07/2014.
//  Copyright (c) 2014 Lee Warren. All rights reserved.
//

#import "CreditsViewController.h"

@interface CreditsViewController ()

@end

@implementation CreditsViewController

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
    
    myOtherApps = [NSURL URLWithString:@"https://itunes.apple.com/us/app/dont-touch-the-green-balls/id905219671?ls=1&mt=8"];
    
    [self.creditsScrollView setScrollEnabled:NO];
    [self.creditsScrollView setContentSize:(CGSizeMake(280, 800))];
    _creditsScrollView.contentOffset = CGPointMake(0, -500);
    
    [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(scrollCreditsAuto)   userInfo:nil repeats:YES];
    
    
    //iphone 4 support
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    if (screenRect.size.height == 568){
        //iphone 5
    } else {
        //iphone 4 or other
        
        CGRect frame = _returnToMenuButton.frame;
        frame.origin.y= _returnToMenuButton.frame.origin.y - 90; //pass the cordinate which you want
        frame.origin.x= _returnToMenuButton.frame.origin.x; //pass the cordinate which you want
        _returnToMenuButton.frame = frame;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) scrollCreditsAuto {
    // NSLog(@"content offset %f",scrollVw.contentOffset.y);
    if (_creditsScrollView.contentOffset.y< 825) {
        
        //scroll to desired position
        _creditsScrollView.contentOffset = CGPointMake(0, _creditsScrollView.contentOffset.y+1);
        //NSLog(@"%f", _creditsScrollView.contentOffset.y);
        
    } else {
        _creditsScrollView.contentOffset = CGPointMake(0, -50);
        
        //annimates the tick, making it fade in and out
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 50, [UIScreen mainScreen].bounds.size.height/2 - 50, 100, 100)];
        imageView.contentMode = UIViewContentModeCenter;
        imageView.image = [UIImage imageNamed:@"Tick.png"];
        imageView.alpha = 0;
        [self.view addSubview:imageView];
        [UIView animateWithDuration:0.5
                         animations:^{
                             imageView.alpha = 1;    // move
                         }
                         completion:^(BOOL finished){
                             // code to run when animation completes
                             // (in this case, another animation:)
                             [UIView animateWithDuration:0.5
                                              animations:^{
                                                  imageView.alpha = 0.0;   // fade out
                                              }
                                              completion:^(BOOL finished){
                                                  [imageView removeFromSuperview];
                                              }];
                         }];

        
    }
    
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


- (IBAction)moreAppsButton:(id)sender {
    
    [[UIApplication sharedApplication] openURL:myOtherApps];
    
}
@end
