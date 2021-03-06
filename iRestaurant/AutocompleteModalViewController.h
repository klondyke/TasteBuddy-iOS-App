//
//  AutocompleteModalViewController.h
//  iRestaurant
//
//  Created by Andrew Chalkley on 19/04/2011.
//  Copyright 2011 N/A. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FindAutocompleteTableViewController;
@class NearAutocompleteTableViewController;
@class AutocompleteService;
@class SearchViewController;

@interface AutocompleteModalViewController : UIViewController {
    IBOutlet UITableView *tableView;
    IBOutlet UIView *searchView;
    IBOutlet UITextField *termField;
    IBOutlet UITextField *nearField;
    IBOutlet UIButton *cancelButton;
    IBOutlet UIButton *nearbyButton;
    IBOutlet UIImageView *whatBGBox;
    IBOutlet UIImageView *whereBGBox;
    
    IBOutlet FindAutocompleteTableViewController *findAutocompleteTableViewController;
    IBOutlet NearAutocompleteTableViewController *nearAutocompleteTableViewController;
    
    AutocompleteService *autocompleteService;
    SearchViewController *searchViewController;
    
    NSString *lastNear;
    bool isFestivalSearch;
    int festivalId;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UIView *searchView;
@property (nonatomic, retain) IBOutlet UITextField *termField;
@property (nonatomic, retain) IBOutlet UITextField *nearField;
@property (nonatomic, retain) IBOutlet UIButton *cancelButton;
@property (nonatomic, retain) IBOutlet UIButton *nearbyButton;
@property (nonatomic, retain) IBOutlet UIImageView *whatBGBox;
@property (nonatomic, retain) IBOutlet UIImageView *whereBGBox;
@property (nonatomic, retain) IBOutlet FindAutocompleteTableViewController *findAutocompleteTableViewController;
@property (nonatomic, retain) IBOutlet NearAutocompleteTableViewController *nearAutocompleteTableViewController;
@property (nonatomic, retain) IBOutlet AutocompleteService *autocompleteService;
@property (nonatomic, retain) IBOutlet SearchViewController *searchViewController;
@property (nonatomic, retain) IBOutlet NSString *lastNear;
@property (nonatomic, assign) int festivalId;
@property (nonatomic, assign) bool isFestivalSearch;

-(IBAction) autocomplete:(id) sender;
-(IBAction) cancel;
-(IBAction) nearbyButtonPressed;
-(void) removeView;

@end
