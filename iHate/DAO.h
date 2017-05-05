//
//  DAO.h
//  iHate
//
//  Created by Alex Laptop on 5/4/17.
//
//

#import <Foundation/Foundation.h>
#import "PlayerScore.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
@import Firebase;

@interface DAO : NSObject
@property(nonatomic, strong) AVAudioPlayer *backgroundMusic;
@property NSString *currenBGSong;

@property (strong, nonatomic) UIImage *currentVictim;


@property (strong, nonatomic) NSArray *games;
//@property (strong, nonatomic) NSMutableArray *topScores;
@property NSDictionary *scoresDict;
@property NSMutableArray *playerScores;
@property NSString *currentName;
@property int currentScore;
@property (strong, nonatomic) FIRDatabaseReference *ref;

+ (id)sharedDataManager;
-(void) bgMusic;
-(void) fetchFromDatabase;
-(void) patchDataBase: (NSNumber*) newScore
              andName: (NSString*) newName;
@end
