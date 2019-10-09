//
//  JLEntryController.h
//  Journal-C
//
//  Created by Jordan Lamb on 10/7/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JLEntry.h"

@interface JLEntryController : NSObject

- (instancetype)init;

@property (nonatomic, strong, readonly) NSArray<JLEntry *> * entries;

+ (JLEntryController *)sharedController;

- (void)addNewEntryWithTitle:(NSString *)title body:(NSString *)body timestamp:(NSDate *)timestamp;
- (void)removeEntry:(JLEntry *) entry;

- (void)saveToPersistentStorage;

@end
