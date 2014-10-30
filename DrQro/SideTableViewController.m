//
//  SideTableViewController.m
//  DrQro
//
//  Created by Diego Serrano on 10/30/14.
//  Copyright (c) 2014 Diego Serrano. All rights reserved.
//

#import "SideTableViewController.h"
#import "SidePanelController.h"
#import "UIViewController+JASidePanel.h"

@interface SideTableViewController ()

@end

@implementation SideTableViewController

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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sideCell"];
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Reportes";
            break;
        case 1:
            cell.textLabel.text = @"Doctores";
            break;
        case 2:
            cell.textLabel.text = @"Perfil";
            break;
        case 3:
            cell.textLabel.text = @"Cerrar Sesión";
            break;
        default:
            break;
    }
    // Configure the cell...
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            self.sidePanelController.centerPanel = [self.storyboard instantiateViewControllerWithIdentifier:@"reportesNavigationController"];
            break;
        case 1:
            self.sidePanelController.centerPanel = [self.storyboard instantiateViewControllerWithIdentifier:@"doctoresNavigationController"];
            break;
        case 2:
            self.sidePanelController.centerPanel = [self.storyboard instantiateViewControllerWithIdentifier:@"perfilNavigationController"];
            break;
        case 3:
            if ([PFUser currentUser]) {
                [PFUser logOut];
                [self presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"login"] animated:YES completion:nil];
            }
            break;
        default:
            break;
    }
    [self.sidePanelController showCenterPanelAnimated:YES];
}

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
