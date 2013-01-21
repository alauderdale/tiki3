//
//  tikiRootViewController.h
//  tiki
//
//  Created by Alex Lauderdale on 1/14/13.
//  Copyright (c) 2013 Alex Lauderdale. All rights reserved.
//

#import <UIKit/UIKit.h>

@class tikiDetailViewController;

@interface tikiRootViewController : UIViewController



@property (nonatomic, strong) IBOutlet tikiDetailViewController *tikiDetailViewController;
@property (nonatomic, strong) IBOutlet UITableView *tableView;


@property (strong, nonatomic) NSString *tikiNameText;
@property (strong, nonatomic) NSString *tikiPowerText;
@property (strong, nonatomic) NSString *tikiCommandText;



@end
