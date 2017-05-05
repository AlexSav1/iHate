//
//  WAMGameViewController.m
//  iHate
//
//  Created by Emiko Clark on 5/4/17.
//
//

#import "WAMGameViewController.h"

@interface WAMGameViewController ()

@end

@implementation WAMGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dao = [DAO sharedDataManager];
    
//    [self.button1 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
//    [self.button2 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
//    [self.button3 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
//    [self.button4 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
//    [self.button5 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
//    [self.button6 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
//    [self.button7 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
//    [self.button8 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
//    [self.button9 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
//    [self.button10 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
//    [self.button11 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
//    [self.button12 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
    
    self.howOftenHeadsPopUp = arc4random_uniform(5);
    
    [NSTimer scheduledTimerWithTimeInterval:self.howOftenHeadsPopUp target:self selector:@selector(activateVictim) userInfo:nil repeats:YES];
}

-(void) activateVictim {
    
    self.howOftenHeadsPopUp = arc4random_uniform(5);
    
    //self.numberOfHeadsPoppingUp = arc4random_uniform(3);
    
    int whichHeadsPopUp = arc4random_uniform(12);
    
    switch (whichHeadsPopUp) {
        case 0:
            self.button1.hidden = NO;
            [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(turnButtonOff:) userInfo:self.button1 repeats:NO];
            break;
        case 1:
            self.button2.hidden = NO;
            [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(turnButtonOff:) userInfo:self.button2 repeats:NO];
            break;
        case 2:
            self.button3.hidden = NO;
            [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(turnButtonOff:) userInfo:self.button3 repeats:NO];
            break;
        case 3:
            self.button4.hidden = NO;
            [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(turnButtonOff:) userInfo:self.button4 repeats:NO];
            break;
        case 4:
            self.button5.hidden = NO;
            [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(turnButtonOff:) userInfo:self.button5 repeats:NO];
            break;
        case 5:
            self.button6.hidden = NO;
            [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(turnButtonOff:) userInfo:self.button6 repeats:NO];
            break;
        case 6:
            self.button7.hidden = NO;
            [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(turnButtonOff:) userInfo:self.button7 repeats:NO];
            break;
        case 7:
            self.button8.hidden = NO;
            [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(turnButtonOff:) userInfo:self.button8 repeats:NO];
            break;
        case 8:
            self.button9.hidden = NO;
            [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(turnButtonOff:) userInfo:self.button9 repeats:NO];
            break;
        case 9:
            self.button10.hidden = NO;
            [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(turnButtonOff:) userInfo:self.button10 repeats:NO];
            break;
        case 10:
            self.button11.hidden = NO;
            [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(turnButtonOff:) userInfo:self.button11 repeats:NO];
            break;
        case 11:
            self.button12.hidden = NO;
            [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(turnButtonOff:) userInfo:self.button12 repeats:NO];
            break;
        default:
            break;
    }
}

-(void) turnButtonOff: (NSTimer*) timer {
    UIButton *button = timer.userInfo;

    if(!button.hidden){
        button.hidden = YES;
    }
}

- (void) playHitSound {
    SystemSoundID audioEffect;
    NSString *path;
    int whichSound = arc4random_uniform(3);
    
    if (whichSound == 0) {
        path = [[NSBundle mainBundle] pathForResource : @"YouBetterBelieve" ofType :@"mp3"];
    } else {
        path = [[NSBundle mainBundle] pathForResource : @"Wrong" ofType :@"mp3"];
    }
    
    if ([[NSFileManager defaultManager] fileExistsAtPath : path]) {
        NSURL *pathURL = [NSURL fileURLWithPath: path];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef) pathURL, &audioEffect);
        AudioServicesPlaySystemSound(audioEffect);
    }
    else {
        NSLog(@"error, file not found: %@", path);
    }
    
}

//MARK: Button Actions
- (IBAction)button1Pressed:(id)sender {
    self.button1.hidden = YES;
    //[self playHitSound];
    self.dao.currentScore++;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
}
- (IBAction)button2Pressed:(id)sender {
    self.button2.hidden = YES;
    //[self playHitSound];
    self.dao.currentScore++;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
}
- (IBAction)button3Pressed:(id)sender {
    self.button3.hidden = YES;
    //[self playHitSound];
    self.dao.currentScore++;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
}
- (IBAction)button4Pressed:(id)sender {
    self.button4.hidden = YES;
    //[self playHitSound];
    self.dao.currentScore++;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
}
- (IBAction)button5Pressed:(id)sender {
    self.button5.hidden = YES;
    //[self playHitSound];
    self.dao.currentScore++;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
}
- (IBAction)button6Pressed:(id)sender {
    self.button6.hidden = YES;
    //[self playHitSound];
    self.dao.currentScore++;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
}
- (IBAction)button7Pressed:(id)sender {
    self.button7.hidden = YES;
    //[self playHitSound];
    self.dao.currentScore++;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
}
- (IBAction)button8Pressed:(id)sender {
    self.button8.hidden = YES;
    //[self playHitSound];
    self.dao.currentScore++;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
}
- (IBAction)button9Pressed:(id)sender {
    self.button9.hidden = YES;
    //[self playHitSound];
    self.dao.currentScore++;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
}
- (IBAction)button10Pressed:(id)sender {
    self.button10.hidden = YES;
    //[self playHitSound];
    self.dao.currentScore++;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
}
- (IBAction)button11Pressed:(id)sender {
    self.button11.hidden = YES;
    //[self playHitSound];
    self.dao.currentScore++;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
}
- (IBAction)button12Pressed:(id)sender {
    self.button12.hidden = YES;
    //[self playHitSound];
    self.dao.currentScore++;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
}


@end
