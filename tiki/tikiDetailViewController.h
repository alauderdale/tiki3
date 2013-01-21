//
//  tikiDetailViewController.h
//  tiki
//
//  Created by Alex Lauderdale on 1/14/13.
//  Copyright (c) 2013 Alex Lauderdale. All rights reserved.
//



#import <UIKit/UIKit.h>
#import "UIView+Categories.h"
#import <MessageUI/MessageUI.h>
#import <Twitter/Twitter.h>

@interface tikiDetailViewController : UIViewController<MFMailComposeViewControllerDelegate>;

@property (weak, nonatomic) IBOutlet UIImageView *tikiImage;
@property (strong, nonatomic) NSString *tikiNameText;
@property (strong, nonatomic) NSString *tikiPowerText;
@property (strong, nonatomic) NSString *tikiStrengthText;
@property (strong, nonatomic) NSString *tikiDefenseText;
@property (strong, nonatomic) NSString *tikiAttackText;
@property (strong, nonatomic) NSArray *tikiCommansdArray;
@property (strong, nonatomic) IBOutlet UILabel *tikiPowerLabel;
@property (weak, nonatomic) IBOutlet UILabel *tikiStrengthLabel;
@property (weak, nonatomic) IBOutlet UILabel *tikiDefenseLabel;
@property (weak, nonatomic) IBOutlet UILabel *tikiAttackLabel;
@property (strong, nonatomic) NSString *tikiImageText;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;




- (IBAction)ShowOverlay:(id)sender;
- (IBAction)tweet:(id)sender;




@end
