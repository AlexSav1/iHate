//
//  GameListViewController.m
//  iHate
//
//  Created by Emiko Clark on 5/4/17.
//
//

#import "GameListViewController.h"
#import "WAMGameViewController.h"

@interface GameListViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) UIImage *victimPhoto;

@end

@implementation GameListViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dao = DAO.sharedDataManager;
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    [self.dao fetchFromDatabase];
//    self.dao.currenBGSong = @"bgSound";
    [self.dao bgMusic];
}

-(void)viewWillAppear:(BOOL)animated{
//    self.dao.currenBGSong = @"bgSound";
    [self.dao bgMusic];
    
}

//MARK: Button Actions
- (IBAction)takePhotoPressed:(id)sender {
    NSLog(@"Scores : %@", self.dao.scoresDict);
    
    // If no camera, show alert
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [self displayError:@"Your device does not have a camera!"];
    } else {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:picker animated:YES completion:NULL];
    }
    
}

- (IBAction)pickPhotoPressed:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)continuePressed:(id)sender {
    // push to gameVC
    [self performSegueWithIdentifier:@"showGame" sender:self.chosenImage];
}

//MARK: Picker View Methods
// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.dao.games.count;
    
}


// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView
            titleForRow:(NSInteger)row
           forComponent:(NSInteger)component{
    
    return self.dao.games[row];
}


// Catpure the picker view selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // This method is triggered whenever the user makes a change to the picker selection.
    // The parameter named row and component represents what was selected.
    if ([pickerView isEqual: @"Wack-em"]) {
        // got to Wackem VC
        self.game = @"WAM";
    } else if ([pickerView isEqual: @"BBQ-em"]) {
        self.game = @"BBQ";

    } else if ([pickerView  isEqual: @"Slice-em"]) {
        self.game = @"SLICE";
    }
    
    
}

//MARK: Image Picker Methods
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.chosenImage = chosenImage;
    [picker dismissViewControllerAnimated:YES completion:^{
        self.imageView.image = chosenImage;
    }];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    WAMGameViewController *gameVC = segue.destinationViewController;
    gameVC.currentVictim = sender;
}



- (void) displayError:(NSString *)errorMsg
{
    // Initialize the controller for displaying the message
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@" "
                                                                   message:errorMsg
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    // Create an OK button
    UIAlertAction* okButton = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:nil];
    
    // Add the button to the controller
    [alert addAction:okButton];
    
    [self presentViewController:alert animated:YES completion:nil];
}


@end
