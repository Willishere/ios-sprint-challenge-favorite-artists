//
//  ArtistDetailViewController.m
//  Favorite Artists
//
//  Created by William Chen on 11/8/19.
//  Copyright © 2019 William Chen. All rights reserved.
//

#import "WCArtistDetailViewController.h"
#import "WCArtistController.h"
#import "WCArtist.h"

@interface WCArtistDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *albumYear;
@property (weak, nonatomic) IBOutlet UITextView *artistHistoryTextField;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property WCArtistController *controller;


@end

@implementation WCArtistDetailViewController


    

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.searchBar setDelegate:self];
    // Do any additional setup after loading the view.
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    [self.controller searchForPeopleWithSearchTerm:searchBar.text completion:^(NSArray *artists, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
            return;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            // set the people
            self.artists = artists;
            // update the UI

        });
        NSLog(@"Search result: %@", artists);
        
    }];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)saveButtonPressed:(id)sender {
    NSString *title = self.artistNameLabel.text;
    NSString *body = self.artistHistoryTextField.text;
    NSString *year = self.albumYear.text;
    
//    if (!self.) {
//        [self.documentController createDocWithTitle:title body:body];
//    } else {
//        [self.documentController updateDoc:self.document title:title body:body];
//    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
