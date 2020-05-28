#import "SvipeAuth.h"
@import SvipeKit;
@implementation SvipeAuth

RCT_EXPORT_MODULE()

SvipeAuthenticator *auth;
// Example method
// See // https://facebook.github.io/react-native/docs/native-modules-ios
RCT_REMAP_METHOD(multiply,
                 multiplyWithA:(nonnull NSNumber*)a withB:(nonnull NSNumber*)b
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)
{
    auth = [[SvipeAuthenticator alloc] init];

    [auth scanDocument:^(Passport *passport, NSError *error){
        NSNumber *result = @([a floatValue] * [b floatValue]);
        resolve(result);
    }];
    
    
}

@end
