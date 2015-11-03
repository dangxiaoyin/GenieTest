//
//  GenieTestAppDelegate.h
//  GenieTest
//
//  Created by wxg on 13-5-22.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GenieTestViewController;

@interface GenieTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    GenieTestViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet GenieTestViewController *viewController;

@end

