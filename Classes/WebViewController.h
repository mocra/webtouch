//
//  WebViewController.h
//  WebTouch
//
//  Created by Anthony Mittaz on 14/11/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WebTouchAppDelegate;

@interface WebViewController : UIViewController {
	UIWebView *_webView;
	BOOL _webViewLoaded;
	WebTouchAppDelegate *_appDelegate;
	NSString *_jsonString;
}

@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic) BOOL webViewLoaded;
@property (nonatomic, retain) WebTouchAppDelegate *appDelegate;
@property (nonatomic, copy) NSString *jsonString;

- (void)populateJsonAndDeliverfromDict:(NSDictionary *)jsonDict;

@end
