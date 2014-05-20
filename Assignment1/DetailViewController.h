//
//  DetailViewController.h
//  Assignment1
//
//  Created by Michael Kahane on 4/1/13.
//  Copyright (c) 2013 Michael Kahane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Restaurant.h"

@interface AddressAnnotation : NSObject <MKAnnotation>
{
    CLLocationCoordinate2D coordinate;
    
    NSString *title;
    NSString *subTitle;
}

@end

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (weak, nonatomic) IBOutlet UILabel* entreeLabel;
@property (weak, nonatomic) IBOutlet UILabel* appetizerLabel;
@property (weak, nonatomic) IBOutlet UILabel* wineLabel;
@property (weak, nonatomic) IBOutlet UILabel* dessertLabel;
@property (weak, nonatomic) IBOutlet UILabel* subtotalLabel;
@property (weak, nonatomic) IBOutlet UILabel* taxLabel;
@property (weak, nonatomic) IBOutlet UILabel* tipLabel;
@property (weak, nonatomic) IBOutlet UILabel* cuisineLabel;
@property (weak, nonatomic) IBOutlet UILabel* stepperValueLabel;

@property (strong, nonatomic) IBOutlet UIImageView* creditCardView;
@property (strong, nonatomic) IBOutlet UIImageView* mainImageView;


@property (weak, nonatomic) IBOutlet UIStepper* peopleStepper;

@property (weak, nonatomic) IBOutlet MKMapView* mapView;


@property (weak, nonatomic) AddressAnnotation* addAnnotation;





@property Restaurant* chaoThai;
@property Restaurant* unionSquareCafe;
@property Restaurant* seva;


- (IBAction)pressButton:(id)sender;

- (IBAction)enlargeImage:(id)sender;

- (IBAction)stepperValueChanged:(id)sender;

- (IBAction) showAddress;


-(void) displayReceipt:(Restaurant *) myRestaurant;
-(void) displayMap:(Restaurant *) myRestaurant;


@end
