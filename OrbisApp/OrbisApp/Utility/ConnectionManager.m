//
//  ConnectionManager.m
//  IBMHRMSIBMHRMSIphone
//
//  Created by Kuldeep Saini on 23/03/15.
//
//

#import "ConnectionManager.h"

#define REQUEST_TIMEOUT 60.0
@implementation ConnectionManager


-(void)hitWebServiceForURLWithPostBlock:(BOOL)isPost webServiceURL:(NSString *)url andTag:(REQUEST_TYPE)tag completionHandler:(void (^)(id, REQUEST_TYPE, NSError *))callback {
    
    
//    NSError *error;
//    NSData *dt = nil;
//    
//    if(dictPostBody != nil){
//    dt = [NSJSONSerialization dataWithJSONObject:dictPostBody options:NSJSONWritingPrettyPrinted error:&error];
//    }
//    
//    NSString *strBody = [[NSString alloc] initWithData:dt encoding:NSUTF8StringEncoding];
//    strBody = [NSString stringWithFormat:@"data=%@",strBody];

    NSString *serviceURL = [NSString stringWithFormat:BASE_URL,url];
    serviceURL = [serviceURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL
                                                                        URLWithString:serviceURL]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:REQUEST_TIMEOUT];
    
    NSLog(@"Request URL = %@",serviceURL);

    [request setHTTPMethod:@"POST"];
//    
//    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
////    [request setValue:AUTHORIZATION_CODE forHTTPHeaderField:@"Authorisation"];
//    [request setValue:[self getTimeStampInUTCFormat] forHTTPHeaderField:@"Timestamp"];
//
//    [request setHTTPBody:[strBody dataUsingEncoding:NSUTF8StringEncoding]];
//    strBody = nil;
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         if ([data length] > 0 && error == nil)
         {
             NSError *e = nil;
             
             id object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&e];
             
             NSLog(@"RESPONSE ---->\n %@", object);
             
             if(!error)
             {
                 callback(object,tag,nil);
             }
             else
             {
                 callback (nil,tag,error);
             }
         }
         else {
             callback(nil,tag,error);
         }
     }];
}



//-(void)hitWebServiceForURLWithHTTPMethod:(NSString*)httpMethod webServiceURL:(NSString *)url withBody:(NSString *)body andTag:(REQUEST_TYPE)tag completionHandler:(void (^)(id, REQUEST_TYPE, NSError *))callback {
//    
//    
//    NSString *strBody = body;
//    
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL
//                                                                        URLWithString:BASE_URL(url)]
//                                    
//                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
//                                    
//                                                       timeoutInterval:REQUEST_TIMEOUT];
//    
//    
//    
//    [request setHTTPMethod:httpMethod];
//    
//    NSString *accessTokenForAuthorization = [NSString stringWithFormat:@"Bearer %@",[[AppSettings sharedInstance] accessToken]];
//    
//    NSLog(@"Request Body = %@",strBody);
//    NSLog(@"Request URL = %@",BASE_URL(url));
//    NSLog(@"accessTokenForAuthorization = %@",accessTokenForAuthorization);
//
//    
//    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//    [request setValue:accessTokenForAuthorization forHTTPHeaderField:@"Authorisation"];
//    [request setValue:[self getTimeStampInUTCFormat] forHTTPHeaderField:@"Timestamp"];
//    
//    [request setHTTPBody:[strBody dataUsingEncoding:NSUTF8StringEncoding]];
//    strBody = nil;
//    
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    
//    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
//     {
//         if ([data length] > 0 && error == nil)
//         {
//             NSError *e = nil;
//             
//             id object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&e];
//             
//             NSLog(@"RESPONSE ---->\n %@", object);
//             
//             if(!error)
//             {
//                 callback(object,tag,nil);
//             }
//             else
//             {
//                 callback (nil,tag,error);
//             }
//         }
//         else {
//             callback(nil,tag,error);
//         }
//     }];
//}
//


//-(NSString*)getTimeStampInUTCFormat{
//    NSString *strDate = @"";
//    NSDateFormatter *df = [[NSDateFormatter alloc] init];
//    [df setDateFormat:@"yyyy'-'MM'-'dd HH':'mm':'ss"];
//    strDate = [df stringFromDate:[NSDate date]];
//    
//    NSLog(@"Date = %@",strDate);
//    return strDate;
//}



@end
