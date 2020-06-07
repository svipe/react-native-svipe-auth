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
    dispatch_async(dispatch_get_main_queue(), ^{
        [auth scanDocument:^(Passport *passport, NSError *error) {
            NSLog(@"%@", passport, error);
            if (error == nil) {
                NSDictionary<NSString *,id> *json = [passport json];
                resolve(json);
            } else {
                 reject(@"error", @"error description", error);
            }
        }];
    });
}

@end
