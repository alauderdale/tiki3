//
//  tikiSecondViewController.h
//  tiki
//
//  Created by Alex Lauderdale on 1/15/13.
//  Copyright (c) 2013 Alex Lauderdale. All rights reserved.
//

#import <UIKit/UIKit.h>

@class tikiDetailViewController;

@interface tikiSecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) IBOutlet tikiDetailViewController *tikiDetailViewController;

@end
