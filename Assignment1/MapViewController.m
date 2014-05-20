//
//  MapViewController.m
//  Assignment1
//
//  Created by Michael Kahane on 4/22/13.
//  Copyright (c) 2013 Michael Kahane. All rights reserved.
//

#import "MapViewController.h"
#import "Restaurant.h"
#import "MapPin.h"


@interface MapViewController ()


@end

@implementation MapViewController

@synthesize mapview;

-(void) displayMap{
    [self setTitle:@"Seva"];
    
    [mapview setMapType:MKMapTypeStandard];
    [mapview setZoomEnabled:YES];
    [mapview setScrollEnabled:YES];
    
    MKCoordinateRegion region = { {0.0, 0.0 }, {0.0, 0.0 } };
    region.center.latitude = 40.765266;
    region.center.longitude = -73.919492;
    region.span.longitudeDelta = 0.01f;
    region.span.latitudeDelta = 0.01f;
    [mapview setRegion:region animated:YES];
    
    MapPin *temp = [[MapPin alloc] init];
    temp.title = @"Seva";
    temp.subtitle = @"Indian Food";
    temp.coordinate = region.center;
    [mapview addAnnotation:temp];
    
    
}

-(IBAction)getlocation {
    mapview.showsUserLocation = YES;
}
-(IBAction)setMap:(id)sender {
    switch (((UISegmentedControl *) sender).selectedSegmentIndex) {
        case 0:
            mapview.mapType = MKMapTypeStandard;
            break;
        case 1:
            mapview.mapType = MKMapTypeSatellite;
            break;
        case 2:
            mapview.mapType = MKMapTypeHybrid;
            break;
        default:
            break;
    }
}

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
    [self displayMap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
