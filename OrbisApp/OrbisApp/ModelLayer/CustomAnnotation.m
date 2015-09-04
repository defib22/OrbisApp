//
//  CustomAnnotation.m
//  OrbisApp
//
//  Created by Kuldeep Saini on 31/08/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "CustomAnnotation.h"

@implementation CustomAnnotation

- (id)initWithDictionary:(NSDictionary *)dictionary {
    
    NSDictionary * coordinateDictionary = [dictionary objectForKey:@"coordinates"];
    
    return [self initWithCoordinates:CLLocationCoordinate2DMake([[coordinateDictionary objectForKey:@"latitude"] doubleValue], [[coordinateDictionary objectForKey:@"longitude"] doubleValue])
                               title:[dictionary objectForKey:@"name"]
                            subtitle:nil];
}

- (id)initWithCoordinates:(CLLocationCoordinate2D)location title:(NSString *)title subtitle:(NSString *)subtitle {
    self = [super init];
    if (self != nil) {
        _coordinate = location;
        _title = title;
        _subtitle = subtitle;
    }
    return self;
}

@end

