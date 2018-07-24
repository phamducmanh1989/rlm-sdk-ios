//
//  RLMRealm+MP.h
//  RlmSDK-RlmSDK
//
//  Created by Manh Pham on 7/24/18.
//

#import <Realm/Realm.h>
@class RACSignal;
@interface RLMRealm (MP)
-(RACSignal<NSArray*>*)rac_observer:(Class)clazz predicate:(NSPredicate *)predicate ;
-(RACSignal *)rac_addOrUpdateObject:(RLMObject *)object;
-(RACSignal *)rac_deleteObjectById:(NSString *)_id withClass:(Class)clazz;
-(RACSignal *)rac_deleteObject:(RLMObject *)object;
-(RACSignal *)rac_findById:(NSString *)_id withClass:(Class)clazz;
@end
