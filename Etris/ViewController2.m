//
//  ViewController2.m
//  Etris
//
//  Created by nickinade on 29.08.15.
//  Copyright © 2015 Elf. All rights reserved.
//

#import "ViewController2.h"


@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self supportedInterfaceOrientations];
    //[self coloringApp];
    
    NSLog(@"Name: %@ Score: %f", [[NBUserProfile sharedInstance] name], [[NBUserProfile sharedInstance] score]);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)sendFeedback:(id)sender {
    
    // Email Subject
    NSString *emailTitle = @"Feedback Email";
    // Email Content
    NSString *messageBody = @"Etris feedback";
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"testmail@etris.com"];
    
    
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];

}

-(void)coloringApp{
    
    _backgroundColor=[UIColor colorWithRed:0.84 green:0.82 blue:0.80 alpha:1.0];
    _buttonColor=[UIColor colorWithRed:1.00 green:0.67 blue:0.12 alpha:1.0];
    
    // _selectedCellsColor = [UIColor redColor];
    
    //New game buttons tag = 2
    
    
    
    [_mainBackground2  setBackgroundColor:_backgroundColor];
    [[self.view viewWithTag:1]setBackgroundColor:_buttonColor];
        
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
