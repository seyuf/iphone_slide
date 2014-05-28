//
//  City+CRUD.h
//  Xproj
//
//  Created by Etudiant on 16/05/2014.
//  Copyright (c) 2014 Etudiant. All rights reserved.
//

#import "City.h"

@interface City (CRUD)

+ (instancetype) newCity;
+(NSArray *) allCities;
-(void) destroy;
+ (void) saveChanges;

@end
