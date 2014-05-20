//
//  Restaurant.h
//  Assignment1
//
//  Created by Michael Kahane on 4/8/13.
//  Copyright (c) 2013 Michael Kahane. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Restaurant : NSObject

@property NSString* restaurantTitle;
@property NSString* cuisineType;
@property int numberOfPeople;
@property float entreePrice, appetizerPrice, winePrice, dessertPrice;
@property float totalEntreePrice, totalAppetizerPrice, totalWinePrice, totalDessertPrice;
@property int numberOfAppetizers, numberOfWineBottles;
@property float tax,tip,subtotal;
@property BOOL creditCards;
@property NSString* imageFileName;
-(float) priceOfDinnerForGuests;

//map stuff
@property float longitude, latitude;


@end