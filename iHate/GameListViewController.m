//
//  GameListViewController.m
//  iHate
//
//  Created by Emiko Clark on 5/4/17.
//
//

#import "GameListViewController.h"

@interface GameListViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@end

@implementation GameListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)takePhotoPressed:(id)sender {
    
}

- (IBAction)pickPhotoPressed:(id)sender {
    
}

// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //return self.pickerData.count;
    return 3;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView
            titleForRow:(NSInteger)row
           forComponent:(NSInteger)component{
    
    
   // return self.pickerData[row];
    return @"game name";
}


// Catpure the picker view selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // This method is triggered whenever the user makes a change to the picker selection.
    // The parameter named row and component represents what was selected.
    
    
    
}


@end
