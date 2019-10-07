//
//  JLEntry.h
//  Journal-C
//
//  Created by Jordan Lamb on 10/7/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JLEntry : NSObject

@property (nonatomic, copy, readonly) NSString * title;
@property (nonatomic, copy, readonly) NSString * body;
@property (nonatomic, copy, readonly) NSDate * timestamp;

- (instancetype)initWithTitle:(NSString *) title
                         body:(NSString *) body;

@end

NS_ASSUME_NONNULL_END
