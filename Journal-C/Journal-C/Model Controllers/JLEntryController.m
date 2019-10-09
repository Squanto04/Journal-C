//
//  JLEntryController.m
//  Journal-C
//
//  Created by Jordan Lamb on 10/7/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

#import "JLEntryController.h"
#import "JLEntry.h"

static NSString * const EntriesKey = @"entries";

@interface JLEntryController ()

@property (nonatomic, strong) NSMutableArray *internalEntries;

@end

@implementation JLEntryController

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _internalEntries = [NSMutableArray array];
    }
    return self;
}

+ (JLEntryController *) sharedController
{
    static JLEntryController * sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [JLEntryController new];
        [sharedController loadFromPersistentStorage];
    });
    return sharedController;
}

- (void)addNewEntryWithTitle:(NSString *)title body:(NSString *)body timestamp:(NSDate *)timestamp
{
    JLEntry *entry = [[JLEntry alloc] initWithTitle:title body:body timestamp:timestamp];
    [_internalEntries addObject:entry];
}

- (void)removeEntry:(JLEntry *)entry
{
    [_internalEntries removeObject:entry];
}

- (void)saveToPersistentStorage
{
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    for (JLEntry *entry in self.entries) {
        [entryDictionaries addObject:entry.dictionaryCopy];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:EntriesKey];
}

- (void)loadFromPersistentStorage
{
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:EntriesKey];
    for (NSDictionary *dictionary in entryDictionaries) {
        JLEntry *entry = [[JLEntry alloc] initWithDictionary:dictionary];
        [self addEntriesObject:entry];
    }
}

- (NSArray *)entries { return self.internalEntries; }

- (void)addEntriesObject:(JLEntry *)entry
{
    [_internalEntries addObject:entry];
}

- (void)removeEntriesObject:(JLEntry *)entry
{
    [_internalEntries removeObject:entry];
}
@end
