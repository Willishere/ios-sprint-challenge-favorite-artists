//
//  Artist.h
//  Favorite Artists
//
//  Created by William Chen on 11/8/19.
//  Copyright © 2019 William Chen. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Artist : NSObject
@property NSString *strArtist;
@property NSString *intYearReleased;
@property NSString *strDescriptionEN;

- (instancetype) initWithstrArtist:(NSString *)strArtist intYearReleased:(NSString *)intYearReleased strDescriptionEN:(NSString *)strDescriptionEN;

- (instancetype) initwithDictionary: (NSDictionary *)dictionary;

@end

