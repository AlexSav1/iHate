//
//  WAMGameViewController.h
//  iHate
//
//  Created by Emiko Clark on 5/4/17.
//
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import "DAO.h"
#import "WAMScoreBoardViewController.h"

@interface WAMGameViewController : UIViewController

@property int howOftenHeadsPopUp;
@property (weak, nonatomic) IBOutlet UIImageView *bloodSplats;

@property DAO *dao;

@property int gameTime;
@property int currentGameTime;
@property NSTimer *timer1;
@property NSTimer *timer2;
@property NSTimer *timer3;

@property UIImage *currentVictim;

@property BOOL gameFinished;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIButton *button6;
@property (weak, nonatomic) IBOutlet UIButton *button7;
@property (weak, nonatomic) IBOutlet UIButton *button8;
@property (weak, nonatomic) IBOutlet UIButton *button9;
@property (weak, nonatomic) IBOutlet UIButton *button10;
@property (weak, nonatomic) IBOutlet UIButton *button11;
@property (weak, nonatomic) IBOutlet UIButton *button12;


@end
