//
//  MapViewController.h
//  Assignment1
//
//  Created by Michael Kahane on 4/22/13.
//  Copyright (c) 2013 Michael Kahane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Restaurant.h"

@interface MapViewController : UIViewController

@property (nonatomic, retain) IBOutlet MKMapView *mapview;
-(IBAction)setMap:(id)sender;
-(IBAction)getlocation;
-(void) displayMap:(Restaurant *) myRestaurant;


@end
