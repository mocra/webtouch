//
//  WebTouchAppDelegate.m
//  WebTouch
//
//  Created by Anthony Mittaz on 14/11/08.
//  Copyright Mocra 2008. All rights reserved.
//

#import "WebTouchAppDelegate.h"
#import "RootViewController.h"


@implementation WebTouchAppDelegate

@synthesize window;
@synthesize navigationController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
	// Configure and show the window
	[window addSubview:[navigationController view]];
	[window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}

#pragma mark -
#pragma mark Utilities method to help find ressources from the applications directory or from the user directory:

// Permits to retrieve the path for the given file on the user documents dir
- (NSString *)documentPathForFile:(NSString *)aPath
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *appFile = [documentsDirectory stringByAppendingPathComponent:aPath];
	return appFile;
}

// Permits to retrive the path for the given file on the application ressources dir
- (NSString *)bundlePathForRessource:(NSString *)aRessource ofType:(NSString *)aType
{
	NSBundle *bundle = [NSBundle mainBundle];
	NSString *path = [bundle pathForResource:aRessource ofType:aType];
	return path;
}


- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}

@end
