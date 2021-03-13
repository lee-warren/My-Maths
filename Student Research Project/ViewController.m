//
//  ViewController.m
//  Student Research Project
//
//  Created by Lee Warren on 15/06/2014.
//  Copyright (c) 2014 Lee Warren. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <GameKit/GameKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    resetGame = false;
    
    [self hidePauseAndGameOverStuff];
    
    [self musicLoadingCrap];
    
    [self isThisAResetGame];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)musicLoadingCrap {
    
    dingFile = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Ding" ofType:@"wav"]];
    dingAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:dingFile error:nil];

    buzzerFile = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Buzzer" ofType:@"mp3"]];
    buzzerAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:buzzerFile error:nil];

}


-(void)isThisAResetGame {
    
    if ([_GameType  isEqual: @"normal"]) { //do normall stuff
        
        //shows the fields if this is game two - replay
        if (resetGame == true) {
            
                [_timeLeftLabel setHidden:NO];
                [_scoreLabel setHidden:NO];
                [_num1Label setHidden:NO];
                [_num2Label setHidden:NO];
                [_answerField setHidden:NO];
                [pauseButton setHidden:NO];
            
                scoreNormal1Min = 0;
                scoreNormal2Min = 0;
                scoreNormal3Min = 0;
                _scoreLabel.text = [NSString stringWithFormat:@"0"];
            
                //makes the number pad appear
                [_answerField becomeFirstResponder];
            
                [self operation1Plus];
            
                timeLeft = _timeLeftForGameMode;
                levelTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
            
            } else {
                [self mainLoadingStuff];
            }
        
    } else if ([_GameType  isEqual: @"plus"]) {
        
        //shows the fields if this is game two - replay
        if (resetGame == true) {
            
            [_timeLeftLabel setHidden:NO];
            [_scoreLabel setHidden:NO];
            [_num1Label setHidden:NO];
            [_num2Label setHidden:NO];
            [_answerField setHidden:NO];
            [pauseButton setHidden:NO];
            
            scorePlus1Min = 0;
            scorePlus2Min = 0;
            scorePlus3Min = 0;
            _scoreLabel.text = [NSString stringWithFormat:@"0"];
            
            //makes the number pad appear
            [_answerField becomeFirstResponder];
            
            [self operation1Plus];
            
            timeLeft = _timeLeftForGameMode;
            levelTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
            
        } else {
            [self mainLoadingStuff];
        }
    } else if ([_GameType  isEqual: @"minus"]) {
        
        //shows the fields if this is game two - replay
        if (resetGame == true) {
            
            [_timeLeftLabel setHidden:NO];
            [_scoreLabel setHidden:NO];
            [_num1Label setHidden:NO];
            [_num2Label setHidden:NO];
            [_answerField setHidden:NO];
            [pauseButton setHidden:NO];
            
            scoreMinus1Min = 0;
            scoreMinus2Min = 0;
            scoreMinus3Min = 0;
            _scoreLabel.text = [NSString stringWithFormat:@"0"];
            
            //makes the number pad appear
            [_answerField becomeFirstResponder];
            
            [self operation2Minus];
            
            timeLeft = _timeLeftForGameMode;
            levelTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
            
        } else {
            [self mainLoadingStuff];
        }
    } else if ([_GameType  isEqual: @"times"]) {
        
        //shows the fields if this is game two - replay
        if (resetGame == true) {
            
            [_timeLeftLabel setHidden:NO];
            [_scoreLabel setHidden:NO];
            [_num1Label setHidden:NO];
            [_num2Label setHidden:NO];
            [_answerField setHidden:NO];
            [pauseButton setHidden:NO];
            
            scoreTimes1Min = 0;
            scoreTimes2Min = 0;
            scoreTimes3Min = 0;
            _scoreLabel.text = [NSString stringWithFormat:@"0"];
            
            //makes the number pad appear
            [_answerField becomeFirstResponder];
            
            [self operation3Times];
            
            timeLeft = _timeLeftForGameMode;
            levelTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
            
        } else {
            [self mainLoadingStuff];
        }
    } else if ([_GameType  isEqual: @"divide"]) {
        
        //shows the fields if this is game two - replay
        if (resetGame == true) {
            
            [_timeLeftLabel setHidden:NO];
            [_scoreLabel setHidden:NO];
            [_num1Label setHidden:NO];
            [_num2Label setHidden:NO];
            [_answerField setHidden:NO];
            [pauseButton setHidden:NO];
            
            scoreDivide1Min = 0;
            scoreDivide2Min = 0;
            scoreDivide3Min = 0;
            _scoreLabel.text = [NSString stringWithFormat:@"0"];
            
            //makes the number pad appear
            [_answerField becomeFirstResponder];
            
            [self operation4Divide];
            
            timeLeft = _timeLeftForGameMode;
            levelTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
            
        } else {
            [self mainLoadingStuff];
        }
    }

    _num1Label.text = [NSString stringWithFormat:@"%d", num1];
    _num2Label.text = [NSString stringWithFormat:@"%d", num2];
    _answerField.text = @"";

}

