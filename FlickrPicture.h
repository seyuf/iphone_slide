//
//  FlickrPicture.h
//  Xproj
//
//  Created by Etudiant on 30/04/2014.
//  Copyright (c) 2014 Etudiant. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef struct {
    double latitude;
    double longitude;
    int radius;
} FlickRLocation;

@interface FlickrPicture : NSObject
@property (strong, nonatomic) NSString * pictureId;
@property (strong, nonatomic) NSNumber * farm;
@property (strong, nonatomic) NSString * server;
@property (strong, nonatomic) NSString * secret;
@property (strong, nonatomic) NSString * title;


- (NSURL *) url;
+ (NSArray*) picturesAroundLocation:(FlickRLocation) location;

@end
