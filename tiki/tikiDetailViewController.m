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
#import "tikiOverlayView.h"




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

- (UIView *)overlayView
{
    tikiOverlayView *overlayView = [[[NSBundle mainBundle] loadNibNamed:@"tikiOverlayView" owner:self options:nil] objectAtIndex:0];
    overlayView.tikiCommandLabel.text = self.tikiCommandText;
    overlayView.mailButton.hidden = YES;
    return overlayView;
}

- (UIView *)mailView
{
    tikiOverlayView *overlayView = [[[NSBundle mainBundle] loadNibNamed:@"tikiOverlayView" owner:self options:nil] objectAtIndex:0];
    overlayView.tikiCommandLabel.text = self.tikiCommandText;
    [overlayView.mailButton addTarget:self
                               action:@selector(mailCommand:)
                     forControlEvents:UIControlEventTouchDown];
    [overlayView.mailButton setTitle:@"Mail" forState:UIControlStateNormal];
    return overlayView;
}

- (UIView *)tweetView
{
    tikiOverlayView *overlayView = [[[NSBundle mainBundle] loadNibNamed:@"tikiOverlayView" owner:self options:nil] objectAtIndex:0];
    overlayView.tikiCommandLabel.text = self.tikiCommandText;
    [overlayView.mailButton addTarget:self
                               action:@selector(tweetCommand:)
                     forControlEvents:UIControlEventTouchDown];
    [overlayView.mailButton setTitle:@"Tweet" forState:UIControlStateNormal];
    return overlayView;
}



- (void)mailCommand:(id)sender {
    

    [[KGModal sharedInstance] hideAnimated:YES];
    
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        mailer.mailComposeDelegate = self;
        [mailer setSubject:self.tikiNameText];
        NSArray *toRecipients = [NSArray arrayWithObjects: nil];
        [mailer setToRecipients:toRecipients];
        UIImage *myImage = [UIImage imageNamed:[self tikiImageText]];
        NSData *imageData = UIImagePNGRepresentation(myImage);
        [mailer addAttachmentData:imageData mimeType:@"image/png" fileName:@"mobiletutsImage"];
        NSString *emailBody = self.tikiCommandText;
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


- (void)tweetCommand:(id)sender {
    
    
    [[KGModal sharedInstance] hideAnimated:YES];
    
    
}


- (IBAction)ShowOverlay:(id)sender {
    self.tikiCommandText =  [self.tikiCommansdArray objectAtIndex: 0];
    [[KGModal sharedInstance] showWithContentView:self.overlayView andAnimated:YES];
}

- (IBAction)mail:(id)sender {
    self.tikiCommandText =  [self.tikiCommansdArray objectAtIndex: 1];
    [[KGModal sharedInstance] showWithContentView:self.mailView andAnimated:YES];
}

- (IBAction)tweet:(id)sender {
    self.tikiCommandText =  [self.tikiCommansdArray objectAtIndex: 2];
    [[KGModal sharedInstance] showWithContentView:self.tweetView andAnimated:YES];
}








@end