-(void)mainLoadingStuff { // scorelabel, num1label, num2label, textfield,
    
    //sets the background colour
    self.view.backgroundColor = [UIColor blackColor];

    if ([_GameType  isEqual: @"normal"]) { //do normall stuff
    
        // Create the scoreLabel object and set it's frame
        _scoreLabel.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:1.0];
        // Set the text property of the scoreLabel
        _scoreLabel.text = [NSString stringWithFormat:@"0"];
        [_scoreLabel setFont:[UIFont fontWithName:@"Arial" size:25]];
        // Add the scoreLabel object to the view
        [self.view addSubview:_scoreLabel];
        
        [self operation1Plus];
    
    } else if ([_GameType  isEqual: @"plus"]) {
        
        // Create the scoreLabel object and set it's frame
        _scoreLabel.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:1.0];
        // Set the text property of the scoreLabel
        _scoreLabel.text = [NSString stringWithFormat:@"0"];
        [_scoreLabel setFont:[UIFont fontWithName:@"Arial" size:25]];
        // Add the scoreLabel object to the view
        [self.view addSubview:_scoreLabel];
        
        [self operation1Plus];
        
    } else if ([_GameType  isEqual: @"minus"]) {
       
        // Create the scoreLabel object and set it's frame
        _scoreLabel.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:1.0];
        // Set the text property of the scoreLabel
        _scoreLabel.text = [NSString stringWithFormat:@"0"];
        [_scoreLabel setFont:[UIFont fontWithName:@"Arial" size:25]];
        // Add the scoreLabel object to the view
        [self.view addSubview:_scoreLabel];
        
        [self operation2Minus];
        
    }else if ([_GameType  isEqual: @"times"]) {
        
        // Create the scoreLabel object and set it's frame
        _scoreLabel.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:1.0];
        // Set the text property of the scoreLabel
        _scoreLabel.text = [NSString stringWithFormat:@"0"];
        [_scoreLabel setFont:[UIFont fontWithName:@"Arial" size:25]];
        // Add the scoreLabel object to the view
        [self.view addSubview:_scoreLabel];
        
        [self operation3Times];
        
    }else if ([_GameType  isEqual: @"divide"]) {
        
        // Create the scoreLabel object and set it's frame
        _scoreLabel.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:1.0];
        // Set the text property of the scoreLabel
        _scoreLabel.text = [NSString stringWithFormat:@"0"];
        [_scoreLabel setFont:[UIFont fontWithName:@"Arial" size:25]];
        // Add the scoreLabel object to the view
        [self.view addSubview:_scoreLabel];
        
        [self operation4Divide];
        
    }
    
    //sets the colour and background colour of the label
    _num1Label.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:1.0];
    [_num1Label setFont:[UIFont fontWithName:@"Arial" size:50]];
    //_num1Label.backgroundColor=[UIColor blackColor];
    // Set the text property of the number1 Label
    _num1Label.text = [NSString stringWithFormat:@"%d", num1];
    //centers the label
    [_num1Label setTextAlignment:NSTextAlignmentCenter];
    // Add the number1 Label object to the view
    [self.view addSubview:_num1Label];
    
    //sets the colour, font and background colour of the label
    _num2Label.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:1.0];
    [_num2Label setFont:[UIFont fontWithName:@"Arial" size:50]];
    //_num2Label.backgroundColor=[UIColor blackColor];
    // Set the text property of the number2 Label
    _num2Label.text = [NSString stringWithFormat:@"%d", num2];
    //centers the label
    [_num2Label setTextAlignment:NSTextAlignmentCenter];
    // Add the number2 Label object to the view
    [self.view addSubview:_num2Label];
    
    // Create the UItextfield for the answer to go in and set it's frame
    //UITextField *answerField = [[UITextField alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 35,([UIScreen mainScreen].bounds.size.height/2) - 50, 70, 40)];
    _answerField.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];
    _answerField.backgroundColor=[UIColor whiteColor];
    _answerField.placeholder = @"answer";
    //centers the answerField
    [_answerField setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:_answerField];
    [_answerField.layer setCornerRadius:14.0f];
    _answerField.keyboardType = UIKeyboardTypeNumberPad;
    
    //creates the toolbar that has the enter button on it
    numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Enter" style:UIBarButtonItemStyleDone target:self action:@selector(enterButtonAnswerCheck)],
                           nil];
    [numberToolbar sizeToFit];
    _answerField.inputAccessoryView = numberToolbar;
    
    //makes the number pad appear
    [_answerField becomeFirstResponder];
    
    
    //starts the countdown
    timeLeft = _timeLeftForGameMode;
    
    levelTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    
    // Create the timeLeftLabel object and set it's frame
    _timeLeftLabel.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:1.0];
    [_timeLeftLabel setFont:[UIFont fontWithName:@"Arial" size:25]];
    // Set the text property of the timeLeftLabel
    _timeLeftLabel.text = [NSString stringWithFormat:@"%.02f", timeLeft];
    [_timeLeftLabel setTextAlignment:NSTextAlignmentCenter];
    // Add the timeLeftLabel object to the view
    [self.view addSubview:_timeLeftLabel];
    
    //creates pause menu button
    pauseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [pauseButton addTarget:self
                    action:@selector(pauseGame)
          forControlEvents:UIControlEventTouchUpInside];
    [pauseButton setImage:[UIImage imageNamed:@"Pause Button.png"] forState:UIControlStateNormal];
    pauseButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 15, 20, 30, 30);
    [self.view addSubview:pauseButton];
    
    pauseOn = false;
    
    //creates pause menu balck screen (but the opacity is 0)
    _backgroundImage.image = [UIImage imageNamed:@"black.png"];
    _backgroundImage.alpha = 0;
    
    //iphone 4 support
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    if (screenRect.size.height == 568){
        //iphone 5
    } else {
        //iphone 4 or other
        //this sets up the differences for the iphone 4 screen size
        
        CGRect frame = _num1Label.frame;
        frame.origin.y= _num1Label.frame.origin.y - 66; //pass the cordinate which you want
        frame.origin.x= _num1Label.frame.origin.x; //pass the cordinate which you want
        _num1Label.frame = frame;
        
        frame = _num2Label.frame;
        frame.origin.y= _num2Label.frame.origin.y - 66; //pass the cordinate which you want
        frame.origin.x= _num2Label.frame.origin.x; //pass the cordinate which you want
        _num2Label.frame = frame;
        
        frame = _answerField.frame;
        frame.origin.y= _answerField.frame.origin.y - 66; //pass the cordinate which you want
        frame.origin.x= _answerField.frame.origin.x; //pass the cordinate which you want
        _answerField.frame = frame;
        
        frame = _timeLeftLabel.frame;
        frame.origin.y= 15; //pass the cordinate which you want
        frame.origin.x= 15; //pass the cordinate which you want
        _timeLeftLabel.frame = frame;
        [_timeLeftLabel setTextAlignment:NSTextAlignmentLeft];
        
        frame = _scoreLabel.frame;
        frame.origin.y= 15; //pass the cordinate which you want
        frame.origin.x= _scoreLabel.frame.origin.x ; //pass the cordinate which you want
        _scoreLabel.frame = frame;
        
        frame = pauseButton.frame;
        frame.origin.y= pauseButton.frame.origin.y - 8 ; //pass the cordinate which you want
        frame.origin.x= pauseButton.frame.origin.x - 1 ; //pass the cordinate which you want
        pauseButton.frame = frame;

    }

}

