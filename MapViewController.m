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

@interface MapViewController () <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *coordinateLabel;

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
    self.mapView.delegate = self;
    self.coordinateLabel.text = [NSString stringWithFormat:@"Lat: %f // lon:%f",self.mapView.centerCoordinate.latitude , self.mapView.centerCoordinate.longitude ];
}
- (IBAction)addLocation:(id)sender {
    City * newCity = [City newCity];
    newCity.latitude = @(self.mapView.centerCoordinate.latitude);
    newCity.longitude= @(self.mapView.centerCoordinate.longitude);
    [City saveChanges];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MKMapViewDelegate
-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    self.coordinateLabel.text = [NSString stringWithFormat:@"Lat: %f // lon:%f",self.mapView.centerCoordinate.latitude , self.mapView.centerCoordinate.longitude ];
}
@end
