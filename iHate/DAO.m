//
//  DAO.m
//  iHate
//
//  Created by Alex Laptop on 5/4/17.
//
//

#import "DAO.h"

@implementation DAO

+ (id)sharedDataManager {
    static DAO *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.games = @[@"Whack-em", @"BBQ-em", @"Slice-em"];
        self.currentScore = 0;
        self.playerScores = [[NSMutableArray alloc]init];
        self.currentVictim = [[UIImage alloc] init];
    }
    return self;
}

-(void) fetchFromDatabase{
    
    
    self.ref = [[FIRDatabase database] reference];
    
    [self.ref observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        NSDictionary *postDict = snapshot.value;
        
        NSLog(@"Initial DATA: %@", postDict);
        
        NSDictionary *gamesDict = postDict[@"games"];
        NSDictionary *wamDict = gamesDict[@"wam"];
        NSDictionary *scoresDict = wamDict[@"scores"];
        
        NSLog(@"Scores DATA: %@", scoresDict);
        
        self.scoresDict = scoresDict;
        
        [scoresDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            PlayerScore *newPlayer = [[PlayerScore alloc]initWithName:key andScore:obj];
            [self.playerScores addObject:newPlayer];
        }];
        
        
    }withCancelBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
    
}

-(void) addScore:(PlayerScore*) newScore
         ToArray:(NSMutableArray*) array
        AtIndex:(int) index{
    
    NSLog(@"INDEXXX: %d", index);
    [array insertObject:newScore atIndex:index+1];
    [array removeObjectAtIndex:0];
    self.playerScores = [[NSMutableArray alloc]initWithArray:array];
    
    
    NSSortDescriptor *sortDescriptor;
    
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"score" ascending:YES];

    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    
    for (PlayerScore *player in array) {
        [dict setObject:player.score forKey:player.name];
    }
    
    NSLog(@"FINAL: %@", dict);
    
    self.ref = [[FIRDatabase database] reference];
    
    [[[self.ref child:@"games"] child:@"wam"] setValue:@{@"scores": dict}];
    
}

-(void) patchDataBase: (NSNumber*) newScore
              andName: (NSString*) newName{
    
    NSSortDescriptor *sortDescriptor;
    
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"score" ascending:YES];
    
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedArray = [self.playerScores sortedArrayUsingDescriptors:sortDescriptors];
    NSMutableArray *mutSortedArray = [[NSMutableArray alloc]initWithArray:sortedArray];
    
    for (PlayerScore *player in mutSortedArray) {
        NSLog(@"SCOREEEEE: %@", player.score);
        
        int index = [mutSortedArray indexOfObject:player];
        
        if(player == [mutSortedArray lastObject]){
            PlayerScore *new = [[PlayerScore alloc]initWithName:newName andScore:newScore];
            [self addScore:new ToArray:mutSortedArray AtIndex:index];
            return;
        }
        
        PlayerScore *nextPlayer = [sortedArray objectAtIndex:index+1];
        
        if(newScore >= player.score && newScore <= nextPlayer.score){
            PlayerScore *new = [[PlayerScore alloc]initWithName:newName andScore:newScore];
            [self addScore:new ToArray:mutSortedArray AtIndex:index];
            return;
        }
    }
    
}

- (void)bgMusic{
    //_currenBGSong = @"bgSound";
    NSURL *musicFile = [[NSBundle mainBundle] URLForResource:_currentBGSong
                                               withExtension:@"mp3"];
    self.backgroundMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:musicFile
                                                                  error:nil];
    self.backgroundMusic.numberOfLoops = -1;
    [self.backgroundMusic play];
}

@end
