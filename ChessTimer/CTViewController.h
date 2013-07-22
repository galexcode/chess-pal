//
//  CTViewController.h
//  ChessTimer
//
//  Created by Christian Idylle on 7/19/13.
//  Copyright (c) 2013 Christian Idylle. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    A,
    B
}TimerType;

@interface CTViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *timerBtnA;
@property (weak, nonatomic) IBOutlet UIButton *timerBtnB;
- (void)updateTime: (TimerType)type;
@end
