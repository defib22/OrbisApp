//
//  CustomAnnotationView.m
//  OrbisApp
//
//  Created by Kuldeep Saini on 31/08/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "CustomAnnotationView.h"

@implementation CustomAnnotationView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithAnnotation:(id <MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier

{
    
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    
    if (self)
        
    {
        
        // Set the frame size to the appropriate values.
        
        CGRect  myFrame = self.frame;
        
        myFrame.size.width = 40;
        
        myFrame.size.height = 40;
        
        self.frame = myFrame;
        
        
        
        // The opaque property is YES by default. Setting it to
        
        // NO allows map content to show through any unrendered parts of your view.
        
        self.opaque = NO;
        
    }
    
    return self;
    
}
@end
