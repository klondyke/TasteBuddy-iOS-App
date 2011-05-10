//
//  RestaurantRatingService.m
//  iRestaurant
//
//  Created by Andrew Chalkley on 05/05/2011.
//  Copyright 2011 N/A. All rights reserved.
//

#import "RestaurantRatingService.h"
#import "ASIFormDataRequest.h"
#import "Restaurant.h"
#import "JSON.h"

@implementation RestaurantRatingService

@synthesize delegate;

- (void)dealloc {
    [delegate release];
    [super dealloc];
}

-(id) initWithDelegate:(id <RestaurantRatingServiceDelegate>) restaurantDelegate {
    self = [super init];
    if (self) {
        delegate = restaurantDelegate;
        authTokenRequired = TRUE;
    }
    return self;
}

-(void) rateRestaurant:(Restaurant *) restaurant withRating:(float) rating {
    
    urlString = [NSString stringWithFormat:@"http://monkey.elhideout.org/restaurants/%@/rate.json", restaurant._id];

    [jsonDictionary setObject:[NSNumber numberWithFloat:rating] forKey:@"value"];
    
    [self prepareRequest];
    
}

-(void) performRequest {
    if (request != nil) {
        [request cancel];
        request = nil;
    }
    
    NSString *json = [jsonDictionary JSONRepresentation];
    NSURL *url = [NSURL URLWithString:urlString];
    request = [ASIFormDataRequest requestWithURL:url];
    [request setRequestMethod: @"PUT"];
    [request addRequestHeader:@"Content-Type" value:@"application/json"];
    [request appendPostData:[json dataUsingEncoding:NSUTF8StringEncoding]];
    [request setDelegate:self];
    [request startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request_passed 
{
    NSString *responseString = [request_passed responseString];
    NSLog(@"response string: %@", responseString);
    
    #warning TODO do some stuff with this string
    [delegate doneRating];
    request = nil;
}

@end
