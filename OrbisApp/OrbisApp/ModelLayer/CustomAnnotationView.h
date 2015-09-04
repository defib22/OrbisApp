//
//  CustomAnnotationView.h
//  OrbisApp
//
//  Created by Kuldeep Saini on 31/08/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface CustomAnnotationView : MKAnnotationView

- (id)initWithAnnotation:(id <MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier;

@end
