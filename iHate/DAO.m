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
        
        self.games = [NSArray arrayWithObjects: @"Whack-em", @"BBQ-em", @"Slice-em", nil];

    }
    return self;
}


@end
