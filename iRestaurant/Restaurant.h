//
//  Restaurant.h
//  iRestaurant
//
//  Created by Josh Timonen on 4/12/11.
//  Copyright 2011 N/A. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TaggedObject.h"
#import <MapKit/MapKit.h>

@class Rating;
@class Menu;
@class Hours;

@interface Restaurant : TaggedObject {
    NSString *_id;
    NSString *name;
    NSString *address_1;
    NSString *address_2;
    NSString *city_town;
    NSString *state_province;
    NSString *country;
    NSString *postal_code;
    NSString *neighborhood;
    CLLocationCoordinate2D location;
    NSString *website_url;
    NSString *alcohol_type;
    NSNumber *credit_cards;
    NSArray *cuisine_types;
    NSNumber *delivery;
    NSString *dress_code;
    NSString *group_friendly;
    NSString *kid_friendly;
    NSString *nearest_transit;
    NSNumber *outdoor_seating;
    NSString *parking;
    NSString *phone;
    NSNumber *reservations;
    NSNumber *takeout;
    NSNumber *wheelchair_access;
    NSMutableArray *pictures;
    NSMutableArray *comments;
    float average_meal_price;
    NSNumber *distance;
    BOOL bookmark;
    BOOL menu_present;
    
    NSMutableArray *menu_items;
    
    NSMutableArray *menu_metadata;
    
    Menu *menu;
    
    Rating *rating;
    
    Hours *hours;
}

@property (nonatomic, retain) NSString *_id;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *address_1;
@property (nonatomic, retain) NSString *address_2;
@property (nonatomic, retain) NSString *city_town;
@property (nonatomic, retain) NSString *state_province;
@property (nonatomic, retain) NSString *country;
@property (nonatomic, retain) NSString *postal_code;
@property (nonatomic, retain) NSString *neighborhood;
@property (nonatomic, retain) NSString *website_url;
@property (nonatomic, retain) NSString *alcohol_type;
@property (nonatomic, retain) NSNumber *credit_cards;
@property (nonatomic, retain) NSArray *cuisine_types;
@property (nonatomic, retain) NSNumber *delivery;
@property (nonatomic, retain) NSString *dress_code;
@property (nonatomic, retain) NSString *group_friendly;
@property (nonatomic, retain) NSString *kid_friendly;
@property (nonatomic, retain) NSString *nearest_transit;
@property (nonatomic, retain) NSNumber *outdoor_seating;
@property (nonatomic, retain) NSString *parking;
@property (nonatomic, retain) NSString *phone;
@property (nonatomic, retain) NSNumber *reservations;
@property (nonatomic, retain) NSNumber *takeout;
@property (nonatomic, retain) NSNumber *wheelchair_access;
@property (nonatomic, retain) NSMutableArray *pictures;
@property (nonatomic, retain) NSMutableArray *comments;
@property (nonatomic, assign) float average_meal_price;
@property (nonatomic, retain) NSNumber *distance;
@property (nonatomic, assign) BOOL bookmark;
@property (nonatomic, assign) BOOL menu_present;

@property (nonatomic, retain) NSMutableArray *menu_items;

@property (nonatomic, retain) NSMutableArray *menu_metadata;

@property (nonatomic, retain) Menu *menu;

@property (nonatomic, retain) Rating *rating;

@property (nonatomic, retain) Hours *hours;
@property (nonatomic, assign) CLLocationCoordinate2D location;


-(id) initWithDictionary:(NSDictionary *)restaurantDictionary;

@end
