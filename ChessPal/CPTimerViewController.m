//
//  CTViewController.m
//  ChessTimer
//
//  Created by Christian Idylle on 7/19/13.
//  Copyright (c) 2013 Christian Idylle. All rights reserved.
//

#import "CPTimerViewController.h"

@interface CPTimerViewController () {
    NSInteger _remainingTimeA;
    NSInteger _remainingTimeB;
    NSTimer *_timer;
    BOOL enabledA;
    BOOL enabledB;
}
@end

@implementation CPTimerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.timerBtnA.transform = CGAffineTransformMakeRotation( M_PI );
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(substractTime) userInfo:nil repeats:YES];
    [self reset:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchedTimerA:(id)sender {
    if (enabledA) {
        [self.timerBtnA setEnabled:NO];
        [self.timerBtnB setEnabled:YES];
        enabledA = NO;
        enabledB = YES;
        [self.timerBtnA setAlpha:0.33];
        [self.timerBtnB setAlpha:1.0];
    } else {
        [self.timerBtnA setEnabled:YES];
        [self.timerBtnB setEnabled:NO];
        enabledA = YES;
        enabledB = NO;
        [self.timerBtnB setAlpha:0.33];
        [self.timerBtnA setAlpha:1.0];
    }
}

- (IBAction)touchedTimerB:(id)sender {
    if (enabledB) {
        [self.timerBtnB setEnabled:NO];
        [self.timerBtnA setEnabled:YES];
        enabledB = NO;
        enabledA = YES;
        [self.timerBtnB setAlpha:0.33];
        [self.timerBtnA setAlpha:1.0];
        
    } else {
        [self.timerBtnB setEnabled:YES];
        [self.timerBtnA setEnabled:NO];
        enabledB = YES;
        enabledA = NO;
        [self.timerBtnA setAlpha:0.33];
        [self.timerBtnB setAlpha:1.0];
    }
}

- (void)substractTime {
    if (enabledA) {
        _remainingTimeA--;
        if (_remainingTimeA == 0)
        {
            [self pause:nil];
            [self.timerBtnA setEnabled:NO];
        }
        [self updateTime:A];
    }
    
    if (enabledB) {
        _remainingTimeB--;
        if (_remainingTimeB == 0)
        {
            [self pause:nil];
            [self.timerBtnB setEnabled:NO];
        }
        [self updateTime:B];
    }
}

- (IBAction)pause:(id)sender {
    enabledA = enabledB = NO;
    
}

- (IBAction)reset:(id)sender {
    enabledA = enabledB = NO;
    [self.timerBtnA setEnabled:YES];
    [self.timerBtnB setEnabled:YES];
    _remainingTimeA = _remainingTimeB = 6000;
    [self updateTime:A];
    [self updateTime:B];
    [self.timerBtnA setAlpha:1.0];
    [self.timerBtnB setAlpha:1.0];
}

- (void)updateTime: (TimerType)type {
    NSInteger time = type == A ? _remainingTimeA : _remainingTimeB;
    NSInteger minutes = time / 600;
    NSInteger seconds = (time/10) % 60;
    NSInteger milliseconds = time % 10;
    if (type == A)
    {
        [self.timerBtnA setTitle:[NSString stringWithFormat:@"%02d:%02d:%01d",minutes, seconds, milliseconds] forState:UIControlStateNormal];
    }
    else
    {
        [self.timerBtnB setTitle:[NSString stringWithFormat:@"%02d:%02d:%01d",minutes, seconds, milliseconds] forState:UIControlStateNormal];
   
    }
}


@end
