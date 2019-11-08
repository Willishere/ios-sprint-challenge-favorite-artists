//
//  ArtistController.h
//  Favorite Artists
//
//  Created by William Chen on 11/8/19.
//  Copyright © 2019 William Chen. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface WCArtistController : NSObject

- (void)searchForPeopleWithSearchTerm:(NSString *)searchTerm
completion:(void (^)(NSArray *people, NSError *error))completion;

@property NSMutableArray *artists;

@end


