//
//  RootViewController.m
//  WebTouch
//
//  Created by Anthony Mittaz on 14/11/08.
//  Copyright Mocra 2008. All rights reserved.
//

#import "RootViewController.h"
#import "WebTouchAppDelegate.h"
#import "WebViewController.h"

@implementation RootViewController

@synthesize content=_content;

- (void)viewDidLoad {
	 [super viewDidLoad];
	
	 self.navigationItem.title = @"Athletes";

	 self.content = [NSArray arrayWithObjects:@"Rider 1",
											  @"Rider 2",
											  @"Rider 3",
											  @"Rider 4",
											  nil];
 }
 

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.content count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
	
	cell.text = [self.content objectAtIndex:indexPath.row];
    
    // Set up the cell
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic -- create and push a new view controller
	WebViewController*webController = [[WebViewController alloc]initWithNibName:@"WebViewController" bundle:nil];
	[self.navigationController pushViewController:webController animated:TRUE];
	[webController release];
}

- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath
{
	return UITableViewCellAccessoryDisclosureIndicator;
}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
}
*/

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [_content release];
	
	[super dealloc];
}


@end

