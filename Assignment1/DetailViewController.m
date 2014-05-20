//
//  DetailViewController.m
//  Assignment1
//
//  Created by Michael Kahane on 4/1/13.
//  Copyright (c) 2013 Michael Kahane. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation AddressAnnotation

@synthesize coordinate;

- (NSString *)subtitle
{
   return @"Sub Title";
}
- (NSString *)title
{
    return @"Title";
}

-(id)initWithCoordinate:(CLLocationCoordinate2D) c
{
    coordinate=c;
    NSLog(@"%f,%f",c.latitude,c.longitude);
    return self;
}

@end



@implementation DetailViewController

#pragma mark - Managing the detail item

int numberOfPeople;
- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    /* Assignment 1 Stuff
    // Update the user interface for the detail item.
    self.detailDescriptionLabel.text = [NSString stringWithFormat:@"$%.2f", [self priceOfDinnerForGuests:numberOfPeople withEntreePrice:21.5 withAppetizerPrice:8 withWinePrice:43 withDessertPrice:4.75]];
    self.entreeLabel.text = [NSString stringWithFormat:@"$%.2f * %i = $%.2f", entreePrice, numberOfPeople, totalEntreePrice];
    self.appetizerLabel.text = [NSString stringWithFormat:@"$%.2f * %i = $%.2f", appetizerPrice, numberOfAppetizers, totalAppetizerPrice];
    self.dessertLabel.text = [NSString stringWithFormat:@"$%.2f * %i = $%.2f", dessertPrice, numberOfPeople, totalDessertPrice];
    self.wineLabel.text = [NSString stringWithFormat:@"$%.2f * %i = $%.2f", winePrice, numberOfWineBottles, totalWinePrice];
    self.subtotalLabel.text = [NSString stringWithFormat:@"$%.2f", subtotal];
    self.taxLabel.text = [NSString stringWithFormat:@"$%.2f", tax];
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];

    // %f means replace f with the first thing that comes after it. The .2 restricts the number to two decimal places.
    */
    
    Restaurant* seva = [Restaurant new];
    seva.restaurantTitle = @"Seva";
    seva.cuisineType = @"Indian";
    seva.entreePrice = 14.00;
    seva.appetizerPrice = 7.00;
    seva.dessertPrice = 5.00;
    seva.winePrice = 29.00;
    seva.numberOfPeople = numberOfPeople;
    seva.creditCards = YES;
    seva.imageFileName = @"indian-food.jpg";
    
    Restaurant* caracas = [Restaurant new];
    caracas.restaurantTitle = @"Caracas";
    caracas.cuisineType = @"Venezuelan";
    caracas.entreePrice = 30.00;
    caracas.appetizerPrice = 12.00;
    caracas.dessertPrice = 12.00;
    caracas.winePrice = 39.00;
    caracas.numberOfPeople = numberOfPeople;
    caracas.creditCards = YES;
    caracas.imageFileName = @"arepa.jpeg";

    
    Restaurant* chaoThai = [Restaurant new];
    chaoThai.restaurantTitle = @"Chao Thai";
    chaoThai.cuisineType = @"Thai";
    chaoThai.entreePrice = 21.50;
    chaoThai.appetizerPrice = 8.00;
    chaoThai.dessertPrice = 4.75;
    chaoThai.winePrice = 43.00;
    chaoThai.numberOfPeople = numberOfPeople;
    chaoThai.creditCards = NO;
    chaoThai.imageFileName = @"ThaiFood.jpg";
    
    
//    [self displayReceipt: seva];
}



- (IBAction)pressButton:(id)sender {

    [UIView beginAnimations:@"fadeOut" context:nil];
    [UIView setAnimationDuration:2];
    self.mainImageView.alpha *=0.05;
    [UIView commitAnimations];
}

- (IBAction)enlargeImage:(id)sender {
//    [UIView beginAnimations:@"fadeOut" context:nil];
//    [UIView setAnimationDuration:2];
    [self.mainImageView setFrame:self.view.frame];

//    [UIView commitAnimations];
}

- (IBAction)stepperValueChanged:(id)sender
{
    double stepperValue = self.peopleStepper.value;
    self.stepperValueLabel.text = [NSString stringWithFormat:@"%.f", stepperValue];
    NSLog(@"%.f", stepperValue);
    numberOfPeople=stepperValue;
    [self configureView];
}

- (IBAction) showAddress
{
    
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta=0.2;
    span.longitudeDelta=0.2;
    
    CLLocationCoordinate2D location = self.mapView.userLocation.coordinate;
    
    location.latitude = 38.898748 ;
    location.longitude = -77.037684;
    region.span=span;
    region.center=location;
    
    if(self.addAnnotation != nil)
    {
        [self.mapView removeAnnotation:self.addAnnotation];
       // [self.addAnnotation release];
        self.addAnnotation = nil;
    }
    
    self.addAnnotation = [[AddressAnnotation alloc] initWithCoordinate:location];
    [mapView addAnnotation:addAnnotation];
    
    [mapView setRegion:region animated:TRUE];
    [mapView regionThatFits:region];
    //[mapView selectAnnotation:mLodgeAnnotation animated:YES];
}

-(void) displayReceipt:(Restaurant *) myRestaurant{
   
    self.creditCardView.hidden=!myRestaurant.creditCards;
    [self setTitle:myRestaurant.restaurantTitle];
    self.cuisineLabel.text = [NSString stringWithFormat:@"Cuisine: %@", myRestaurant.cuisineType];
    self.detailDescriptionLabel.text = [NSString stringWithFormat:@"$%.2f", [myRestaurant priceOfDinnerForGuests]];
    self.entreeLabel.text = [NSString stringWithFormat:@"$%.2f * %i = $%.2f", myRestaurant.entreePrice, myRestaurant.numberOfPeople, myRestaurant.totalEntreePrice];
    self.appetizerLabel.text = [NSString stringWithFormat:@"$%.2f * %i = $%.2f", myRestaurant.appetizerPrice, myRestaurant.numberOfAppetizers, myRestaurant.totalAppetizerPrice];
    self.dessertLabel.text = [NSString stringWithFormat:@"$%.2f * %i = $%.2f", myRestaurant.dessertPrice, myRestaurant.numberOfPeople, myRestaurant.totalDessertPrice];
    self.wineLabel.text = [NSString stringWithFormat:@"$%.2f * %i = $%.2f", myRestaurant.winePrice, myRestaurant.numberOfWineBottles, myRestaurant.totalWinePrice];
    self.subtotalLabel.text = [NSString stringWithFormat:@"$%.2f", myRestaurant.subtotal];
    self.taxLabel.text = [NSString stringWithFormat:@"$%.2f", myRestaurant.tax];
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", myRestaurant.tip];
    
    self.mainImageView.image = [UIImage imageNamed:myRestaurant.imageFileName];
}

-(void) displayMap:(Restaurant *) myRestaurant{
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    numberOfPeople=1;
    self.peopleStepper.minimumValue = 1;
    self.peopleStepper.maximumValue = 20;
    self.peopleStepper.stepValue = 1;
    self.stepperValueLabel.text = [NSString stringWithFormat:@"%.f", self.peopleStepper.value];
    
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
