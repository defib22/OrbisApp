//
//  BaseBO.h
//  AskMePay
//
//  Created by Kuldeep Saini on 26/07/15.
//  Copyright (c) 2015 Kuldeep Saini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseBO : NSObject

-(NSString*)checkNullValue:(NSString*)text;

-(NSString*)getDateInStringFormatFrom:(NSString*)dt;

-(NSString*)getTimeInStringFormatFrom:(NSString*)dt;


-(NSString*)getDateTimeInStringFormatFrom:(NSDate*)dt;

@end
