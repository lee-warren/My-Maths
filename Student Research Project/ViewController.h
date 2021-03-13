//
//  ViewController.h
//  Student Research Project
//
//  Created by Lee Warren on 15/06/2014.
//  Copyright (c) 2014 Lee Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <GameKit/GameKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate> {
    
    
    int scoreNormal1Min;
    int scoreNormal2Min;
    int scoreNormal3Min;
    
    int scorePlus1Min;
    int scorePlus2Min;
    int scorePlus3Min;
    
    int scoreMinus1Min;
    int scoreMinus2Min;
    int scoreMinus3Min;
    
    int scoreTimes1Min;
    int scoreTimes2Min;
    int scoreTimes3Min;
    
    int scoreDivide1Min;
    int scoreDivide2Min;
    int scoreDivide3Min;
    
    
    int answerSubmitted;
    
    int num1;
    int num2;
    int range;
    int operationSign;
    int answer;
    
    UIToolbar* numberToolbar;
    
    //int timeLeftForGameMode;
    
    //countdown stuff
    NSTimer *levelTimer;
    int minutesLeft;
    float secondsLeft;
    float timeLeft;
    
    
    //audio stuff
    AVAudioPlayer *dingAudio;
    NSURL *dingFile;
    AVAudioPlayer *buzzerAudio;
    NSURL *buzzerFile;
    
    //pause stuff
    UIButton *pauseButton;
    BOOL pauseOn;
    
    UIButton *unpauseButton;
    
    //game over stuff
    UILabel *gameOverLabel;
    UILabel *gameOverScoreLabel;
    UIButton *playAgainButton;
    IBOutlet UIButton *returnToMenuButton;
    IBOutlet UIButton *leaderboardButton;
    
    //play again stuff
    BOOL resetGame;
    
    //gamecenter stuff
    GKGameCenterViewController *gameCenterController;

}

//different modes
@property (strong, nonatomic) NSString *GameType;
@property (strong, nonatomic) NSString *TimeType;
@property (nonatomic) int timeLeftForGameMode;

@property (strong, atomic) UIImageView *countdownImage;
@property (strong, atomic) UIImageView *imageView;

@property (strong, nonatomic) IBOutlet UILabel *num1Label;
@property (strong, nonatomic) IBOutlet UILabel *num2Label;
@property (strong, nonatomic) IBOutlet UITextField *answerField;

@property (strong, nonatomic) IBOutlet UILabel *timeLeftLabel;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;

- (IBAction)leaderboardButton:(id)sender;


//where the operation picture goes
@property (strong, nonatomic) IBOutlet UIImageView *operationImage;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;

//gamecenter
-(void)reportScore;



@end
