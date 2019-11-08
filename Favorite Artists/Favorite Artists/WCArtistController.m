//
//  ArtistController.m
//  Favorite Artists
//
//  Created by William Chen on 11/8/19.
//  Copyright © 2019 William Chen. All rights reserved.
//

#import "WCArtistController.h"
#import "WCArtist.h"

@implementation WCArtistController
static NSString *const baseURLString = @"https://theaudiodb.com/api/v1/json/1/searchalbum.php?s=";

- (void)searchForPeopleWithSearchTerm:(NSString *)searchTerm
                           completion:(void (^)(NSArray *people, NSError *error))completion{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
        NSURLQueryItem *searchItem = [NSURLQueryItem queryItemWithName:@"search" value:searchTerm];
        [components setQueryItems: @[searchItem]];
        
        NSURL *url = [components URL];
        NSLog(@"URL: %@", url);
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        // Make our request URLSession
        NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            NSLog(@"Search results");
            
            // check for error, call completion
            if (error) {
                completion(nil, error);
                return;
            }
            
            if (data == nil) {
                NSLog(@"Data was nil");
                completion(nil, [[NSError alloc] init]); // TODO: Create a meaningful error type
                return;
            }
            
            NSError *jsonError = nil;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            if(jsonError) {
                completion(nil, error);
                return;
            }
            
            if (![json isKindOfClass:[NSDictionary class]]) { // [NSArray class] [NSNull class]
                NSLog(@"JSON was not a top level dictionary as expected");
                completion(nil, [[NSError alloc] init]); // TODO: Create a meaningful error type
                return;
            }
            
            // Loop through the data and transform from a dictionary to LSIPerson
            
            NSArray *albums = json[@"album"];                        // let results = []
            NSMutableArray *people = [[NSMutableArray alloc] init];        // var people = []
            
            // NSArray of NSDictionary
            for (NSDictionary *dictionary in albums) {
                WCArtist *artist = [[WCArtist alloc] initwithDictionary:dictionary];
                [people addObject:artist];  // people.append(person)
            }
            completion(people, nil);
            
        }];
        [task resume];
        
        
        
        
}


// URL to request data

@end
