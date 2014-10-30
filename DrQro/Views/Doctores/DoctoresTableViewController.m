//
//  DoctoresTableViewController.m
//  DrQro
//
//  Created by Diego Serrano on 10/20/14.
//  Copyright (c) 2014 Diego Serrano. All rights reserved.
//

#import "DoctoresTableViewController.h"
#import "DoctorDetailViewController.h"

@interface DoctoresTableViewController ()

@end

@implementation DoctoresTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Parse

-(PFQuery *)queryForTable
{
    PFQuery * query = [PFQuery queryWithClassName:@"Doctores"];
    
    [query orderByAscending:@"name"];
    
    if (self.objects.count == 0) {
        [query setCachePolicy:kPFCachePolicyCacheElseNetwork];
    }
    
    return query;
}

-(void)objectsDidLoad:(NSError *)error
{
    [super objectsDidLoad:error];
}

#pragma mark - Table View Data Source

-(PFTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object
{
    PFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"doctoresCell"];
    
    cell.textLabel.text = object[@"name"];
    
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"doctorSegue"]) {
        DoctorDetailViewController *ddvc = [segue destinationViewController];
        ddvc.object = [self.objects objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    }
    
}

@end
