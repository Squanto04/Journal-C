//
//  JLEntryDetailViewController.m
//  Journal-C
//
//  Created by Jordan Lamb on 10/7/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

#import "JLEntryDetailViewController.h"
#import "JLEntryController.h"

@interface JLEntryDetailViewController ()

@end

@implementation JLEntryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateDesign];
    [self updateViews];
}

- (IBAction)clearTitleButtonTapped:(UIButton *)sender {
    _titleTextField.text = @"";
}

- (IBAction)clearBodyButtonTapped:(UIButton *)sender {
    _bodyTextView.text = @"";
}

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    if (_entry) {
        _entry.title = self.titleTextField.text;
        _entry.body = self.bodyTextView.text;
        _entry.timestamp = [NSDate date];
    } else {
        [JLEntryController.sharedController addNewEntryWithTitle:_titleTextField.text body:_bodyTextView.text timestamp:[NSDate date]];
    }
    
    [self.navigationController popViewControllerAnimated:true];
}

- (void)textFieldShouldReturn{
    [_titleTextField resignFirstResponder];
    [_bodyTextView resignFirstResponder];
}

- (void)updateDesign{
    _bodyTextView.layer.borderWidth = 0.5;
    _bodyTextView.layer.cornerRadius = 5;
}

- (void)updateViews{
    if (_entry) {
        _titleTextField.text = _entry.title;
        _bodyTextView.text = _entry.body;
    }
}

- (void)setEntry:(JLEntry *)entry
{
    if (entry != _entry) {
        _entry = entry;
        [self updateViews];
    }
}

@end
