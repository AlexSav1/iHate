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
        
        NSMutableArray *names = [[NSMutableArray alloc]init];
        NSMutableArray *scores = [[NSMutableArray alloc]init];
        
        [scoresDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
//            NSLog(@"KEY: %@", key);
//            NSLog(@"OBJECT: %@", obj);
            [names addObject:key];
            [scores addObject:obj];
        }];
        
         //NSLog(@"NAMES: %@", names[2]);
        //NSLog(@"SCORES: %@", scores[2]);
        
        //scores = [scores sortedArrayUsingSelector: @selector(compare:)];
        
        //NSLog(@"SCORES: %@", scores);
        
    }withCancelBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
    
}

@end
