//
//  City+CRUD.m
//  Xproj
//
//  Created by Etudiant on 16/05/2014.
//  Copyright (c) 2014 Etudiant. All rights reserved.
//

#import "City+CRUD.h"
#import "AppDelegate.h"

@implementation City (CRUD)

+(AppDelegate *) appDelegate
{
    return [[UIApplication sharedApplication] delegate];
}

+(instancetype)newCity{
    City * city = [NSEntityDescription insertNewObjectForEntityForName:@"city" inManagedObjectContext:[self context]];
    [[self appDelegate] saveContext];
    return city;
}
-(void) destroy{
    [[City context] deleteObject:self];
    [[City appDelegate] saveContext];
}

+(NSArray *) allCities{
    NSFetchRequest * request = [[NSFetchRequest alloc]
                                initWithEntityName:@"City"];
    return [[self context] executeFetchRequest:request error:nil];
}

+(NSManagedObjectContext *) context
{
    return [ [self appDelegate] managedObjectContext];
}

@end
