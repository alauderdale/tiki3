//
//  tikiRootViewController.m
//  tiki
//
//  Created by Alex Lauderdale on 1/14/13.
//  Copyright (c) 2013 Alex Lauderdale. All rights reserved.
//

#import "tikiRootViewController.h"
#import "tikiDetailViewController.h"
#import "tikiViewCell.h"
#import "tikiInfo.h"

@interface tikiRootViewController ()

@end

@implementation tikiRootViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Conjure a Tiki";
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"Meet Us";
     
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[tikiInfo tikiNames] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tikiTableIdentifier = @"tikiViewCell";
    
    tikiViewCell *cell = (tikiViewCell *)[tableView dequeueReusableCellWithIdentifier:tikiTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"tikiViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }

    cell.nameLabel.text = [[tikiInfo tikiNames] objectAtIndex:indexPath.row];
    cell.tikiThumb.image = [UIImage imageNamed:[[tikiInfo tikiThumbs] objectAtIndex:indexPath.row]];

    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}


- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    tikiDetailViewController *targetController = [[tikiDetailViewController alloc] init];
    
    targetController.navigationItem.title = [[tikiInfo tikiNames] objectAtIndex:indexPath.row];
    targetController.tikiNameText = [[tikiInfo tikiNames] objectAtIndex: indexPath.row];
    targetController.tikiPowerText = [[tikiInfo tikiPowers] objectAtIndex: indexPath.row];
    
    [self.navigationController
     pushViewController:targetController
     animated:YES];
    
}

@end
