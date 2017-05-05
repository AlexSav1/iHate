//
//  WAMScoreBoardViewController.h
//  
//
//  Created by Alex Laptop on 5/4/17.
//
//

#import <UIKit/UIKit.h>
#import "GameListViewController.h"
#import "WAMGameViewController.h"
#import "DAO.h"

@interface WAMScoreBoardViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *scoresLabel;
@property DAO *dao;


@end
