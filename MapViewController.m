//
//  MapViewController.m
//  Xproj
//
//  Created by Etudiant on 16/05/2014.
//  Copyright (c) 2014 Etudiant. All rights reserved.
//

#import "MapViewController.h"
#import "City+CRUD.h"
@import MapKit;

@interface MapViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MapViewController

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
- (IBAction)addLocation:(id)sender {
    City * newCity = [City newCity];
    newCity.latitude = @(self.mapView.centerCoordinate.latitude);
    newCity.longitude= @(self.mapView.centerCoordinate.longitude);
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
