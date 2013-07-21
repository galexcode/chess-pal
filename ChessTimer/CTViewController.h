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

@interface CTViewController : UIViewController{
    @private
    @public
    
}
@property (weak, nonatomic) IBOutlet UIButton *timerLabelA;
@property (weak, nonatomic) IBOutlet UIButton *timerLabelB;
- (void)updateTime: (TimerType)type;
@end