-(void)enterButtonAnswerCheck{ // what happens when the answer button is pressed
    
    if (answer == _answerField.text.intValue ) { // activated if the answer submitted was correct
        
        //plays the ding sound and stop the other sound that was playing
        dingAudio.currentTime = 0;
        [dingAudio play];
        
        //annimates the tick, making it fade in and out
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 50, ([UIScreen mainScreen].bounds.size.height/16)*5 - 50, 100, 100)];
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
        
        if ([_GameType  isEqual: @"normal"]) {
            
            if ([_TimeType  isEqual: @"1Min"]) {
                scoreNormal1Min = scoreNormal1Min + 1;
            } else if ([_TimeType  isEqual: @"2Min"]) {
                scoreNormal2Min = scoreNormal2Min + 1;
            }else if ([_TimeType  isEqual: @"3Min"]) {
                scoreNormal3Min = scoreNormal3Min + 1;
            }
            
        } else if ([_GameType  isEqual: @"plus"]) {
            
            if ([_TimeType  isEqual: @"1Min"]) {
                scorePlus1Min = scorePlus1Min + 1;
            } else if ([_TimeType  isEqual: @"2Min"]) {
                scorePlus2Min = scorePlus2Min + 1;
            }else if ([_TimeType  isEqual: @"3Min"]) {
                scorePlus3Min = scorePlus3Min + 1;
            }
            
        } else if ([_GameType  isEqual: @"minus"]) {
            
            if ([_TimeType  isEqual: @"1Min"]) {
                scoreMinus1Min = scoreMinus1Min + 1;
            } else if ([_TimeType  isEqual: @"2Min"]) {
                scoreMinus2Min = scoreMinus2Min + 1;
            }else if ([_TimeType  isEqual: @"3Min"]) {
                scoreMinus3Min = scoreMinus3Min + 1;
            }
            
        } else if ([_GameType  isEqual: @"times"]) {
            
            if ([_TimeType  isEqual: @"1Min"]) {
                scoreTimes1Min = scoreTimes1Min + 1;
            } else if ([_TimeType  isEqual: @"2Min"]) {
                scoreTimes2Min = scoreTimes2Min + 1;
            }else if ([_TimeType  isEqual: @"3Min"]) {
                scoreTimes3Min = scoreTimes3Min + 1;
            }
            
        } else if ([_GameType  isEqual: @"divide"]) {
            
            if ([_TimeType  isEqual: @"1Min"]) {
                scoreDivide1Min = scoreDivide1Min + 1;
            } else if ([_TimeType  isEqual: @"2Min"]) {
                scoreDivide2Min = scoreDivide2Min + 1;
            }else if ([_TimeType  isEqual: @"3Min"]) {
                scoreDivide3Min = scoreDivide3Min + 1;
            }
            
        }
        
    } else if ([_answerField.text  isEqual: @""]){ // if no number were entered nothing will happen
        return;
    
    } else { // answer was wrong is else is activated
        
        //plays the buzzer sound and stop the other sound that was playing
        buzzerAudio.currentTime = 0;
        [buzzerAudio play];
    
        //annimates the cross, making it fade in and out
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 50, ([UIScreen mainScreen].bounds.size.height/16)*5 - 50, 100, 100)];
        imageView.contentMode = UIViewContentModeCenter;
        imageView.image = [UIImage imageNamed:@"Cross.png"];
        imageView.alpha = 0;
        [self.view addSubview:imageView];
        [UIView animateWithDuration:0.5
                            animations:^{
                                imageView.alpha = 1;    // fade in
                             }
                             completion:^(BOOL finished){   // code to run when animation completes
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

    _answerField.text = @"";
    
    
    if ([_GameType  isEqual: @"normal"]) { //do normall stuff
        
        operationSign = arc4random_uniform(4) + 1;

        if (operationSign == 1) { // plus is 1
            [self operation1Plus];
        } else if (operationSign == 2) { // minus is 2
            [self operation2Minus];
        } else if (operationSign == 3) { // times is 3
            [self operation3Times];
        } else if (operationSign == 4) { // divide is 4
            [self operation4Divide];
        } else {
        }
        
    } else if ([_GameType  isEqual: @"plus"]) {
        
        [self operation1Plus];
        
    } else if ([_GameType  isEqual: @"minus"]) {
        
        [self operation2Minus];
        
    }else if ([_GameType  isEqual: @"times"]) {
        
        [self operation3Times];
        
    }else if ([_GameType  isEqual: @"divide"]) {
        
        [self operation4Divide];
        
    }

        // sets the label to the new numbers created so that what you see
        // on the screen is whats being calculated
    
    if ([_GameType  isEqual: @"normal"]) {
        
        if ([_TimeType  isEqual: @"1Min"]) {
            _scoreLabel.text = [NSString stringWithFormat:@"%d", scoreNormal1Min];
        } else if ([_TimeType  isEqual: @"2Min"]) {
            _scoreLabel.text = [NSString stringWithFormat:@"%d", scoreNormal2Min];
        }else if ([_TimeType  isEqual: @"3Min"]) {
            _scoreLabel.text = [NSString stringWithFormat:@"%d", scoreNormal3Min];
        }
        
    } else if ([_GameType  isEqual: @"plus"]) {
        
        if ([_TimeType  isEqual: @"1Min"]) {
            _scoreLabel.text = [NSString stringWithFormat:@"%d", scorePlus1Min];
        } else if ([_TimeType  isEqual: @"2Min"]) {
            _scoreLabel.text = [NSString stringWithFormat:@"%d", scorePlus2Min];
        }else if ([_TimeType  isEqual: @"3Min"]) {
            _scoreLabel.text = [NSString stringWithFormat:@"%d", scorePlus3Min];
        }
        
    } else if ([_GameType  isEqual: @"minus"]) {
        
        if ([_TimeType  isEqual: @"1Min"]) {
            _scoreLabel.text = [NSString stringWithFormat:@"%d", scoreMinus1Min];
        } else if ([_TimeType  isEqual: @"2Min"]) {
            _scoreLabel.text = [NSString stringWithFormat:@"%d", scoreMinus2Min];
        }else if ([_TimeType  isEqual: @"3Min"]) {
            _scoreLabel.text = [NSString stringWithFormat:@"%d", scoreMinus3Min];
        }
        
    } else if ([_GameType  isEqual: @"times"]) {
        
        if ([_TimeType  isEqual: @"1Min"]) {
            _scoreLabel.text = [NSString stringWithFormat:@"%d", scoreTimes1Min];
        } else if ([_TimeType  isEqual: @"2Min"]) {
            _scoreLabel.text = [NSString stringWithFormat:@"%d", scoreTimes2Min];
        }else if ([_TimeType  isEqual: @"3Min"]) {
            _scoreLabel.text = [NSString stringWithFormat:@"%d", scoreTimes3Min];
        }
        
    } else if ([_GameType  isEqual: @"divide"]) {
        
        if ([_TimeType  isEqual: @"1Min"]) {
        _scoreLabel.text = [NSString stringWithFormat:@"%d", scoreDivide1Min];
        } else if ([_TimeType  isEqual: @"2Min"]) {
            _scoreLabel.text = [NSString stringWithFormat:@"%d", scoreDivide2Min];
        }else if ([_TimeType  isEqual: @"3Min"]) {
            _scoreLabel.text = [NSString stringWithFormat:@"%d", scoreDivide3Min];
        }
        
    }
    _num1Label.text = [NSString stringWithFormat:@"%d", num1];
    _num2Label.text = [NSString stringWithFormat:@"%d", num2];
    
}

-(void)operation1Plus{
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    if (screenRect.size.height == 568){
        _operationImage.image = [UIImage imageNamed:@"Plus.png"];
    } else {
        _operationImage.image = [UIImage imageNamed:@"Plus-iPhone4.png"];
    }
    
    
    range = 50;
    int random1 = (arc4random() % range);
    int random2 = (arc4random() % range);
    
    num1 = random1;
    num2 = random2;
    answer = num1 + num2;
    
    //NSLog(@"plus");

    
}

-(void)operation2Minus{
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    if (screenRect.size.height == 568){
        _operationImage.image = [UIImage imageNamed:@"Minus.png"];
    } else {
        _operationImage.image = [UIImage imageNamed:@"Minus-iPhone4.png"];
    }
    
    range = 50;
    int random1 = (arc4random() % range);
    int random2 = (arc4random() % range);
    
    if (random1 >= random2) {
        num1 = random1;
        num2 = random2;
        answer = num1 - num2;
    } else {
        num1 = random2;
        num2 = random1;
        
        answer = num1 - num2;
    }
}

-(void)operation3Times{
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    if (screenRect.size.height == 568){
        _operationImage.image = [UIImage imageNamed:@"Times.png"];
    } else {
        _operationImage.image = [UIImage imageNamed:@"Times-iPhone4.png"];
    }
    
    
    range = 13;
    int random1 = (arc4random() % range);
    int random2 = (arc4random() % range);
    
    num1 = random1;
    num2 = random2;
    answer = num1 * num2;
}

-(void)operation4Divide{
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    if (screenRect.size.height == 568){
        _operationImage.image = [UIImage imageNamed:@"Divide.png"];
    } else {
        _operationImage.image = [UIImage imageNamed:@"Divide-iPhone4.png"];
    }
    
    
    range = 12;
    
    int random1 = (arc4random() % range) + 1;
    int random2 = (arc4random() % range) + 1;
    
    // num1/num2 = answer
    answer = random1;
    num2 = random2;
    num1 = num2 * answer;
    
}

-(void)countDown {
    
    if (pauseOn == true) {
        
    }else {
        
        if (timeLeft <= 0.00) {
            [levelTimer invalidate];
            [self endGame];
            return;
        
        
        } else {
            if (timeLeft <=3.01){
                _timeLeftLabel.textColor = [UIColor colorWithRed:255 green:0 blue:0 alpha:1.0];
                _timeLeftLabel.layer.shadowColor = [[UIColor blackColor] CGColor];
                _timeLeftLabel.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
                _timeLeftLabel.layer.shadowOpacity = 1.0f;
                _timeLeftLabel.layer.shadowRadius = 1.5f;
            }
    
            timeLeft = timeLeft - 0.01;
            minutesLeft = timeLeft / 60;
            secondsLeft = timeLeft - (minutesLeft*60);
            if (minutesLeft == 0) {
                _timeLeftLabel.text =  [NSString stringWithFormat:@"%02.02f", secondsLeft];
            }else if (secondsLeft < 10) {
                _timeLeftLabel.text =  [NSString stringWithFormat:@"%i:0%02.02f", minutesLeft, secondsLeft];
            }else {
                _timeLeftLabel.text =  [NSString stringWithFormat:@"%i:%02.02f", minutesLeft, secondsLeft];
            }
        }
    }
}

- (void)hideMainStuff {
    
    [_timeLeftLabel setHidden:YES];
    [_scoreLabel setHidden:YES];
    [_num1Label setHidden:YES];
    [_num2Label setHidden:YES];
    [_answerField setHidden:YES];
    [pauseButton setHidden:YES];
    [self.view endEditing:YES];
    
}

-(void)endGame {
    
    //hide all stuff on screen and create highscore stuff
    [self hideMainStuff];
    
    returnToMenuButton.hidden = NO;

    _backgroundImage.image = [UIImage imageNamed:@"Black.png"];
    _backgroundImage.alpha = 0.75;
    
    // Create the Game Over label and set it's frame
    gameOverLabel = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 150, [UIScreen mainScreen].bounds.size.height/7, 300, 50)];
    gameOverLabel.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:1.0];
    [gameOverLabel setFont:[UIFont fontWithName:@"Arial" size:50]];
    // Set the text property of the Game Over label
    gameOverLabel.text = [NSString stringWithFormat:@"Game Over"];
    [gameOverLabel setTextAlignment:NSTextAlignmentCenter];
    // Add the Game Over label object to the view
    [self.view addSubview:gameOverLabel];
    
    //creates the play again button
    playAgainButton = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 150, [UIScreen mainScreen].bounds.size.height/7 + 100, 300, 50)];
    [playAgainButton addTarget:self
                      action:@selector(playAgain)
            forControlEvents:UIControlEventTouchUpInside];
    playAgainButton.tintColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:1.0];
    playAgainButton.titleLabel.font = [UIFont fontWithName:@"Arial" size:50];
    // Set the text property of the play Again button
    [playAgainButton setTitle:[NSString stringWithFormat:@"Play Again"] forState:UIControlStateNormal];
    playAgainButton.titleLabel.textAlignment = UITextAlignmentCenter;
    [playAgainButton setBackgroundImage:[UIImage imageNamed:@"ButtonTemplate.png"]
                             forState:UIControlStateNormal];
    // Add the play Again button object to the view
    [self.view addSubview:playAgainButton];
    
    // Create the Game Over Score label and set it's frame
    gameOverScoreLabel = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 150, [UIScreen mainScreen].bounds.size.height/7 + 200, 300, 50)];
    gameOverScoreLabel.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:1.0];
    [gameOverScoreLabel setFont:[UIFont fontWithName:@"Arial" size:50]];
    
    // Set the text property of the gameOverScoreLabel
    if ([_GameType  isEqual: @"normal"]) {
        
        if ([_TimeType  isEqual: @"1Min"]) {
            gameOverScoreLabel.text = [NSString stringWithFormat:@"Score: %d",scoreNormal1Min];
        } else if ([_TimeType  isEqual: @"2Min"]) {
            gameOverScoreLabel.text = [NSString stringWithFormat:@"Score: %d",scoreNormal2Min];
        }else if ([_TimeType  isEqual: @"3Min"]) {
            gameOverScoreLabel.text = [NSString stringWithFormat:@"Score: %d",scoreNormal3Min];
        }
        
    } else if ([_GameType  isEqual: @"plus"]) {
        
        if ([_TimeType  isEqual: @"1Min"]) {
            gameOverScoreLabel.text = [NSString stringWithFormat:@"Score: %d",scorePlus1Min];
        } else if ([_TimeType  isEqual: @"2Min"]) {
            gameOverScoreLabel.text = [NSString stringWithFormat:@"Score: %d",scorePlus2Min];
        }else if ([_TimeType  isEqual: @"3Min"]) {
            gameOverScoreLabel.text = [NSString stringWithFormat:@"Score: %d",scorePlus3Min];
        }
        
    } else if ([_GameType  isEqual: @"minus"]) {
        
        if ([_TimeType  isEqual: @"1Min"]) {
            gameOverScoreLabel.text = [NSString stringWithFormat:@"Score: %d",scoreMinus1Min];
        } else if ([_TimeType  isEqual: @"2Min"]) {
            gameOverScoreLabel.text = [NSString stringWithFormat:@"Score: %d",scoreMinus2Min];
        }else if ([_TimeType  isEqual: @"3Min"]) {
            gameOverScoreLabel.text = [NSString stringWithFormat:@"Score: %d",scoreMinus3Min];
        }
        
    } else if ([_GameType  isEqual: @"times"]) {
        
        if ([_TimeType  isEqual: @"1Min"]) {
            gameOverScoreLabel.text = [NSString stringWithFormat:@"Score: %d",scoreTimes1Min];
        } else if ([_TimeType  isEqual: @"2Min"]) {
            gameOverScoreLabel.text = [NSString stringWithFormat:@"Score: %d",scoreTimes2Min];
        }else if ([_TimeType  isEqual: @"3Min"]) {
            gameOverScoreLabel.text = [NSString stringWithFormat:@"Score: %d",scoreTimes3Min];
        }
        
    } else if ([_GameType  isEqual: @"divide"]) {
        
        if ([_TimeType  isEqual: @"1Min"]) {
            gameOverScoreLabel.text = [NSString stringWithFormat:@"Score: %d",scoreDivide1Min];
        } else if ([_TimeType  isEqual: @"2Min"]) {
            gameOverScoreLabel.text = [NSString stringWithFormat:@"Score: %d",scoreDivide2Min];
        }else if ([_TimeType  isEqual: @"3Min"]) {
            gameOverScoreLabel.text = [NSString stringWithFormat:@"Score: %d",scoreDivide3Min];
        }
        
    }
    [gameOverScoreLabel setTextAlignment:NSTextAlignmentCenter];
    
    // Add the gameOverScoreLabel object to the view
    [self.view addSubview:gameOverScoreLabel];
    
    //gamecenter stuff
    [self reportScore];
    
    leaderboardButton.hidden = NO;
    
}

