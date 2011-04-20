//
//  RestaurantPhoneCell.h
//  iRestaurant
//
//  Created by Josh Timonen on 4/14/11.
//  Copyright 2011 N/A. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Restaurant;

@interface RestaurantPhoneCell : UITableViewCell {
    UILabel *phone;
    UIButton *phoneButton;
}

@property (nonatomic, retain) UILabel *phone;
@property (nonatomic, retain) UIButton *phoneButton;

-(void)loadRestaurant:(Restaurant *)restaurant;

@end
