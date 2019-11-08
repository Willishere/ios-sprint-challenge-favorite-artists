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




@end

@implementation WCArtistDetailViewController


    

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
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
            if (artists[0] != nil){
                
            self.artist = [[WCArtist alloc] initwithDictionary:artists[0]];
            // update the UI
            [self updateViews];
            }
            
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
- (void)updateViews{
    if(self.artist){
    [self.artistNameLabel setText:_artist.strArtist];
    [self.artistNameLabel setHidden:false];
    [self.artistHistoryTextField setText:_artist.strDescriptionEN];
    [self.artistHistoryTextField setHidden:false];
    [self.albumYear setText:_artist.intYearReleased];
    [self.albumYear setHidden:false];
    [_searchBar setHidden:true];
    
    }else {
    [_searchBar setHidden:false];
    [self.artistNameLabel setHidden:true];
    [self.artistHistoryTextField setHidden:true];
    [self.albumYear setHidden:true];
}
    
}

- (IBAction)saveButtonPressed:(id)sender {
    [self.controller.artists addObject:_artist];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
