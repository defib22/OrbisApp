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
    REQUEST_SIGNUP,
    REQUEST_UPDATE_USER,
    REQUEST_CHANGE_PASSWORD,
    REQUEST_GET_USER_PROFILE,
    REQUEST_GET_DRIVER_TYPES,
    REQUEST_GET_INVITE_CODE,
    REQUEST_APPLY_PROMO_CODE,
    REQUEST_FORGOT_PASSWORD,
    
}REQUEST_TYPE;


#define BASE_URL  @"http://www.pinnaclesoln.com/demo/orbis/uber/%@"

//#define URL_LOGIN @"login.php?email=test@test.com&password=123"
//
//#define URL_CHANGE_PASSWORD @"changepassword.php?id=20&old_password=12345&new_password=123&confirm_password=123"
//
//#define URL_SIGNUP @"newregistration.php?firstname=Test&lastname=ghghgh&email=a@a.com&password=gfgfgf&mobile=346546546767&fav_place=ffdsfhfdj&home_address=ghgfhgh&business_address=gfdfdfgf"
//
//
//#define URL_UPDATE_USER @"newregistration.php?firstname=Test&lastname=ghghgh&email=a@a.com&password=gfgfgf&mobile=346546546767&fav_place=ffdsfhfdj&home_address=ghgfhgh&business_address=gfdfdfgf&id=22"
//
//#define URL_GET_USER_PROFILE @"getUserProfileData.php?id=22"
//
//#define URL_GET_DRIVER_TYPES @"getDriveTypes.php"
//
//#define URL_GET_INVITE_CODE @"invite_code.php?id=1"
//
//#define URL_APPLY_PROMO_CODE @"applyPromoCode.php?promoCode=yuuyu"


 
#define URL_LOGIN @"login.php?email=%@&password=%@"

#define URL_FORGOT_PASSWORD @"forgetpassword.php?email=%@"

#define URL_CHANGE_PASSWORD @"changepassword.php?id=%@&old_password=%@&new_password=%@&confirm_password=%@"

#define URL_SIGNUP @"newregistration.php?firstname=%@&lastname=%@&email=%@&password=%@&mobile=%@&fav_place[]=%@&home_address[]=%@&business_address[]=%@"

#define URL_UPDATE_USER @"newregistration.php?firstname=%@&lastname=%@&email=%@&password=%@&mobile=%@&fav_place[]=%@&home_address[]=%@&business_address[]=%@&id=%@"

#define URL_GET_USER_PROFILE @"getUserProfileData.php?id=%@"

#define URL_GET_DRIVER_TYPES @"getDriveTypes.php"

#define URL_GET_INVITE_CODE @"invite_code.php?id=%@"

#define URL_APPLY_PROMO_CODE @"applyPromoCode.php?promoCode=%@"




@interface ConnectionManager : NSObject


-(void)hitWebServiceForURLWithPostBlock:(BOOL)isPost webServiceURL:(NSString *)url andTag:(REQUEST_TYPE)tag completionHandler:(void (^)(id, REQUEST_TYPE, NSError *))callback;


//-(void)hitWebServiceForURLWithHTTPMethod:(NSString*)httpMethod webServiceURL:(NSString *)url withBody:(NSString *)body andTag:(REQUEST_TYPE)tag completionHandler:(void (^)(id object, REQUEST_TYPE tag, NSError* error)) callback;

@end
