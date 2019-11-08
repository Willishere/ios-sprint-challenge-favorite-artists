//
//  Artist.m
//  Favorite Artists
//
//  Created by William Chen on 11/8/19.
//  Copyright © 2019 William Chen. All rights reserved.
//

#import "Artist.h"

@implementation Artist

- (instancetype) initWithstrArtist:(NSString *)strArtist intYearReleased:(NSString *)intYearReleased strDescriptionEN:(NSString *)strDescriptionEN{
    if (self = [super init]){
        
        _strArtist = strArtist;
        _intYearReleased = intYearReleased;
        _strDescriptionEN = strDescriptionEN;

    }
    return self;
}

- (instancetype) initwithDictionary: (NSDictionary *)dictionary{
    NSDictionary *artistDictionary = dictionary[@"strArtist"];
    NSDictionary *yearReleased = dictionary[@"intYearReleased"];
    NSDictionary *description = dictionary[@"strDescriptionEN"];
    
    return [self initWithstrArtist:artistDictionary intYearReleased:yearReleased strDescriptionEN:description];
}

@end
