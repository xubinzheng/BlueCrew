//-------------------------------------------------------------------------------
// Copyright 2014 IBM Corp. All Rights Reserved
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//-------------------------------------------------------------------------------

#import "IBM_ListViewController.h"
#import "IBM_CreateEditItemViewController.h"
#import "IBM_Item.h"

@interface IBM_ListViewController ()

//IBOutlets from view
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;

// Items in list
@property NSMutableArray *itemList;

// If edit was triggered, the cell being edited.
@property UITableViewCell *editedCell;

@end

@implementation IBM_ListViewController


#pragma mark - View initialization and refreshing
-(void)loadView
{
    [super loadView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.itemList = [[NSMutableArray alloc]init];

    // Setting up the refresh control
    self.refreshControl = [[UIRefreshControl alloc]init];
    self.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"Loading Items"];
    [self.refreshControl addTarget:self action:@selector(handleRefreshAction) forControlEvents:UIControlEventValueChanged];
    
    // Load initial set of items
    [self.refreshControl beginRefreshing];
    [self listItems:^{
        [self.refreshControl endRefreshing];
    }];
}

-(void) viewWillAppear:(BOOL)animated
{
    [self listItems:nil];
}

-(void) handleRefreshAction
{
    [self listItems:^{
        [self.refreshControl performSelectorOnMainThread:@selector(endRefreshing) withObject:nil waitUntilDone:NO];
    }];
}

-(void) reloadLocalTableData
{
    [self.itemList sortUsingComparator:^NSComparisonResult(IBM_Item* item1, IBM_Item* item2) {
        return [item1.name caseInsensitiveCompare:item2.name];
    }];
    
    [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
}

-(void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:YES];
    
    // Disable add button in edit mode
    if (editing) {
        self.addButton.enabled = NO;
    } else {
        self.addButton.enabled = YES;
    }
}

#pragma mark Methods to list, create, update, and delete items
- (void)listItems: (void(^)(void)) cb
{
	IBMQuery *qry = [IBM_Item query];
    [[qry find] continueWithBlock:^id(BFTask *task) {
        if(task.error) {
            NSLog(@"listItems failed with error: %@", task.error);
        } else {
            self.itemList = [NSMutableArray arrayWithArray: task.result];
            [self reloadLocalTableData];
            if(cb){
                cb();
            }

        }
        return nil;
        
    }];
}

- (void) createItem: (IBM_Item*) item
{
    [self.itemList addObject: item];
    [self reloadLocalTableData];
    
    [[item save] continueWithBlock:^id(BFTask *task) {
        if(task.error) {
            NSLog(@"createItem failed with error: %@", task.error);
        }
        return nil;
    }];
    
}

- (void) updateItem: (IBM_Item*) item
{
    self.editedCell.textLabel.text = item.name;
    [[item save] continueWithBlock:^id(BFTask *task) {
        if(task.error) {
             NSLog(@"updateItem failed with error: %@", task.error);
        }
        return nil;
    }];

}

-(void) deleteItem: (IBM_Item*) item
{
    [self.itemList removeObject: item];
    [self reloadLocalTableData];
    [[item delete] continueWithBlock:^id(BFTask *task) {
        if(task.error){
             NSLog(@"deleteItem failed with error: %@", task.error);
        } else {
            [self listItems: nil];
        }
        return nil;
    }];
    
    // Exit edit mode to avoid need to click Done button
    [self.tableView setEditing:NO animated:YES];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.itemList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListItemCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = ((IBM_Item*)self.itemList[indexPath.row]).name;
    return cell;
}

#pragma mark - Navigation to/from Create/Edit View
-(IBAction) updateListWithSegue: (UIStoryboardSegue *)segue
{
    IBM_CreateEditItemViewController *createEditController = [segue sourceViewController];
    if(createEditController.item.name && createEditController.item.name.length > 0){
        if(self.editedCell){
            // Is Update
            [self updateItem: createEditController.item];
        }else{
            // Is Add
            [self createItem: createEditController.item];
        }
    }
    self.editedCell = nil;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UINavigationController *navigationController = (UINavigationController *)segue.destinationViewController;
    IBM_CreateEditItemViewController *createEditController = [[navigationController viewControllers] lastObject];
    if(sender == self.addButton){
        createEditController.item = [[IBM_Item alloc] init];
    }else{
        // is edit so seed the item with the title
        self.editedCell = sender;
        NSIndexPath* indexPath = [self.tableView indexPathForCell: self.editedCell];
        createEditController.item = self.itemList[indexPath.row];
    }
}

#pragma mark - Deleting items
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Perform delete
        [self deleteItem: self.itemList[indexPath.row]];
    }
}

@end
