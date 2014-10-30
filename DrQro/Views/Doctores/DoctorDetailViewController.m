//
//  DoctorDetailViewController.m
//  DrQro
//
//  Created by Diego Serrano on 10/20/14.
//  Copyright (c) 2014 Diego Serrano. All rights reserved.
//

#import "DoctorDetailViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface DoctorDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *doctorImagen;
@property (weak, nonatomic) IBOutlet UIImageView *fondoImagen;

@end

@implementation DoctorDetailViewController

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
    
    self.title = self.object[@"name"];
    
    PFFile *image = self.object[@"imagen"];
    [self.doctorImagen sd_setImageWithURL:[NSURL URLWithString:image.url]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
