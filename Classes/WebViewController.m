//
//  WebViewController.m
//  WebTouch
//
//  Created by Anthony Mittaz on 14/11/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "WebViewController.h"
#import "WebTouchAppDelegate.h"
#import "JSON.h"

@implementation WebViewController

@synthesize webView=_webView;
@synthesize webViewLoaded=_webViewLoaded;
@synthesize appDelegate=_appDelegate;
@synthesize jsonString=_jsonString;

// Override initWithNibName:bundle: to load the view using a nib file then perform additional customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        if (!self.appDelegate) {
			self.appDelegate = (WebTouchAppDelegate *)[[UIApplication sharedApplication]delegate];
		}
		
		// Custom initialization
	}
		
    return self;
}


// Implement viewDidLoad to do additional setup after loading the view.
- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.navigationItem.title = @"Bio";
	
	NSMutableDictionary *jsonDict = [NSMutableDictionary dictionaryWithCapacity:0];
	
	NSString *dateOfBirth = @"November 16, 1979";
	[jsonDict setValue:dateOfBirth forKey:@"dateOfBirth"];
	
	NSString *favoriteSpot = @"Pipeline, Hawaii";
	[jsonDict setValue:favoriteSpot forKey:@"favoriteSpot"];
	
	NSString *hometown = @"Hanalei Kauai, and still holding it down there";
	[jsonDict setValue:hometown forKey:@"hometown"];
	
	NSString *name = @"Bruce Irons";
	[jsonDict setValue:name forKey:@"name"];
	
	NSString *otherSponsors = @"Volcom clothing, Oakley Eyewear, DC footwear, Red Bull energy drinks, DaKine accessories, JS surfboards, Body Glove wetsuits, Nixon watches";
	[jsonDict setValue:otherSponsors forKey:@"otherSponsors"];
	
	NSString *primaryImage = @"http://mi.oakley.com/a/dc/11/BAh7CGkKIgo1NHg1NGkLbCsHekwKSWkIaQJTEg.jpg";
	[jsonDict setValue:primaryImage forKey:@"primaryImage"];
	
	NSString *athleteBio = @"<p>The name Bruce Irons is synonymous with innovation, progression and style in surfing and crowds gather en masse to catch a glimpse of his moves whenever he graces the water. Securing legend status long before joining the elite pro surfing ranks, Bruce Irons was always going to make an impact when up against the best of the best. His brilliant new school flashes, once rare in competition, are becoming much more frequent, and his fellow Tour mates are always nervous when drawing the young Hawaiian in a heat.</p>\n\n\n\t<p>Finishing 24th on the 2007 ratings was a slight slip from 2006 but so long as Irons continues to enjoy his career as a surfer, be assured that he isn&#8217;t far from returning to the event winner&#8217;s circle, which will in turn see him up where he belongs in the top five surfers in the world.</p>";
	[jsonDict setValue:athleteBio forKey:@"athleteBio"];
	
	// Setup the request
	NSString *htmlTemplateLink = [self.appDelegate bundlePathForRessource:@"bio" ofType:@"html"];
	
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:htmlTemplateLink]];
	[self.webView loadRequest:request];	

	[self populateJsonAndDeliverfromDict:jsonDict];
}

#pragma mark -
#pragma mark - Build the json

- (void)populateJsonAndDeliverfromDict:(NSDictionary *)jsonDict
{
	if (self.webViewLoaded) {
		NSString *newJsonString = [jsonDict JSONRepresentation];
		if (newJsonString != self.jsonString) {
			self.jsonString = newJsonString;
			// execute the script
			NSString *theScript = [NSString stringWithFormat:@"loadData(%@);", self.jsonString];	
			[self.webView stringByEvaluatingJavaScriptFromString:theScript];
		}
	} else {
		[self performSelector:@selector(populateJsonAndDeliverfromDict:) withObject:jsonDict afterDelay:1.0];
	}
}
#pragma mark -
#pragma mark - webView delegate

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
	self.webViewLoaded = TRUE;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[_webView release];
	[_jsonString release];
	[_appDelegate release];
	
    [super dealloc];
}


@end
