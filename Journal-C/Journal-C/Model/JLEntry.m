//
//  JLEntry.m
//  Journal-C
//
//  Created by Jordan Lamb on 10/7/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

#import "JLEntry.h"

@implementation JLEntry

- (instancetype)initWithTitle:(NSString *)title body:(NSString *)body timestamp:(NSDate *)timestamp
{
    self = [super init];
    if (self)
    {
        _title = title;
        _body = body;
        _timestamp = [NSDate new];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[titleKey];
    NSString *body = dictionary[bodyKey];
    NSDate *timestamp = dictionary[timeStampKey];
    return [self initWithTitle:title body:body timestamp:timestamp];
}

- (NSDictionary *)dictionaryCopy
{
    return @{titleKey: self.title,
             bodyKey: self.body,
             timeStampKey: self.timestamp};
}

- (BOOL)isEqual:(id)object
{
    if (![object isKindOfClass:[JLEntry class]]) { return NO; }
    // Shortcut to comparing all properties one by one. We let NSDictionary do it for us
    return [[self dictionaryCopy] isEqualToDictionary:[(JLEntry *)object dictionaryCopy]];
}
@end
