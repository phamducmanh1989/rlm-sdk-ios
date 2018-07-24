//
//  RLMArray+MP.m
//  RlmSDK
//
//  Created by Manh Pham on 7/16/18.
//

#import "RLMArray+MP.h"

@implementation RLMArray (MP)
-(NSArray *)toArray {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];
    for (RLMObject *object in self) {
        [array addObject:object.copy];
    }
    return array.copy;
}
@end
