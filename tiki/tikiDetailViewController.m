//
//  tikiDetailViewController.m
//  tiki
//
//  Created by Alex Lauderdale on 1/14/13.
//  Copyright (c) 2013 Alex Lauderdale. All rights reserved.
//

#import "tikiDetailViewController.h"
#import "tikiInfo.h"
#import "KGModal.h"
#import "tikiTheme.h"
#import "tikiBoldLabel.h"




@interface tikiDetailViewController ()

@end

@implementation tikiDetailViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        // Set the custom back button
        UIImage *buttonImage = [UIImage imageNamed:@"back_arrow"];
        
        //create the button and assign the image
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:buttonImage forState:UIControlStateNormal];
        
        //set the frame of the button to the size of the image (see note below)
        button.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
        
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        //create a UIBarButtonItem with the button as a custom view
        UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        self.navigationItem.leftBarButtonItem = customBarItem;
        
        

    }
    return self;
}

-(BOOL)canBecomeFirstResponder {
    return YES;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
    

}

-(void)back {
	// Tell the controller to go back
	[self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self resignFirstResponder];
    [super viewWillDisappear:animated];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"detail_bg"]];
    self.view.backgroundColor = background;
    // Do any additional setup after loading the view from its nib.
    self.tikiDefenseLabel.text = self.tikiDefenseText;
    self.tikiStrengthLabel.text = self.tikiStrengthText;
    self.tikiAttackLabel.text = self.tikiAttackText;
    self.tikiPowerLabel.text = self.tikiPowerText;
    self.tikiImage.image = [UIImage imageNamed:_tikiImageText];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
        UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 280, 200)];
        
        CGRect welcomeLabelRect = contentView.bounds;
        welcomeLabelRect.origin.y = 20;
        welcomeLabelRect.size.height = 20;
        UIFont *welcomeLabelFont = [UIFont boldSystemFontOfSize:17];
        UILabel *welcomeLabel = [[UILabel alloc] initWithFrame:welcomeLabelRect];
        welcomeLabel.text = [NSString stringWithFormat:@"%@ Say", self.tikiNameText];
        welcomeLabel.font = welcomeLabelFont;
        welcomeLabel.textColor = [UIColor whiteColor];
        welcomeLabel.textAlignment = NSTextAlignmentCenter;
        welcomeLabel.backgroundColor = [UIColor clearColor];
        welcomeLabel.shadowColor = [UIColor blackColor];
        welcomeLabel.shadowOffset = CGSizeMake(0, 1);
        [contentView addSubview:welcomeLabel];
        
        CGRect infoLabelRect = CGRectInset(contentView.bounds, 5, 5);
        infoLabelRect.origin.y = CGRectGetMaxY(welcomeLabelRect)+5;
        infoLabelRect.size.height -= CGRectGetMinY(infoLabelRect);
        UILabel *infoLabel = [[UILabel alloc] initWithFrame:infoLabelRect];
        
        infoLabel.text =  [[tikiInfo tikiCommands] objectAtIndex: arc4random() % [[tikiInfo tikiCommands] count]];;
        
        infoLabel.numberOfLines = 6;
        infoLabel.textColor = [UIColor whiteColor];
        infoLabel.textAlignment = NSTextAlignmentCenter;
        infoLabel.backgroundColor = [UIColor clearColor];
        infoLabel.shadowColor = [UIColor blackColor];
        infoLabel.shadowOffset = CGSizeMake(0, 1);
        [contentView addSubview:infoLabel];
        
        [[KGModal sharedInstance] showWithContentView:contentView andAnimated:YES];
    }
}


- (IBAction)ShowOverlay:(id)sender {
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 280, 200)];
    
    CGRect welcomeLabelRect = contentView.bounds;
    welcomeLabelRect.origin.y = 20;
    welcomeLabelRect.size.height = 20;
    UIFont *welcomeLabelFont = [UIFont boldSystemFontOfSize:17];
    UILabel *welcomeLabel = [[UILabel alloc] initWithFrame:welcomeLabelRect];
    welcomeLabel.text = [NSString stringWithFormat:@"%@ Say", self.tikiNameText];
    welcomeLabel.font = welcomeLabelFont;
    welcomeLabel.textColor = [UIColor whiteColor];
    welcomeLabel.textAlignment = NSTextAlignmentCenter;
    welcomeLabel.backgroundColor = [UIColor clearColor];
    welcomeLabel.shadowColor = [UIColor blackColor];
    welcomeLabel.shadowOffset = CGSizeMake(0, 1);
    [contentView addSubview:welcomeLabel];
    
    CGRect infoLabelRect = CGRectInset(contentView.bounds, 5, 5);
    infoLabelRect.origin.y = CGRectGetMaxY(welcomeLabelRect)+5;
    infoLabelRect.size.height -= CGRectGetMinY(infoLabelRect);
    UILabel *infoLabel = [[UILabel alloc] initWithFrame:infoLabelRect];
    
    infoLabel.text =  [[tikiInfo tikiCommands] objectAtIndex: arc4random() % [[tikiInfo tikiCommands] count]];
    
    infoLabel.numberOfLines = 6;
    infoLabel.textColor = [UIColor whiteColor];
    infoLabel.textAlignment = NSTextAlignmentCenter;
    infoLabel.backgroundColor = [UIColor clearColor];
    infoLabel.shadowColor = [UIColor blackColor];
    infoLabel.shadowOffset = CGSizeMake(0, 1);
    [contentView addSubview:infoLabel];
    
    [[KGModal sharedInstance] showWithContentView:contentView andAnimated:YES];
}

- (IBAction)tweet:(id)sender {
    
}

- (IBAction)mail:(id)sender {

    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        mailer.mailComposeDelegate = self;
        [mailer setSubject:self.tikiNameText];
        NSArray *toRecipients = [NSArray arrayWithObjects:@"fisrtMail@example.com", @"secondMail@example.com", nil];
        [mailer setToRecipients:toRecipients];
        UIImage *myImage = [UIImage imageNamed:@"mobiletuts-logo.png"];
        NSData *imageData = UIImagePNGRepresentation(myImage);
        [mailer addAttachmentData:imageData mimeType:@"image/png" fileName:@"mobiletutsImage"];
        NSString *emailBody = [[tikiInfo tikiCommands] objectAtIndex: arc4random() % [[tikiInfo tikiCommands] count]];
        [mailer setMessageBody:emailBody isHTML:NO];
        ///left button
        

        
        
            [self presentViewController:mailer animated:YES completion:nil];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure"
                                                        message:@"Your device doesn't support the composer sheet"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
        [alert show];
    }
}


- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled: you cancelled the operation and no email message was queued.");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved: you saved the email message in the drafts folder.");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail send: the email message is queued in the outbox. It is ready to send.");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed: the email message was not saved or queued, possibly due to an error.");
            break;
        default:
            NSLog(@"Mail not sent.");
            break;
    }
    // Remove the mail view
    [self dismissViewControllerAnimated:YES completion:nil];
}




@end