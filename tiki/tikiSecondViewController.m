//
//  tikiSecondViewController.m
//  tiki
//
//  Created by Alex Lauderdale on 1/15/13.
//  Copyright (c) 2013 Alex Lauderdale. All rights reserved.
//

#import "tikiSecondViewController.h"
#import "tikiInfo.h"
#import "tikiCollectionViewCell.h"
#import "tikiDetailViewController.h"
#import "UIColor+HexColors.h"

@interface tikiSecondViewController ()

@end

@implementation tikiSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Meet The Tikis";
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}





- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor colorFromRGB:0xfffefa];
    
    UINib *cellNib = [UINib nibWithNibName:@"tikiCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"tikiCollectionViewCell"];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(145, 145)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flowLayout setSectionInset:UIEdgeInsetsMake(9.0f, 9.0f, 0.0f, 9.0f)];
    
    [self.collectionView setCollectionViewLayout:flowLayout];
    
}

//-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//    return 5;
//}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section

{
    return [[tikiInfo tikiNames] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    
    static NSString *cellIdentifier = @"tikiCollectionViewCell";
    
    tikiCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell.tikiThumb.image = [UIImage imageNamed:[[tikiInfo tikiThumbs] objectAtIndex:indexPath.row]];
    return cell;
    
    
    
}


- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    tikiDetailViewController *targetController = [[tikiDetailViewController alloc] init];
    
    targetController.navigationItem.title = [[tikiInfo tikiNames] objectAtIndex:indexPath.row];
    targetController.tikiStrengthText = [[tikiInfo tikiStrengths] objectAtIndex: indexPath.row];
    targetController.tikiAttackText = [[tikiInfo tikiAttacks] objectAtIndex: indexPath.row];
    targetController.tikiDefenseText = [[tikiInfo tikiDefense] objectAtIndex: indexPath.row];
    targetController.tikiPowerText = [[tikiInfo tikiPowers] objectAtIndex: indexPath.row];
    targetController.tikiImageText = [[tikiInfo tikiLargeImages] objectAtIndex: indexPath.row];
    targetController.tikiNameText = [[tikiInfo tikiNames] objectAtIndex: indexPath.row];
    
    
    targetController.tikiCommansdArray = [[tikiInfo tikiCommands] objectAtIndex: indexPath.row];
    
    
//    
//    targetController.tikiCommandText = [tikiCommansdArray objectAtIndex: arc4random() % [tikiCommansdArray count]];

    
    [self.navigationController
     pushViewController:targetController
     animated:YES];
    
}


@end
