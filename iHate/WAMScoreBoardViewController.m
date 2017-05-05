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

    for (int i = self.dao.playerScores.count; i<=0; i--) {
        NSString *name = [self.dao.playerScores[i] name];
        NSString *score = [self.dao.playerScores[i] score];
        scores = [scores stringByAppendingString:[NSString stringWithFormat:@"%@ - %@\n", name, score]];
    }
    
//    for (PlayerScore *player in self.dao.playerScores) {
//        scores = [scores stringByAppendingString:[NSString stringWithFormat:@"%@ - %@\n", player.name, player.score]];
//    }
    
    NSLog(@"COOOOOOOOL: %@", scores);
    
    self.scoresLabel.text = scores;
    
}

- (IBAction)replayPressed:(id)sender {
    
    WAMGameViewController *gameVC = [[WAMGameViewController alloc] init];
    DAO *dao = [DAO sharedDataManager];
    gameVC.scoreLabel.text = @"Score : 0";
    dao.currentScore = 0;
    gameVC.currentVictim = dao.currentVictim;
    [self dismissViewControllerAnimated:true completion:nil ];
    
    
}

- (IBAction)pickAnotherGamePressed:(id)sender {
    GameListViewController *gameListVC = [[GameListViewController alloc]init];
    [self presentViewController:gameListVC animated:true completion:nil];
    
}

@end
