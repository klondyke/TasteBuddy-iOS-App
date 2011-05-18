//
//  DishHeaderCell.m
//  iRestaurant
//
//  Created by Josh Timonen on 4/15/11.
//  Copyright 2011 N/A. All rights reserved.
//

#import "DishHeaderCell.h"
#import "MenuItem.h"
#import "UIImageView+WebCache.h"
#import "RatingView.h"
#import "Restaurant.h"

#import "IGUIScrollViewImage.h"
#import <QuartzCore/QuartzCore.h>

@implementation DishHeaderCell

@synthesize name, price, ratingView, restaurantName, svimage, viewForScrollView, singleImageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        name = [[UILabel alloc]init];
        name.frame = CGRectMake(10, 7, 240, 20);
        name.adjustsFontSizeToFitWidth = TRUE;
        name.textColor = [[UIColor alloc] initWithRed:0.0 / 255 green:0.0 / 255 blue:0.0 / 255 alpha:1.0];
		name.backgroundColor = [UIColor clearColor];
		name.font = [UIFont boldSystemFontOfSize:18];
        name.shadowColor = [UIColor whiteColor];
        name.shadowOffset = CGSizeMake(0,1);
        [self.contentView addSubview:name];
        
        UILabel *byLabel = [[UILabel alloc]init];
        byLabel.frame = CGRectMake(10, 30, 30, 20);
        byLabel.textColor = [[UIColor alloc] initWithRed:0.0 / 255 green:0.0 / 255 blue:0.0 / 255 alpha:1.0];
		byLabel.backgroundColor = [UIColor clearColor];
		byLabel.font = [UIFont italicSystemFontOfSize:14];
        byLabel.shadowColor = [UIColor whiteColor];
        byLabel.shadowOffset = CGSizeMake(0,1);
        byLabel.text = @"by";
        [self.contentView addSubview:byLabel];
        [byLabel release];

        restaurantName = [[UILabel alloc]init];
        restaurantName.frame = CGRectMake(30, 30, 280, 20);
        restaurantName.textColor = [[UIColor alloc] initWithRed:0.0 / 255 green:0.0 / 255 blue:0.0 / 255 alpha:1.0];
		restaurantName.backgroundColor = [UIColor clearColor];
		restaurantName.font = [UIFont systemFontOfSize:15];
        restaurantName.shadowColor = [UIColor whiteColor];
        restaurantName.shadowOffset = CGSizeMake(0,1);
        [self.contentView addSubview:restaurantName];
        
        ratingView = [[RatingView alloc] initWithStarSize:20 andLabelVisible:YES];
        ratingView.frame = CGRectMake(10, 60, 100, 20);
        [self.contentView addSubview:ratingView];

        price = [[UILabel alloc]init];
        price.frame = CGRectMake(260, 7, 50, 20);
        price.textAlignment = UITextAlignmentCenter;
        price.textColor = [UIColor darkGrayColor];
		price.backgroundColor = [UIColor clearColor];
		price.font = [UIFont systemFontOfSize:16];
        price.shadowColor = [UIColor whiteColor];
        price.shadowOffset = CGSizeMake(0,1);
        [self.contentView addSubview:price];
        
        self.selectionStyle = UITableViewCellEditingStyleNone;   
        
       
    }
    return self;
}

-(void)loadMenuItem:(MenuItem *)menu_item andRestaurant:(Restaurant *)restaurant
{
    name.text = [menu_item.name retain];
    restaurantName.text = [restaurant.name retain];
    price.text = [NSString stringWithFormat:@"$%.2f", menu_item.price];
    
    [ratingView loadRating:menu_item.rating];
    NSMutableArray *arrayOfURLStrings = [[NSMutableArray alloc]init];
    for (NSDictionary *pictDict in menu_item.pictures) {
        [arrayOfURLStrings addObject:[pictDict objectForKey:@"300px"]];
    }
    
    NSLog(@"arrayOfURLStrings: %@", arrayOfURLStrings);
    
    UIImage *noImage = [UIImage imageNamed:@"no-image-300.png"];
    NSMutableArray *imageViewArray = [[NSMutableArray alloc]init];
    
    for (int i=0; i < [arrayOfURLStrings count]; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        [imageView setImageWithURL:[NSURL URLWithString:[arrayOfURLStrings objectAtIndex:i]] placeholderImage:noImage];
        [imageViewArray addObject:imageView];
    }
        
    if ([arrayOfURLStrings count] == 0) {
        singleImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 85, 300, 300)];
        singleImageView.image = noImage;
        singleImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        singleImageView.layer.borderWidth = 1;
        [self.contentView addSubview:singleImageView];
        
    } else if ([arrayOfURLStrings count] == 1) {
        singleImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 85, 300, 300)];
        [singleImageView setImageWithURL:[NSURL URLWithString:[arrayOfURLStrings objectAtIndex:0]] placeholderImage:noImage];
        singleImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        singleImageView.layer.borderWidth = 1;
        [self.contentView addSubview:singleImageView];
        
    } else {
        
        for (UIView *view in self.contentView.subviews) {
            if (view == singleImageView) {
                [singleImageView removeFromSuperview];
            }
        }
        
        viewForScrollView = [[UIView alloc]initWithFrame:CGRectMake(10, 85, 300, 300)];
        svimage = [[IGUIScrollViewImage alloc] init];  
        [svimage setContentArray:imageViewArray]; 
        [svimage setBackGroudColor:[UIColor clearColor]];
        [svimage setWidth:300 andHeight:300];
        [svimage enablePageControlOnBottom];  
        svimage.scrollView.showsHorizontalScrollIndicator = FALSE;
        viewForScrollView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        viewForScrollView.layer.borderWidth = 1;
        [viewForScrollView addSubview:[svimage getWithPosition:0]];
        [self.contentView addSubview:viewForScrollView];
    }
     
    
}

-(void)cameraButtonPressed:(id)sender {
    //[takePhoto loadPhotoForRestaurant:restaurant];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [singleImageView release];
    [price release];
    [ratingView release];
    [name release];
    [restaurantName release];
    [svimage release];
    [viewForScrollView release];
    [super dealloc];
}

@end
