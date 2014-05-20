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
    
    self.seva = [Restaurant new];
    self.seva.restaurantTitle = @"Seva";
    self.seva.cuisineType = @"Indian";
    self.seva.entreePrice = 14.00;
    self.seva.appetizerPrice = 7.00;
    self.seva.dessertPrice = 5.00;
    self.seva.winePrice = 29.00;
    self.seva.numberOfPeople = numberOfPeople;
    self.seva.creditCards = YES;
    self.seva.imageFileName = @"indian-food.jpg";
    self.seva.latitude = 40.765266;
    self.seva.longitude = -73.919492;
    
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
    
    
    [self displayReceipt: self.seva];

}



- (IBAction)pressButton:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:7186264440"]];

}

- (IBAction)enlargeImage:(id)sender {
    
    if(self.enlargeToggle==FALSE){
        self.previous = self.mainImageView.frame;


    [UIView beginAnimations:@"fadeOut" context:nil];
    [UIView setAnimationDuration:2];
    self.creditCardView.hidden = TRUE;
    [self.mainImageView setFrame:self.view.frame];

    [UIView commitAnimations];
        self.enlargeToggle=TRUE;
    }
    else if(self.enlargeToggle==TRUE){
        [UIView beginAnimations:@"fadeOut" context:nil];
        [UIView setAnimationDuration:2];
        [self.mainImageView setFrame:self.previous];
        self.creditCardView.hidden = FALSE;
        [UIView commitAnimations];
        self.enlargeToggle=FALSE;


    }
    
}

- (IBAction)stepperValueChanged:(id)sender
{
    double stepperValue = self.peopleStepper.value;
    self.stepperValueLabel.text = [NSString stringWithFormat:@"%.f", stepperValue];
    NSLog(@"%.f", stepperValue);
    numberOfPeople=stepperValue;
    [self configureView];
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