- (IBAction)pauseButton:(UIButton *)sender {
    
    [self pauseGame];
    
}
- (void)pauseGame {
 
        [self hideMainStuff];
    
        returnToMenuButton.hidden = NO;

        _backgroundImage.image = [UIImage imageNamed:@"Black.png"];
        _backgroundImage.alpha = 0.5;
        pauseOn = true;
    
        unpauseButton = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 150, [UIScreen mainScreen].bounds.size.height/7, 300, 50)];
        [unpauseButton addTarget:self
                        action:@selector(unPause)
              forControlEvents:UIControlEventTouchUpInside];
        unpauseButton.tintColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:1.0];
        unpauseButton.titleLabel.font = [UIFont fontWithName:@"Arial" size:50];
        // Set the text property of the resume button
        [unpauseButton setTitle:[NSString stringWithFormat:@"Resume"] forState:UIControlStateNormal];
        unpauseButton.titleLabel.textAlignment = UITextAlignmentCenter;
        [unpauseButton setBackgroundImage:[UIImage imageNamed:@"ButtonTemplate.png"]
                             forState:UIControlStateNormal];
        // Add the timeLeftLabel object to the view
        [self.view addSubview:unpauseButton];
    
        //creates the play again button
        playAgainButton = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 150, [UIScreen mainScreen].bounds.size.height/7 + 100, 300, 50)];
        [playAgainButton addTarget:self
                        action:@selector(playAgain)
              forControlEvents:UIControlEventTouchUpInside];
        playAgainButton.tintColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:1.0];
        playAgainButton.titleLabel.font = [UIFont fontWithName:@"Arial" size:50];
        // Set the text property of the play Again button
        [playAgainButton setTitle:[NSString stringWithFormat:@"Reset Game"] forState:UIControlStateNormal];
        playAgainButton.titleLabel.textAlignment = UITextAlignmentCenter;
        [playAgainButton setBackgroundImage:[UIImage imageNamed:@"ButtonTemplate.png"]
                               forState:UIControlStateNormal];
        // Add the play Again button object to the view
        [self.view addSubview:playAgainButton];
    
}

