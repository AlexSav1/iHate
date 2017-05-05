//
//  WAMScoreBoardViewController.m
//  
//
//  Created by Alex Laptop on 5/4/17.
//
//

#import "WAMScoreBoardViewController.h"

@interface WAMScoreBoardViewController ()

@end

@implementation WAMScoreBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dao = [DAO sharedDataManager];
    
    NSString *scores = @"";
    
    
    
    for (PlayerScore *player in self.dao.playerScores) {
        [scores stringByAppendingString:[NSString stringWithFormat:@"%@ - %@\n", player.name, player.score]];
    }
    
    NSLog(@"COOOOOOOOL: %@", scores);
    
    self.scoresLabel.text = scores;
    
}

- (IBAction)replayPressed:(id)sender {
    
    
    
}

- (IBAction)pickAnotherGamePressed:(id)sender {
    
    
    
}

@end
