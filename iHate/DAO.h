//
//  DAO.h
//  iHate
//
//  Created by Alex Laptop on 5/4/17.
//
//

#import <Foundation/Foundation.h>

@interface DAO : NSObject
@property (strong, nonatomic) NSArray *games;
@property (strong, nonatomic) NSMutableArray *topScores;

+ (id)sharedDataManager;

@end
