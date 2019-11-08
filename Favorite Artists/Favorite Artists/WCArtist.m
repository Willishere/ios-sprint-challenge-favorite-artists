//
//  Artist.m
//  Favorite Artists
//
//  Created by William Chen on 11/8/19.
//  Copyright © 2019 William Chen. All rights reserved.
//

#import "WCArtist.h"

@implementation WCArtist

- (instancetype) initWithstrArtist:(NSString *)strArtist intYearReleased:(NSString *)intYearReleased strDescriptionEN:(NSString *)strDescriptionEN{
    if (self = [super init]){
        
        _strArtist = strArtist;
        _intYearReleased = intYearReleased;
        _strDescriptionEN = strDescriptionEN;

    }
    return self;
}

- (instancetype) initwithDictionary: (NSDictionary *)dictionary{
    NSString *artist = dictionary[@"strArtist"];
    NSString *yearReleased = dictionary[@"intYearReleased"];
    NSString *description = dictionary[@"strDescriptionEN"];
    
    return [self initWithstrArtist:artist intYearReleased:yearReleased strDescriptionEN:description];
}

@end