- (void) unPause {
    
    [_timeLeftLabel setHidden:NO];
    [_scoreLabel setHidden:NO];
    [_num1Label setHidden:NO];
    [_num2Label setHidden:NO];
    [_answerField setHidden:NO];
    [pauseButton setHidden:NO];
    returnToMenuButton.hidden = YES;
    leaderboardButton.hidden = YES;

    [_answerField becomeFirstResponder];
    
    //similar to [hidePauseAndGameOverStuff]
    [playAgainButton setHidden:YES];
    [unpauseButton setHidden:YES];
    
    pauseOn = false;
    _backgroundImage.alpha = 0;
    
    //[self hidePauseAdGameOverStuff];
    
}
- (void) playAgain {
    
    [self hidePauseAndGameOverStuff];
    pauseOn = false;
    resetGame = true;
    
    _timeLeftLabel.layer.shadowOpacity = 0.0f;
    _timeLeftLabel.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:1.0];
    
    [levelTimer invalidate];
    [self isThisAResetGame];
}

- (void) hidePauseAndGameOverStuff {
    
    [gameOverLabel setHidden:YES];
    [gameOverScoreLabel setHidden:YES];
    [playAgainButton setHidden:YES];
    [unpauseButton setHidden:YES];
    [pauseButton setHidden:YES];
    _backgroundImage.alpha = 0;
    returnToMenuButton.hidden = YES;
    leaderboardButton.hidden = YES;
    

}

