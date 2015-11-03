//
//  GenieTestViewController.h
//  GenieTest
//
//  Created by wxg on 13-5-22.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GenieTestViewController : UIViewController {
    BOOL Flag[4];
    
    IBOutlet UIImageView *imageView;
}
-(IBAction)show:(id)sender;
@end

