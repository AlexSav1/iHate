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
    
    self.howOftenHeadsPopUp = arc4random_uniform(10);
    
    [NSTimer scheduledTimerWithTimeInterval:self.howOftenHeadsPopUp target:self selector:@selector(activateVictim) userInfo:nil repeats:YES];
}

-(void) activateVictim {
    
    self.howOftenHeadsPopUp = arc4random_uniform(10);
    
    //self.numberOfHeadsPoppingUp = arc4random_uniform(3);
    
    int whichHeadsPopUp = 0;
    
    switch (whichHeadsPopUp) {
        case 0:
            self.button1.hidden = NO;
            [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(turnButtonOff:) userInfo:self.button1 repeats:NO];
            break;
        case 1:
            self.button2.hidden = NO;
            break;
        case 2:
            self.button3.hidden = NO;
            break;
        case 3:
            self.button4.hidden = NO;
            break;
        case 4:
            self.button5.hidden = NO;
            break;
        case 5:
            self.button6.hidden = NO;
            break;
        case 6:
            self.button7.hidden = NO;
            break;
        case 7:
            self.button8.hidden = NO;
            break;
        case 8:
            self.button9.hidden = NO;
            break;
        case 9:
            self.button10.hidden = NO;
            break;
        case 10:
            self.button11.hidden = NO;
            break;
        case 11:
            self.button12.hidden = NO;
            break;
        default:
            break;
    }
}

-(void) turnButtonOff: (NSTimer*) timer {
    UIButton *button = timer.userInfo;
    button.hidden = YES;
}

- (IBAction)button1Pressed:(id)sender {
    
}
- (IBAction)button2Pressed:(id)sender {
    
}
- (IBAction)button3Pressed:(id)sender {
    
}
- (IBAction)button4Pressed:(id)sender {
    
}
- (IBAction)button5Pressed:(id)sender {
    
}
- (IBAction)button6Pressed:(id)sender {
    
}
- (IBAction)button7Pressed:(id)sender {
    
}
- (IBAction)button8Pressed:(id)sender {
    
}
- (IBAction)button9Pressed:(id)sender {
    
}
- (IBAction)button10Pressed:(id)sender {
    
}
- (IBAction)button11Pressed:(id)sender {
    
}
- (IBAction)button12Pressed:(id)sender {
    
}


@end
