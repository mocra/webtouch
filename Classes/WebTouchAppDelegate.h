//
//  WebTouchAppDelegate.h
//  WebTouch
//
//  Created by Anthony Mittaz on 14/11/08.
//  Copyright Mocra 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebTouchAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

- (NSString *)documentPathForFile:(NSString *)aPath;
- (NSString *)bundlePathForRessource:(NSString *)aRessource ofType:(NSString *)aType;

@end

