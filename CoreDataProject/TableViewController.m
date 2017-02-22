//
//  TableViewController.m
//  CoreDataProject
//
//  Created by Nagam Pawan on 9/29/16.
//  Copyright © 2016 Nagam Pawan. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"
#import "AppDelegate.h"
#import "Entity.h"
#import "TableViewCell.h"

@interface TableViewController ()<NSFetchedResultsControllerDelegate, UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) NSFetchedResultsController *fetchResultController;
@end

@implementation TableViewController
@dynamic tableView;
-(NSPersistentContainer *)persistentContainer{
    return ((AppDelegate *)[UIApplication sharedApplication].delegate).persistentContainer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"Entity"];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
    self.fetchResultController = [[NSFetchedResultsController alloc]initWithFetchRequest:fetchRequest managedObjectContext:self.persistentContainer.viewContext sectionNameKeyPath:nil cacheName:nil];
    self.fetchResultController.delegate = self;
    [self.fetchResultController performFetch:nil];
    self.tableView.dataSource = self;
    [self.tableView reloadData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.fetchResultController.sections[0] numberOfObjects];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    id object = [[self fetchResultController] objectAtIndexPath:indexPath];
    [cell.nameLabel setText:[NSString stringWithFormat:@"%@",[object valueForKey:@"name"]]];
    [cell.ageLabel setText:[NSString stringWithFormat:@"%@", [object valueForKey:@"age"]]];
    [cell.companyLabel setText:[NSString stringWithFormat:@"%@", [object valueForKey:@"company"]]];
    [cell.idLabel setText:[NSString stringWithFormat:@"%@", [object valueForKey:@"id"]]];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
