//
//  Restaurant.m
//  Assignment1
//
//  Created by Michael Kahane on 4/8/13.
//  Copyright (c) 2013 Michael Kahane. All rights reserved.
//

#import "Restaurant.h"

@implementation Restaurant


-(float)priceOfDinnerForGuests
{

    
    //Cleanest Method
    self.numberOfAppetizers = ceilf((float) self.numberOfPeople/2);
    self.numberOfWineBottles = ceilf((float) self.numberOfPeople/4);
    
    // Alternate Method
    //  int numberOfWineBottles = _numberOfPeople/4;
    //  int numberOfAppetizers = _numberOfPeople/2;
    //
    //  if(_numberOfPeople%2 != 0)numberOfAppetizers++;
    //  if(_numberOfPeople%4 != 0)numberOfWineBottles++;
    
    self.totalEntreePrice = self.entreePrice*self.numberOfPeople;
    self.totalAppetizerPrice = self.appetizerPrice*self.numberOfAppetizers;
    self.totalWinePrice = self.winePrice*self.numberOfWineBottles;
    self.totalDessertPrice = self.dessertPrice*self.numberOfPeople;
    
    self.subtotal= self.totalEntreePrice+self.totalAppetizerPrice+self.totalWinePrice+self.totalDessertPrice;
    self.tax =  self.subtotal*.08875;
    self.tip = self.subtotal*.20;
    
//    NSLog(@"Subtotal: %f", self.subtotal);
//    NSLog(@"Tax: %f", self.tax);
//    NSLog(@"Tip: %f", self.tip);
    
    return self.subtotal+self.tax+self.tip;
}


@end
