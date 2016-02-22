//
//  ViewController2.h
//  Etris
//
//  Created by nickinade on 29.08.15.
//  Copyright © 2015 Elf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>


@interface ViewController2 : UIViewController<MFMailComposeViewControllerDelegate>

-(NSUInteger)supportedInterfaceOrientations;
-(UIStatusBarStyle)preferredStatusBarStyle;

@property (strong, nonatomic) IBOutlet UIView *mainBackground2;
@property(weak, nonatomic) UIColor *backgroundColor;
@property(weak, nonatomic) UIColor *buttonColor;

- (IBAction)sendFeedback:(id)sender;

-(void)coloringApp;
@end
