//
//  ArtistTableViewController.m
//  Favorite Artists
//
//  Created by William Chen on 11/8/19.
//  Copyright © 2019 William Chen. All rights reserved.
//

#import "WCArtistTableViewController.h"
#import "WCArtistController.h"
#import "WCArtist.h"
#import "WCArtistDetailViewController.h"

@interface WCArtistTableViewController ()
@property WCArtistController *controller;
@property NSArray *artists;

@end

@implementation WCArtistTableViewController



- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        _controller = [[WCArtistController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.artists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"artistCell" forIndexPath:indexPath];
    
    WCArtist *artist = self.artists[indexPath.row];
    
    cell.textLabel.text = artist.strArtist;
    cell.detailTextLabel.text = artist.intYearReleased;
    
    // Configure the cell...
    
    return cell;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"addSegue"]) {
       WCArtistDetailViewController *destinationVC = segue.destinationViewController;
        destinationVC.controller = self.controller;
        destinationVC.artists = self.artists;
        
    }
}


@end
