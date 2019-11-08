//
//  ArtistDetailViewController.h
//  Favorite Artists
//
//  Created by William Chen on 11/8/19.
//  Copyright © 2019 William Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class WCArtist;
@class WCArtistController;

@interface WCArtistDetailViewController : UIViewController
@property WCArtistController *controller;
@property WCArtist *artist;

@end

NS_ASSUME_NONNULL_END
