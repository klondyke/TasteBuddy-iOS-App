//
//  ProfilePhotoCell.m
//  iRestaurant
//
//  Created by Josh Timonen on 5/4/11.
//  Copyright 2011 N/A. All rights reserved.
//

#import "ProfilePhotoCell.h"


@implementation ProfilePhotoCell
@synthesize imageView, restaurantLabel, pictureCountLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.selectionStyle = UITableViewCellSelectionStyleGray;
        
        imageView = [[UIImageView alloc]init];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        imageView.frame = CGRectMake(10, 10, 65, 65);
        [self.contentView addSubview:imageView];
        
        restaurantLabel = [[UILabel alloc]init];
        restaurantLabel.frame = CGRectMake(85, 10, 250, 25);
        restaurantLabel.textColor = [UIColor blackColor];
        restaurantLabel.backgroundColor = [UIColor clearColor];
        restaurantLabel.font = [UIFont boldSystemFontOfSize:22];
        [self.contentView addSubview:restaurantLabel];
        
        pictureCountLabel = [[UILabel alloc]init];
        pictureCountLabel.frame = CGRectMake(85, 35, 250, 25);
        pictureCountLabel.textColor = [UIColor blackColor];
        pictureCountLabel.backgroundColor = [UIColor clearColor];
        pictureCountLabel.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:pictureCountLabel];


    }
    return self;
}

-(void) setLabels {
    imageView.image = [UIImage imageNamed:@"pizza.png"];
    restaurantLabel.text = @"Ballydoyle Pub";
    int pictureCount = 3;
    pictureCountLabel.text = [NSString stringWithFormat:@"%i pictures", pictureCount];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [imageView release];
    [restaurantLabel release];
    [pictureCountLabel release];
    [super dealloc];
}

@end
