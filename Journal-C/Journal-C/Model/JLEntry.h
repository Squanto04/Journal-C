//
//  JLEntry.h
//  Journal-C
//
//  Created by Jordan Lamb on 10/7/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

static NSString * const titleKey = @"title";
static NSString * const bodyKey = @"body";
static NSString * const timeStampKey = @"timestamp";

@interface JLEntry : NSObject

@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * body;
@property (nonatomic, copy) NSDate * timestamp;

- (instancetype)initWithTitle:(NSString *) title
                         body:(NSString *) body
                    timestamp:(NSDate *) timestamp;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)dictionaryCopy;

@end

NS_ASSUME_NONNULL_END
