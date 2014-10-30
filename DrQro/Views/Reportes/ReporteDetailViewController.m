//
//  ReporteDetailViewController.m
//  DrQro
//
//  Created by Diego Serrano on 10/20/14.
//  Copyright (c) 2014 Diego Serrano. All rights reserved.
//

#import "ReporteDetailViewController.h"

@interface ReporteDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *coverImage;
@property (weak, nonatomic) IBOutlet UIImageView *circleImageView;
@property (weak, nonatomic) IBOutlet UILabel *diaLabel;
@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UILabel *abcLabel;
@property (weak, nonatomic) IBOutlet UILabel *colorLabel;
@property (weak, nonatomic) IBOutlet UILabel *peligroLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipoLabel;
@property (weak, nonatomic) IBOutlet UITextView *reporteTextView;

@end

@implementation ReporteDetailViewController

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
    //self.diaLabel.text = [self.object[@"updatedAt"] stringValue];
    self.idLabel.text = self.object[@"code"];
    self.abcLabel.text = self.object[@"abc"];
    self.colorLabel.text = self.object[@"color"];
    //self.peligroLabel.text = [self.object[@"peligro"] stringValue]; //BOOL
    self.tipoLabel.text = self.object[@"tipo"];
    self.reporteTextView.text = self.object[@"decripcion"];
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
