//
//  CustomAnnotation.h
//  OrbisApp
//
//  Created by Kuldeep Saini on 31/08/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

typedef enum{
    
    CAR = 100,
    BIKE,
    CURRENT_LOCATION,
}VEHICLE_TYPE;

@interface CustomAnnotation : NSObject<MKAnnotation>

- (id)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, assign) VEHICLE_TYPE typeOfVehicle;

- (id)initWithCoordinates:(CLLocationCoordinate2D)location title:(NSString *)title subtitle:(NSString *)subtitle;

@end
