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
    self.dao.currentBGSong = @"bgSound";
    [self.dao bgMusic];
    self.dao.currentVictim = self.currentVictim;

    self.gameTime = 15;
    self.currentGameTime = 15;
    self.gameFinished = FALSE;
    self.timeLabel.text = [NSString stringWithFormat:@":%d Secs", self.currentGameTime];
}

- (void) viewWillAppear:(BOOL)animated   {

    
    self.gameTime = 15;
    self.currentGameTime = 15;
    self.gameFinished = FALSE;
    self.timeLabel.text = [NSString stringWithFormat:@":%d Secs", self.currentGameTime];
    self.scoreLabel.text = @"0";

    
    if(self.currentVictim != nil){
        [self.button1 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
        [self.button2 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
        [self.button3 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
        [self.button4 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
        [self.button5 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
        [self.button6 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
        [self.button7 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
        [self.button8 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
        [self.button9 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
        [self.button10 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
        [self.button11 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
        [self.button12 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
    }
    
    
    self.howOftenHeadsPopUp = arc4random_uniform(5);
    
    self.timer1 = [NSTimer scheduledTimerWithTimeInterval:self.howOftenHeadsPopUp target:self selector:@selector(activateVictim) userInfo:nil repeats:YES];
    
    self.timer2 = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    
    self.timer3 = [NSTimer scheduledTimerWithTimeInterval:self.gameTime target:self selector:@selector(finishGame) userInfo:nil repeats:NO];
 
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear: animated];
    self.dao.currentBGSong = nil;
}

-(void) updateTime{
    self.currentGameTime--;
    self.timeLabel.text = [NSString stringWithFormat:@":%d Secs", self.currentGameTime];
}

-(void) finishGame {
    
    self.gameFinished = TRUE;

    [self displayMsg:[NSString stringWithFormat:@"Score:%i", self.dao.currentScore]];
    [self.timer1 invalidate];
    [self.timer2 invalidate];
    [self.timer3 invalidate];

}

- (void) displayMsg:(NSString *)msg
{
    // Initialize the controller for displaying the message
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@" " message:msg  preferredStyle:UIAlertControllerStyleAlert];
    
    // Create an OK button
    UIAlertAction* okButton = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSString *theName = alert.textFields[0].text;
        if ([theName isEqual: @""]) {
            theName = @"Player";
        } else {
            self.dao.currentName = theName;
        }
        [self performSegueWithIdentifier:@"showResults" sender:self];
    }];
    
    // Add the button to the controller
    [alert addAction:okButton];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Enter your Name";
        textField.keyboardType = UIKeyboardTypeDefault;
    }];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    NSNumber *score = [[NSNumber alloc]initWithInt:self.dao.currentScore];
    [self.dao patchDataBase:score  andName:self.dao.currentName];
}

-(void) activateVictim {
    
    if(self.gameFinished){
        
        return;
    }
    
    self.howOftenHeadsPopUp = arc4random_uniform(5);
    
    int numberOfHeadsPoppingUp = arc4random_uniform(3);
    
    switch (numberOfHeadsPoppingUp) {
        case 0:
            [self whichHeads];
            break;
        case 1:
            [self whichHeads];
            [self whichHeads];
            break;
        case 2:
            [self whichHeads];
            [self whichHeads];
            [self whichHeads];
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
    
    switch (whichSound) {
        case 0:
            path = [[NSBundle mainBundle] pathForResource : @"bloodSplatSound" ofType :@"mp3"];
            break;
        case 1:
            path = [[NSBundle mainBundle] pathForResource : @"squishSound" ofType :@"mp3"];
            break;
        case 2:
            path = [[NSBundle mainBundle] pathForResource : @"boneSound" ofType :@"mp3"];
            break;
        case 3:
            path = [[NSBundle mainBundle] pathForResource : @"squishySound" ofType :@"mp3"];
            break;
            
        default:
            break;
            
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

-(void) whichHeads {
    
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

//MARK: Button Actions
- (IBAction)button1Pressed:(id)sender {
    self.button1.hidden = YES;
    self.dao.currentScore = self.dao.currentScore + 10;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
    [self playHitSound];
}
- (IBAction)button2Pressed:(id)sender {
    self.button2.hidden = YES;
    [self playHitSound];
    self.dao.currentScore = self.dao.currentScore + 10;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
}
- (IBAction)button3Pressed:(id)sender {
    self.button3.hidden = YES;
    [self playHitSound];
    self.dao.currentScore = self.dao.currentScore + 10;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
}
- (IBAction)button4Pressed:(id)sender {
    self.button4.hidden = YES;
    [self playHitSound];
    self.dao.currentScore = self.dao.currentScore + 10;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
}
- (IBAction)button5Pressed:(id)sender {
    self.button5.hidden = YES;
    [self playHitSound];
    self.dao.currentScore = self.dao.currentScore + 10;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
}
- (IBAction)button6Pressed:(id)sender {
    self.button6.hidden = YES;
    [self playHitSound];
    self.dao.currentScore = self.dao.currentScore + 10;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
}
- (IBAction)button7Pressed:(id)sender {
    self.button7.hidden = YES;
    [self playHitSound];
    self.dao.currentScore = self.dao.currentScore + 10;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
}
- (IBAction)button8Pressed:(id)sender {
    self.button8.hidden = YES;
    [self playHitSound];
    self.dao.currentScore = self.dao.currentScore + 10;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
}
- (IBAction)button9Pressed:(id)sender {
    self.button9.hidden = YES;
    [self playHitSound];
    self.dao.currentScore = self.dao.currentScore + 10;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
}
- (IBAction)button10Pressed:(id)sender {
    self.button10.hidden = YES;
    [self playHitSound];
    self.dao.currentScore = self.dao.currentScore + 10;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
}
- (IBAction)button11Pressed:(id)sender {
    self.button11.hidden = YES;
    [self playHitSound];
    self.dao.currentScore = self.dao.currentScore + 10;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
}
- (IBAction)button12Pressed:(id)sender {
    self.button12.hidden = YES;
    [self playHitSound];
    self.dao.currentScore = self.dao.currentScore + 10;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
}


@end
