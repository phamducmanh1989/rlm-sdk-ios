//
//  RlmConstants.h
//  Pods
//
//  Created by Manh Pham on 7/24/18.
//

#ifndef RlmConstants_h
#define RlmConstants_h

typedef NS_ENUM(NSUInteger, RlmSDKErrorCode){
    kRlmSDKErrorNotFound = 1,
};

extern NSString* const kRlmSDKErrorDomain;

#define __RLM_LIBRARY_ERROR(__code, message) \
        [NSError errorWithDomain:kRlmSDKErrorDomain code: __code userInfo:@{ NSLocalizedDescriptionKey: message}]


#endif /* RlmConstants_h */
