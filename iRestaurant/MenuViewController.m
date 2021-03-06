//
//  MenuViewController.m
//  iRestaurant
//
//  Created by Josh Timonen on 4/25/11.
//  Copyright 2011 N/A. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuService.h"
#import "Restaurant.h"
#import "Menu.h"
#import "MenuCategory.h"
#import "MenuSubcategory.h"
#import "SimpleMenuTableView.h"
#import "SectionsMenuTableView2.h"
#import "ASIFormDataRequest.h"

@implementation MenuViewController
@synthesize restaurant, menuService, tableView, activityIndicator, menuItems, festival;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithRestaurant:(Restaurant *)restaurant_passed  andFestival:(Festival *)festival_passed
{
    self = [super initWithNibName:@"MenuViewController" bundle:nil];
    if (self) {
        // Custom initialization
        restaurant = [restaurant_passed retain];
        menuService = [[MenuService alloc]initWithDelegate:self];
        if (festival_passed) {
            festival = [festival_passed retain];
        }
    }
    return self;
}

-(void)menuReturned:(Menu *)menu {
    //[activityIndicator stopAnimating];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"stopLoadingIndicator" object:nil];
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    menuItems = 0;
    for (MenuCategory *menuCategory in menu.arrayOfCategories) {
        NSLog(@"cat name: %@ | count: %i", menuCategory.name, [menuCategory.menuSubcategories count]);
        for (MenuSubcategory *menuSubcategory in menuCategory.menuSubcategories) {
            menuItems = menuItems + [menuSubcategory.arrayOfMenuItems count];
            NSLog(@"subcat name: %@ | count: %i", menuSubcategory.name, [menuSubcategory.arrayOfMenuItems count]);
        }
    }
        
    if (menuItems >= 150) {
        SectionsMenuTableView2 *sectionsMenuTableView = [[SectionsMenuTableView2 alloc]initWithMenu:menu andFestival:festival];
        tableView.dataSource = sectionsMenuTableView;
        tableView.delegate = sectionsMenuTableView;
        sectionsMenuTableView.navController = self.navigationController;
        sectionsMenuTableView.restaurant = restaurant;
        sectionsMenuTableView.parentVC = self;
        [tableView reloadData];
        
    } else {
        SimpleMenuTableView *simpleMenuTableView = [[SimpleMenuTableView alloc]initWithMenu:menu andFestival:festival];
        tableView.dataSource = simpleMenuTableView;
        tableView.delegate = simpleMenuTableView;
        simpleMenuTableView.restaurant = restaurant;
        //simpleMenuTableView.parentView = self;
        simpleMenuTableView.navController = self.navigationController;
        [tableView reloadData];
    }
}

- (void)dealloc
{
    //[restaurant release];
    //[menuService release];
    //[tableView release];
    [festival release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

-(void)viewDidAppear:(BOOL)animated {
    if (menuItems < 150) [self.tableView reloadData]; //[self callMenuService];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"Menu"];
    [self callMenuService];
    
    UIImageView *appNameImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menuLogo.png"]];
    appNameImageView.frame = CGRectMake(160, -3, 150, 44);
    appNameImageView.contentMode = UIViewContentModeCenter;
    self.navigationItem.titleView = appNameImageView;
    
    self.tableView.backgroundColor = [UIColor whiteColor]; //[[UIColor alloc] initWithRed:230.0 / 255 green:230.0 / 255 blue:230.0 / 255 alpha:1.0];
    
}

-(void) callMenuService {
    [menuService getMenuForRestaurant:restaurant];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"startLoadingIndicator" object:nil];

//    activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//    activityIndicator.frame = CGRectMake(0, 0, 25, 25);
//    activityIndicator.center = CGPointMake(self.view.center.x, (self.view.center.y - 50));
//    [self.view addSubview:activityIndicator];
//    [activityIndicator startAnimating];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

}

-(void) viewWillDisappear:(BOOL)animated {
    if (menuService.request != nil) {
        [menuService.request cancel];
    }
    
    for (UIView *view in self.view.subviews) {
        if (view == activityIndicator) {
            [activityIndicator removeFromSuperview];
        }
    }
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
