//
//  ViewController.m
//  BullsEye
//
//  Created by Nikolay on 01.12.15.
//  Copyright © 2015 nut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    long _currentValue,_targetValue;
    int _score;
    int _round;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self startNewGame];
    [self updateLabels];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startNewRound {
    _round += 1;
    _targetValue = 1 + arc4random_uniform(100);
    _currentValue = 50;
    self.slider.value = _currentValue;
}

- (BOOL)prefersStatusBarHidden {
    return YES; }

- (IBAction)showAlert {
    int difference = abs(_targetValue - _currentValue);
    int points = 100 - difference;
    
    
    NSString *title;
    if (difference == 0) { title = @"Perfect!"; points += 100;
    } else if (difference < 5) {
        title = @"You almost had it!";
        
        if (difference == 1) {
            
            points += 50;}
        
    } else if (difference < 10) {
        title = @"Pretty good!";
    } else {
        title = @"Not even close...";
    }
    _score += points;
    
    NSString *message = [NSString stringWithFormat:@"You scored %d points", points];
    
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:title
                              message:message
                              delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
    [alertView show];
    
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self startNewRound]; [self updateLabels];
}

- (IBAction)startOver {
    [self startNewGame];
    [self updateLabels]; }

- (void)startNewGame {
    _score = 0;
    _round = 0;
    [self startNewRound];
}




- (void)updateLabels {
    self.targetLabel.text = [NSString stringWithFormat:@"%ld", _targetValue];
    
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", _score];
    
    self.roundLabel.text = [NSString stringWithFormat:@"%d", _round];
}

-(IBAction)sliderMoved:(UISlider *)slider{
    _currentValue = lroundf(slider.value);
}

@end
