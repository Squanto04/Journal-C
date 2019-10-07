//
//  JLEntry.m
//  Journal-C
//
//  Created by Jordan Lamb on 10/7/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

#import "JLEntry.h"

@implementation JLEntry

- (instancetype)initWithTitle:(NSString *)title body:(NSString *)body
{
    self = [super init];
    if (self)
    {
        _title = title;
        _body = body;
        _timestamp = [[NSDate alloc] init];
    }
    return self;
}

@end
