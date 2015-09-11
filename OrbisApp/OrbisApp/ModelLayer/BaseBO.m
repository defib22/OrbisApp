//
//  BaseBO.m
//  AskMePay
//
//  Created by Kuldeep Saini on 26/07/15.
//  Copyright (c) 2015 Kuldeep Saini. All rights reserved.
//

#import "BaseBO.h"

@implementation BaseBO

-(NSString*)checkNullValue:(NSString*)text
{
    if([text isKindOfClass:[NSNull class]] || [text isEqualToString:@"<null>"])
    {
        text = @"";
    }
    return text;
}

-(NSString*)getDateInStringFormatFrom:(NSString*)dt
{
    NSDateFormatter *dateformater = [[NSDateFormatter alloc] init];
    [dateformater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *dtTemp = [dateformater dateFromString:dt];
    [dateformater setDateFormat:@"dd.MM.yyyy"];
    return [dateformater stringFromDate:dtTemp];
}

-(NSString*)getTimeInStringFormatFrom:(NSString*)dt
{
    NSDateFormatter *dateformater = [[NSDateFormatter alloc] init];
    [dateformater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *dtTemp = [dateformater dateFromString:dt];
    [dateformater setDateFormat:@"hh:mm a"];
    return [dateformater stringFromDate:dtTemp];
}


-(NSString*)getDateTimeInStringFormatFrom:(NSDate*)dt
{
    NSDateFormatter *dateformater = [[NSDateFormatter alloc] init];
    [dateformater setDateFormat:@"yyyy-mm-dd hh:mm:ss"];
    return [dateformater stringFromDate:dt];
}



@end