//gamecenter stuff
-(void)reportScore{
    
   //create the page that has the highscore on it
    gameCenterController = [[GKGameCenterViewController alloc] init];
    
    if ([_GameType  isEqual: @"normal"]) {
        
        if ([_TimeType  isEqual: @"1Min"]) {
            
            GKScore *scoreReporter = [[GKScore alloc] initWithCategory:@"MyMathsMixed1Min"];
            scoreReporter.value = scoreNormal1Min;
            
            [scoreReporter reportScoreWithCompletionHandler:^(NSError *error) {
                
                if (error != nil) {
                    // handle the reporting error
                    NSLog(@"error reporting score");
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Game Center Connection"
                                                                    message:@"Highscores were not saved."
                                                                   delegate:nil
                                                          cancelButtonTitle:@"OK"
                                                          otherButtonTitles:nil];
                    [alert show];
                }
                
                if (gameCenterController != nil) {
                    gameCenterController.gameCenterDelegate = self;
                    gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
                    gameCenterController.leaderboardIdentifier = @"MyMathsDivision1Min";
                    
                    //[self presentViewController: gameCenterController animated: YES completion:nil];
                }

                
            }];
            
        } else if ([_TimeType  isEqual: @"2Min"]) {
            
            GKScore *scoreReporter = [[GKScore alloc] initWithCategory:@"MyMathsMixed2Min"];
            scoreReporter.value = scoreNormal2Min;
            
            [scoreReporter reportScoreWithCompletionHandler:^(NSError *error) {
                
                if (error != nil) {
                    // handle the reporting error
                    NSLog(@"error reporting score");
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Game Center Connection"
                                                                    message:@"Highscores were not saved."
                                                                   delegate:nil
                                                          cancelButtonTitle:@"OK"
                                                          otherButtonTitles:nil];
                    [alert show];

                }
                
                if (gameCenterController != nil) {
                    gameCenterController.gameCenterDelegate = self;
                    gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
                    gameCenterController.leaderboardIdentifier = @"MyMathsDivision1Min";
                    
                    //[self presentViewController: gameCenterController animated: YES completion:nil];
                }

            }];
            
        }else if ([_TimeType  isEqual: @"3Min"]) {
            
            GKScore *scoreReporter = [[GKScore alloc] initWithCategory:@"MyMathsMixed3Min"];
            scoreReporter.value = scoreNormal3Min;
            
            [scoreReporter reportScoreWithCompletionHandler:^(NSError *error) {
                
                if (error != nil) {
                    // handle the reporting error
                    NSLog(@"error reporting score");
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Game Center Connection"
                                                                    message:@"Highscores were not saved."
                                                                   delegate:nil
                                                          cancelButtonTitle:@"OK"
                                                          otherButtonTitles:nil];
                    [alert show];

                }
                
                if (gameCenterController != nil) {
                    gameCenterController.gameCenterDelegate = self;
                    gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
                    gameCenterController.leaderboardIdentifier = @"MyMathsDivision1Min";
                    
                    //[self presentViewController: gameCenterController animated: YES completion:nil];
                }

                
            }];
            
        }
        
    } else if ([_GameType  isEqual: @"plus"]) {
        
        if ([_TimeType  isEqual: @"1Min"]) {
            
            GKScore *scoreReporter = [[GKScore alloc] initWithCategory:@"MyMathsAddition1Min"];
            scoreReporter.value = scorePlus1Min;
            
            [scoreReporter reportScoreWithCompletionHandler:^(NSError *error) {
                
                if (error != nil) {
                    // handle the reporting error
                    NSLog(@"error reporting score");
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Game Center Connection"
                                                                    message:@"Highscores were not saved."
                                                                   delegate:nil
                                                          cancelButtonTitle:@"OK"
                                                          otherButtonTitles:nil];
                    [alert show];

                }
                
                if (gameCenterController != nil) {
                    gameCenterController.gameCenterDelegate = self;
                    gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
                    gameCenterController.leaderboardIdentifier = @"MyMathsAddition1Min";
                    
                    //[self presentViewController: gameCenterController animated: YES completion:nil];
                }

                
            }];
            
            
            
        } else if ([_TimeType  isEqual: @"2Min"]) {
            
            GKScore *scoreReporter = [[GKScore alloc] initWithCategory:@"MyMathsAddition2Min"];
            scoreReporter.value = scorePlus2Min;
            
            [scoreReporter reportScoreWithCompletionHandler:^(NSError *error) {
                
                if (error != nil) {
                    // handle the reporting error
                    NSLog(@"error reporting score");
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Game Center Connection"
                                                                    message:@"Highscores were not saved."
                                                                   delegate:nil
                                                          cancelButtonTitle:@"OK"
                                                          otherButtonTitles:nil];
                    [alert show];

                }
                
                if (gameCenterController != nil) {
                    gameCenterController.gameCenterDelegate = self;
                    gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
                    gameCenterController.leaderboardIdentifier = @"MyMathsAddition2Min";
                    
                    //[self presentViewController: gameCenterController animated: YES completion:nil];
                }

                
            }];
            
        }else if ([_TimeType  isEqual: @"3Min"]) {
            
            GKScore *scoreReporter = [[GKScore alloc] initWithCategory:@"MyMathsAddition3Min"];
            scoreReporter.value = scorePlus3Min;
            
            [scoreReporter reportScoreWithCompletionHandler:^(NSError *error) {
                
                if (error != nil) {
                    // handle the reporting error
                    NSLog(@"error reporting score");
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Game Center Connection"
                                                                    message:@"Highscores were not saved."
                                                                   delegate:nil
                                                          cancelButtonTitle:@"OK"
                                                          otherButtonTitles:nil];
                    [alert show];

                }
                
                if (gameCenterController != nil) {
                    gameCenterController.gameCenterDelegate = self;
                    gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
                    gameCenterController.leaderboardIdentifier = @"MyMathsAddition3Min";
                    
                    //[self presentViewController: gameCenterController animated: YES completion:nil];
                }

                
            }];
          
        }
        
    } else if ([_GameType  isEqual: @"minus"]) {
        
        if ([_TimeType  isEqual: @"1Min"]) {
            
            GKScore *scoreReporter = [[GKScore alloc] initWithCategory:@"MyMathsMinus1Min"];
            scoreReporter.value = scoreMinus1Min;
            
            [scoreReporter reportScoreWithCompletionHandler:^(NSError *error) {
                
                if (error != nil) {
                    // handle the reporting error
                    NSLog(@"error reporting score");
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Game Center Connection"
                                                                    message:@"Highscores were not saved."
                                                                   delegate:nil
                                                          cancelButtonTitle:@"OK"
                                                          otherButtonTitles:nil];
                    [alert show];

                }
                
                if (gameCenterController != nil) {
                    gameCenterController.gameCenterDelegate = self;
                    gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
                    gameCenterController.leaderboardIdentifier = @"MyMathsMinus1Min";
                    
                    //[self presentViewController: gameCenterController animated: YES completion:nil];
                }

                
            }];
            
        } else if ([_TimeType  isEqual: @"2Min"]) {
            
            GKScore *scoreReporter = [[GKScore alloc] initWithCategory:@"MyMathsMinus2Min"];
            scoreReporter.value = scoreMinus2Min;
            
            [scoreReporter reportScoreWithCompletionHandler:^(NSError *error) {
                
                if (error != nil) {
                    // handle the reporting error
                    NSLog(@"error reporting score");
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Game Center Connection"
                                                                    message:@"Highscores were not saved."
                                                                   delegate:nil
                                                          cancelButtonTitle:@"OK"
                                                          otherButtonTitles:nil];
                    [alert show];

                }
                
                if (gameCenterController != nil) {
                    gameCenterController.gameCenterDelegate = self;
                    gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
                    gameCenterController.leaderboardIdentifier = @"MyMathsMinus2Min";
                    
                    //[self presentViewController: gameCenterController animated: YES completion:nil];
                }

                
            }];
            
        }else if ([_TimeType  isEqual: @"3Min"]) {
            
            GKScore *scoreReporter = [[GKScore alloc] initWithCategory:@"MyMathsMinus3Min"];
            scoreReporter.value = scoreMinus3Min;
            
            [scoreReporter reportScoreWithCompletionHandler:^(NSError *error) {
                
                if (error != nil) {
                    // handle the reporting error
                    NSLog(@"error reporting score");
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Game Center Connection"
                                                                    message:@"Highscores were not saved."
                                                                   delegate:nil
                                                          cancelButtonTitle:@"OK"
                                                          otherButtonTitles:nil];
                    [alert show];

                }
                
                if (gameCenterController != nil) {
                    gameCenterController.gameCenterDelegate = self;
                    gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
                    gameCenterController.leaderboardIdentifier = @"MyMathsMinus3Min";
                    
                    //[self presentViewController: gameCenterController animated: YES completion:nil];
                }

                
            }];
            
        }
        
    } else if ([_GameType  isEqual: @"times"]) {
        
        if ([_TimeType  isEqual: @"1Min"]) {
            
            GKScore *scoreReporter = [[GKScore alloc] initWithCategory:@"MyMathsMultiplication1Min"];
            scoreReporter.value = scoreTimes1Min;
            
            [scoreReporter reportScoreWithCompletionHandler:^(NSError *error) {
                
                if (error != nil) {
                    // handle the reporting error
                    NSLog(@"error reporting score");
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Game Center Connection"
                                                                    message:@"Highscores were not saved."
                                                                   delegate:nil
                                                          cancelButtonTitle:@"OK"
                                                          otherButtonTitles:nil];
                    [alert show];

                }
                
                if (gameCenterController != nil) {
                    gameCenterController.gameCenterDelegate = self;
                    gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
                    gameCenterController.leaderboardIdentifier = @"MyMathsMultiplication1Min";
                    
                    //[self presentViewController: gameCenterController animated: YES completion:nil];
                }

                
            }];
            
        } else if ([_TimeType  isEqual: @"2Min"]) {
            
            GKScore *scoreReporter = [[GKScore alloc] initWithCategory:@"MyMathsMultiplication2Min"];
            scoreReporter.value = scoreTimes2Min;
            
            [scoreReporter reportScoreWithCompletionHandler:^(NSError *error) {
                
                if (error != nil) {
                    // handle the reporting error
                    NSLog(@"error reporting score");
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Game Center Connection"
                                                                    message:@"Highscores were not saved."
                                                                   delegate:nil
                                                          cancelButtonTitle:@"OK"
                                                          otherButtonTitles:nil];
                    [alert show];

                }
                
                if (gameCenterController != nil) {
                    gameCenterController.gameCenterDelegate = self;
                    gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
                    gameCenterController.leaderboardIdentifier = @"MyMathsMultiplication2Min";
                    
                    //[self presentViewController: gameCenterController animated: YES completion:nil];
                }

                
            }];
            
        }else if ([_TimeType  isEqual: @"3Min"]) {
            
            GKScore *scoreReporter = [[GKScore alloc] initWithCategory:@"MyMathsMultiplication3Min"];
            scoreReporter.value = scoreTimes3Min;
            
            [scoreReporter reportScoreWithCompletionHandler:^(NSError *error) {
                
                if (error != nil) {
                    // handle the reporting error
                    NSLog(@"error reporting score");
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Game Center Connection"
                                                                    message:@"Highscores were not saved."
                                                                   delegate:nil
                                                          cancelButtonTitle:@"OK"
                                                          otherButtonTitles:nil];
                    [alert show];

                }
                
                if (gameCenterController != nil) {
                    gameCenterController.gameCenterDelegate = self;
                    gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
                    gameCenterController.leaderboardIdentifier = @"MyMathsMultiplication3Min";
                    
                    //[self presentViewController: gameCenterController animated: YES completion:nil];
                }

                
            }];
            
        }
        
    } else if ([_GameType  isEqual: @"divide"]) {
        
        if ([_TimeType  isEqual: @"1Min"]) {
            
            GKScore *scoreReporter = [[GKScore alloc] initWithCategory:@"MyMathsDivision1Min"];
            scoreReporter.value = scoreDivide1Min;
            
            [scoreReporter reportScoreWithCompletionHandler:^(NSError *error) {
                
                if (error != nil) {
                    // handle the reporting error
                    NSLog(@"error reporting score");
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Game Center Connection"
                                                                    message:@"Highscores were not saved."
                                                                   delegate:nil
                                                          cancelButtonTitle:@"OK"
                                                          otherButtonTitles:nil];
                    [alert show];

                }
                
                if (gameCenterController != nil) {
                    gameCenterController.gameCenterDelegate = self;
                    gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
                    gameCenterController.leaderboardIdentifier = @"MyMathsDivision1Min";
                    
                    //[self presentViewController: gameCenterController animated: YES completion:nil];
                }

                
            }];
            
        } else if ([_TimeType  isEqual: @"2Min"]) {
            
            GKScore *scoreReporter = [[GKScore alloc] initWithCategory:@"MyMathsDivision2Min"];
            scoreReporter.value = scoreDivide2Min;
            
            [scoreReporter reportScoreWithCompletionHandler:^(NSError *error) {
                
                if (error != nil) {
                    // handle the reporting error
                    NSLog(@"error reporting score");
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Game Center Connection"
                                                                    message:@"Highscores were not saved."
                                                                   delegate:nil
                                                          cancelButtonTitle:@"OK"
                                                          otherButtonTitles:nil];
                    [alert show];

                }
                
                if (gameCenterController != nil) {
                    gameCenterController.gameCenterDelegate = self;
                    gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
                    gameCenterController.leaderboardIdentifier = @"MyMathsDivision2Min";
                    
                    //[self presentViewController: gameCenterController animated: YES completion:nil];
                }

                
            }];
            
        }else if ([_TimeType  isEqual: @"3Min"]) {
            
            GKScore *scoreReporter = [[GKScore alloc] initWithCategory:@"MyMathsDivision3Min"];
            scoreReporter.value = scoreDivide3Min;
            
            [scoreReporter reportScoreWithCompletionHandler:^(NSError *error) {
                
                if (error != nil) {
                    // handle the reporting error
                    NSLog(@"error reporting score");
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Game Center Connection"
                                                                    message:@"Highscores were not saved."
                                                                   delegate:nil
                                                          cancelButtonTitle:@"OK"
                                                          otherButtonTitles:nil];
                    [alert show];

                }
                
                if (gameCenterController != nil) {
                    gameCenterController.gameCenterDelegate = self;
                    gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
                    gameCenterController.leaderboardIdentifier = @"MyMathsDivision3Min";
                    
                    //[self presentViewController: gameCenterController animated: YES completion:nil];
                }
                
                
            }];
           
            
        }

    }
    
    // Create leaderboard view with default Game Center style
    //leaderboardController = [[GKGameCenterViewController alloc] init];
    
    // If view controller was successfully created...
    //if (leaderboardController != nil) {
    // Leaderboard config
    //leaderboardController.leaderboardDelegate = self; // leaderboardController will send messages to this object
    //leaderboardController.leaderboardCategory = @"MyMathsDivision1Min";
    
    
    //Present the view controller
    //[self presentViewController:leaderboardController animated:YES completion:nil];
    
    //}
    
}

- (void)gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController
{
    [gameCenterViewController dismissViewControllerAnimated:YES completion:^{
        
    }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //[self.view endEditing:YES];
}

- (IBAction)leaderboardButton:(id)sender {
    
    [self presentViewController: gameCenterController animated: YES completion:nil];
    
}
@end
