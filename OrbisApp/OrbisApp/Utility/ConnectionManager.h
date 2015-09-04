//
//  ConnectionManager.h
//  IBMHRMSIBMHRMSIphone
//
//  Created by Kuldeep Saini on 23/03/15.
//
//

#import <Foundation/Foundation.h>


typedef enum {
 
    REQUEST_LOGIN = 100,
    REQUEST_INIT,
    REQUEST_APP_RESUME,
    REQUEST_GENERATE_OTP,
    REQUEST_GET_ACCESS_TOKEN,
    REQUEST_GET_USER_PROFILE,
    REQUEST_UPDATE_USER_PROFILE,
    REQUEST_WALLET_DETAILS,
    REQUEST_TRANSACTION_LIST,
    REQUEST_TRANSACTION_DETAIL,
    
}REQUEST_TYPE;


#define BASE_URL(xx) [NSString stringWithFormat:@"http://119.82.77.183/askmewallet/restservices/%@",xx]

#define URL_APP_INIT @"init"
#define URL_APP_RESUME @"resume "
#define URL_GENERATE_OTP @"user/signup"
#define URL_LOGIN @"user/login"
#define URL_GET_ACCESS_TOKEN @"user/getAccessToken"
#define URL_GET_USER_PROFILE @"user/profile/"


#define URL_UPDATE_USER_PROFILE @"user/updateProfile/"
#define URL_GET_WALLET_DETAILS @"user/wallet/"
#define URL_GET_TRANSACTIONS @"user/transactions/"
#define URL_TRANSACTION_DETAIL @"user/transactions/%@"
#define URL_TRANSACTION_REJECT @"user/transactions/%@/reject"
#define URL_TRANSACTION_RATE @"user/transactions/%@/rate"




//#define URL_BUSINESS_TYPE @"master/businessType"
//#define URL_SIGN_UP @"user/signup"
//#define URL_CHANGE_PASSWORD @"user/changePassword"
//#define URL_FORGET_PASSWORD @"user/forgetPassword"
//#define URL_CHECK_STATUS @"user/checkStatus"
//#define URL_UPDATE_CUSTOMER @"userprofile/updateCustomer"
//#define URL_UPDATE_MERCHANT @"userprofile/updateMerchant"
//#define URL_WALLET_PROPERTY @"wallet/property"
//#define URL_PAYMENT_COLLECT_REQUEST @"payment/collectRequest"
//#define URL_PAYMENT_CONFIRM @"payment/confirm"
//#define URL_PAYMENT_RATING @"payment/rating"
//#define URL_TRANSACTION_SEARCH @"transaction/search"
//#define URL_TRANSACTION_DETAIL @"transaction/detail"
//#define URL_TRANSACTION_REFUND @"transaction/refund"



@interface ConnectionManager : NSObject


-(void)hitWebServiceForURLWithPostBlock:(BOOL)isPost webServiceURL:(NSString*)url withBody:(NSDictionary*)dictPostBody andTag:(REQUEST_TYPE)tag completionHandler:(void (^)(id object, REQUEST_TYPE tag, NSError* error)) callback;


-(void)hitWebServiceForURLWithHTTPMethod:(NSString*)httpMethod webServiceURL:(NSString *)url withBody:(NSString *)body andTag:(REQUEST_TYPE)tag completionHandler:(void (^)(id object, REQUEST_TYPE tag, NSError* error)) callback;

@end
