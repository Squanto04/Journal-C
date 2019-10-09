//
//  JLEntryDetailViewController.h
//  Journal-C
//
//  Created by Jordan Lamb on 10/7/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JLEntry.h"

NS_ASSUME_NONNULL_BEGIN

@interface JLEntryDetailViewController : UIViewController

@property (strong, nonatomic) JLEntry *entry;

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;

@end

NS_ASSUME_NONNULL_END
