//
//  JLEntryListTableViewController.m
//  Journal-C
//
//  Created by Jordan Lamb on 10/7/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

#import "JLEntryListTableViewController.h"
#import "JLEntryController.h"
#import "JLEntryDetailViewController.h"

@interface JLEntryListTableViewController ()

@end

@implementation JLEntryListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return JLEntryController.sharedController.entries.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    JLEntry *entry = JLEntryController.sharedController.entries[indexPath.row];
    cell.textLabel.text = entry.title;
    return cell;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        JLEntry *entry = JLEntryController.sharedController.entries[indexPath.row];
        [JLEntryController.sharedController removeEntry:entry];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"toEntryDetailVC"]) {
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        JLEntryDetailViewController *destination = segue.destinationViewController;
        JLEntry *entry = JLEntryController.sharedController.entries[[path row]];
        destination.entry = entry;
    };
}

@end
