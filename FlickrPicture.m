//
//  FlickrPicture.m
//  Xproj
//
//  Created by Etudiant on 30/04/2014.
//  Copyright (c) 2014 Etudiant. All rights reserved.
//

#import "FlickrPicture.h"
#define kFlickrAPIKey @"0cb2d261bcc6ac5a79fe55c8a6e1ebe1"


@implementation FlickrPicture
- (NSURL *) url{
    NSString * urlString = [NSString stringWithFormat: @"http://farm%i.staticflickr.com/%@/%@_%@.jpg", self.farm.intValue, self.server, self.pictureId, self.secret];
    return [NSURL URLWithString:urlString];
}

+ (NSArray*) picturesAroundLocation:(FlickRLocation) location{
     NSString * urlString = [NSString stringWithFormat: @"https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=%@&lat=%f&lon=%f&radius=%i&format=json&nojsoncallback=1", kFlickrAPIKey,location.latitude, location.longitude, location.radius ];
    
    
    NSURL * url = [NSURL URLWithString:urlString ];
    NSData * data = [NSData dataWithContentsOfURL:url];
    // TODO use AF framework for networking instead
    
    NSDictionary * jsonData = [NSJSONSerialization JSONObjectWithData:data options:0 error:Nil];
    

    NSMutableArray * pictures = [NSMutableArray arrayWithCapacity:[jsonData[@"photos"][@"photo"]count ]];
    
    for (NSDictionary * currentPicture in jsonData[@"photos"][@"photo"]) {
        FlickrPicture * picture = [[FlickrPicture alloc]init];
        picture.pictureId = currentPicture[@"id"];
        picture.server = currentPicture[@"server"];
        picture.secret = currentPicture[@"secret"];
        picture.farm = currentPicture[@"farm"];
        picture.title = currentPicture[@"title"];
        [pictures addObject:picture];
    }
    
    return [NSArray arrayWithArray:pictures];
}
@end
