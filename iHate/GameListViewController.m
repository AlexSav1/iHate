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
    
    // If no camera, show alert
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [self displayError:@"Your device does not have a camera!"];
    }
    
}

- (IBAction)takePhotoPressed:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (IBAction)pickPhotoPressed:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

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

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *selectedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
//    NSData *imageData = UIImageJPEGRepresentation(chosenImage, 0.25);

    [picker dismissViewControllerAnimated:YES completion:NULL];

    // push to gameVC
    [self performSegueWithIdentifier:@"showGame" sender:self];
    
}


// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView
            titleForRow:(NSInteger)row
           forComponent:(NSInteger)component{
    
    
//    return self.pickerData[row];
    return @"game name";
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

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}




- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showGame"]) {
        // Get destination view
        WAMGameViewController *vc = [segue destinationViewController];
        
        // Pass the information to your destination view
//        [vc setVictimPhoto:self.victimPhoto];
    }
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
    
    // Display the alert controller on the topmost viewController
    UINavigationController *navigationController = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    [navigationController.topViewController presentViewController:alert animated:YES completion:nil];
}


@end
