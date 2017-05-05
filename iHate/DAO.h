//
//  DAO.h
//  iHate
//
//  Created by Alex Laptop on 5/4/17.
//
//

#import <Foundation/Foundation.h>
@import Firebase;

@interface DAO : NSObject
@property (strong, nonatomic) NSArray *games;
//@property (strong, nonatomic) NSMutableArray *topScores;
@property NSDictionary *scoresDict;
@property NSMutableArray *topNames;
@property NSMutableArray *topScores;
@property int currentScore;
@property (strong, nonatomic) FIRDatabaseReference *ref;

+ (id)sharedDataManager;
-(void) fetchFromDatabase;
@end
