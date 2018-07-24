//
//  RLMRealm+MP.m
//  RlmSDK-RlmSDK
//
//  Created by Manh Pham on 7/24/18.
//

#import "RLMRealm+MP.h"
#import "RlmConstants.h"
#import <ReactiveObjC/ReactiveObjc.h>
@implementation RLMRealm (MP)
+(RACSignal<NSArray*>*)rac_observer:(Class)clazz predicate:(NSPredicate *)predicate {
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        RLMNotificationToken *token = [predicate == nil
                                       ? [clazz performSelector:@selector(allObjects)]
                                       : [clazz performSelector:@selector(objectsWithPredicate:) withObject:predicate]
                                       addNotificationBlock:^(RLMResults * _Nullable results, RLMCollectionChange * _Nullable change, NSError * _Nullable error) {
            if (error) {
                [subscriber sendError:error];
            } else {
                [subscriber sendNext:results.copy];
            }
        }];
        return [RACDisposable disposableWithBlock:^{
            [token invalidate];
        }];
    }];
}

+(RACSignal *)rac_addOrUpdateObject:(RLMObject *)object {
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSError *__error = nil;
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm addOrUpdateObject:object];
        [realm commitWriteTransaction:&__error];
        if (__error) {
            [subscriber sendError:__error];
        } else {
            [subscriber sendNext:object.copy];
            [subscriber sendCompleted];
        }
        
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
}

+(RACSignal *)rac_deleteObjectById:(NSString *)_id withClass:(Class)clazz {
    @weakify(self);
    return [[self __rac_findById:_id withClass:clazz] flattenMap:^__kindof RACSignal * _Nullable(RLMObject*  _Nullable value) {
        @strongify(self);
        return [self rac_deleteObject:value];
    }];
}
+(RACSignal *)rac_deleteObject:(RLMObject *)object {
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSError *__error = nil;
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm deleteObject:object];
        [realm commitWriteTransaction:&__error];
        if (__error) {
            [subscriber sendError:__error];
        } else {
            [subscriber sendNext:@YES];
            [subscriber sendCompleted];
        }
        
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
}
+(RACSignal *)rac_findById:(NSString *)_id withClass:(Class)clazz {
    return [[self __rac_findById:_id withClass:clazz] map:^id _Nullable(id  _Nullable value) {
        return [value copy];
    }];
}
+(RACSignal *)__rac_findById:(NSString *)_id withClass:(Class)clazz {
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        RLMResults *objects = [clazz performSelector:@selector(objectsWithPredicate:) withObject:[NSPredicate predicateWithFormat:@"id == %@", _id]];
        
        if (!objects.firstObject) {
            [subscriber sendError:__RLM_LIBRARY_ERROR(kRlmSDKErrorNotFound, @"Not found")];
        } else {
            [subscriber sendNext:objects.firstObject];
            [subscriber sendCompleted];
        }
        
        
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
}

@end
