//
//  CTViewController.m
//  ChessTimer
//
//  Created by Christian Idylle on 7/19/13.
//  Copyright (c) 2013 Christian Idylle. All rights reserved.
//

#import "CTViewController.h"

@interface CTViewController () {
    NSInteger _remainingTimeA;
    NSInteger _remainingTimeB;
    NSTimer *_timer;
    BOOL enabledA;
    BOOL enabledB;
}
@end

@implementation CTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.timerLabelA.transform = CGAffineTransformMakeRotation( M_PI );
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
        [self.timerLabelA setEnabled:NO];
        [self.timerLabelB setEnabled:YES];
        enabledA = NO;
        enabledB = YES;
        [self.timerLabelA setAlpha:0.33];
        [self.timerLabelB setAlpha:1.0];
    } else {
        [self.timerLabelA setEnabled:YES];
        [self.timerLabelB setEnabled:NO];
        enabledA = YES;
        enabledB = NO;
        [self.timerLabelB setAlpha:0.33];
        [self.timerLabelA setAlpha:1.0];
    }
}

- (IBAction)touchedTimerB:(id)sender {
    if (enabledB) {
        [self.timerLabelB setEnabled:NO];
        [self.timerLabelA setEnabled:YES];
        enabledB = NO;
        enabledA = YES;
        [self.timerLabelB setAlpha:0.33];
        [self.timerLabelA setAlpha:1.0];
        
    } else {
        [self.timerLabelB setEnabled:YES];
        [self.timerLabelA setEnabled:NO];
        enabledB = YES;
        enabledA = NO;
        [self.timerLabelA setAlpha:0.33];
        [self.timerLabelB setAlpha:1.0];
    }
}

- (void)substractTime {
    if (enabledA) {
        _remainingTimeA--;
        if (_remainingTimeA == 0)
        {
            [self pause:nil];
            [self.timerLabelA setEnabled:NO];
        }
        [self updateTime:A];
    }
    
    if (enabledB) {
        _remainingTimeB--;
        if (_remainingTimeB == 0)
        {
            [self pause:nil];
            [self.timerLabelB setEnabled:NO];
        }
        [self updateTime:B];
    }
}

- (IBAction)pause:(id)sender {
    enabledA = enabledB = NO;
    
}

- (IBAction)reset:(id)sender {
    enabledA = enabledB = NO;
    [self.timerLabelA setEnabled:YES];
    [self.timerLabelB setEnabled:YES];
    _remainingTimeA = _remainingTimeB = 6000;
    [self updateTime:A];
    [self updateTime:B];
    [self.timerLabelA setAlpha:1.0];
    [self.timerLabelB setAlpha:1.0];
}

- (void)updateTime: (TimerType)type {
    NSInteger time = type == A ? _remainingTimeA : _remainingTimeB;
    NSInteger minutes = time / 600;
    NSInteger seconds = (time/10) % 60;
    NSInteger milliseconds = time % 10;
    if (type == A)
    {
        [self.timerLabelA setTitle:[NSString stringWithFormat:@"%02d:%02d:%01d",minutes, seconds, milliseconds] forState:UIControlStateNormal];
    }
    else
    {
        [self.timerLabelB setTitle:[NSString stringWithFormat:@"%02d:%02d:%01d",minutes, seconds, milliseconds] forState:UIControlStateNormal];
   
    }
}


@end
