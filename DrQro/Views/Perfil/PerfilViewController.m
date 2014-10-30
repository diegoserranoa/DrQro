//
//  PerfilViewController.m
//  DrQro
//
//  Created by Diego Serrano on 10/30/14.
//  Copyright (c) 2014 Diego Serrano. All rights reserved.
//

#import "PerfilViewController.h"
#import "PerfilTableViewCell.h"

@interface PerfilViewController ()

@property (strong, nonatomic) NSArray *sectionOne;
@property (strong, nonatomic) NSArray *sectionTwo;

@end

@implementation PerfilViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.sectionOne = @[@"direccion", @"email", @"telefono", @"codigo"];
    self.sectionTwo = @[@"username", @"password"];
    
    [self.tableView setBackgroundColor:[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0]];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.sectionOne.count;
    } else {
        return self.sectionTwo.count;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PerfilTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"perfilCell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor clearColor];
    
    if (indexPath.section == 0) {
        [cell.perfilImageView setImage:[UIImage imageNamed:self.sectionOne[indexPath.row]]];
        cell.perfilLabel.text = [[PFUser currentUser] objectForKey:self.sectionOne[indexPath.row]];
    } else {
        [cell.perfilImageView setImage:[UIImage imageNamed:self.sectionTwo[indexPath.row]]];
        cell.perfilLabel.text = [[PFUser currentUser] objectForKey:self.sectionTwo[indexPath.row]];
        if ([self.sectionTwo[indexPath.row] isEqualToString:@"password"]) {
            cell.perfilLabel.text = @"•••••••••";
        }
    }
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
