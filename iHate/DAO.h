//
//  DAO.h
//  iHate
//
//  Created by Alex Laptop on 5/4/17.
//
//

#import <Foundation/Foundation.h>
#import "PlayerScore.h"
@import Firebase;

@interface DAO : NSObject
@property (strong, nonatomic) NSArray *games;
//@property (strong, nonatomic) NSMutableArray *topScores;
@property NSDictionary *scoresDict;
@property NSMutableArray *playerScores;
@property int currentScore;
@property (strong, nonatomic) FIRDatabaseReference *ref;

+ (id)sharedDataManager;
-(void) fetchFromDatabase;
-(void) patchDataBase: (NSNumber*) newScore
              andName: (NSString*) newName;
@end
