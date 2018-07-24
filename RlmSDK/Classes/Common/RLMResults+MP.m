//
//  RLMResults+MP.m
//  RlmSDK
//
//  Created by Manh Pham on 7/12/18.
//

#import "RLMResults+MP.h"

@implementation RLMResults (MP)
- (instancetype)copyWithZone:(NSZone *)zone {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];
    for (RLMObject *object in self) {
        [array addObject:object.copy];
    }
    return array.copy;
}
@end
