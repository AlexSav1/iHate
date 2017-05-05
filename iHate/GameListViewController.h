//
//  GameListViewController.h
//  iHate
//
//  Created by Emiko Clark on 5/4/17.
//
//

#import <UIKit/UIKit.h>
#import "DAO.h"

@interface GameListViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) DAO *dao;
@property (strong, nonatomic) NSString *game;
@property UIImage *chosenImage;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end
