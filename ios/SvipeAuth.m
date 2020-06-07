#import "SvipeAuth.h"
@import SvipeKit;
@import SvipeCA;
@implementation SvipeAuth

RCT_EXPORT_MODULE()

Authenticator *auth;
// Example method
// See // https://facebook.github.io/react-native/docs/native-modules-ios
RCT_REMAP_METHOD(scanDocument,
                 challenge:(nonnull NSNumber*)a
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)
{
    auth = [[Authenticator alloc] init];

    [auth scanDocument:^(Passport *passport, NSError *error){
        NSDictionary<NSString *,id> *json = [passport json];
        NSNumber *result = @([a floatValue]);
        resolve(result);
    }];
    
}

@end
