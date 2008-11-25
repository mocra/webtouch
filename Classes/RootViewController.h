//
//  RootViewController.h
//  WebTouch
//
//  Created by Anthony Mittaz on 14/11/08.
//  Copyright Mocra 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController {
	NSArray *_content;
}

@property (nonatomic, retain) NSArray *content;

@end
