//
//  GenieTestViewController.m
//  GenieTest
//
//  Created by wxg on 13-5-22.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "GenieTestViewController.h"
#import "UIView+Genie.h"

@implementation GenieTestViewController



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
        
    for (int i=0; i<4; i++) {
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(50+140*(i%2), 100+150*(i/2), 110, 30);
        button.tag=i+1;
        [button setImage:[UIImage imageNamed:@"zy_a.png"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(beginAnimation:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    
    
    imageView.backgroundColor = [UIColor redColor];
    
    
}

#pragma mark -wxg
#pragma mark 动画区域
-(void)beginAnimation:(UIButton *)button{
    
    [self.view bringSubviewToFront:button];
        
    CGRect endRect=CGRectZero;
    
    // 设置哪一个边缘最后变化
    BCRectEdge rectEdge = BCRectEdgeTop;
    if (button.tag < 3) {
        // x y:在自己的坐标系中运动到哪个位置
        // width height 最终状态的宽高
        endRect=CGRectMake(320-button.frame.origin.x-35, 460-20-button.frame.origin.y, 5, 5);
        rectEdge = BCRectEdgeTop;
    }else {
        endRect=CGRectMake(0-button.frame.origin.x+35, 0+20-button.frame.origin.y, 5, 5);
        rectEdge = BCRectEdgeBottom;
    }
    
    [button.imageView genieInTransitionWithDuration:3.0f destinationRect:endRect destinationEdge:rectEdge completion:nil];
    
    [button setImage:nil forState:UIControlStateNormal];
    [button setEnabled:NO];

    
}

-(IBAction)show:(id)sender{
    UIButton *button=(UIButton *)sender;
    [self.view bringSubviewToFront:button];
    
    int index = button.tag%10-1;
    
    Flag[index] = !Flag[index];
        
    if (button.tag == 11) {
        CGRect rect = CGRectMake(button.frame.origin.x, button.frame.origin.y+button.frame.size.height/2, 5, 5);
        if (Flag[index]) {
            [imageView genieInTransitionWithDuration:1.0f destinationRect:rect destinationEdge:BCRectEdgeLeft completion:nil];
        }else {
            [imageView genieOutTransitionWithDuration:1.0f startRect:rect startEdge:BCRectEdgeLeft completion:nil];
        }
    }else if (button.tag == 12) {
        CGRect rect = CGRectMake(button.frame.origin.x, button.frame.origin.y+button.frame.size.height/2, 5, 5);
        if (Flag[index]) {
            [imageView genieInTransitionWithDuration:1.0f destinationRect:rect destinationEdge:BCRectEdgeRight completion:nil];
        }else{
            [imageView genieOutTransitionWithDuration:1.0f startRect:rect startEdge:BCRectEdgeRight completion:nil];
        }
    }else if (button.tag == 13) {
        CGRect rect = CGRectMake(button.frame.origin.x+button.frame.size.width/2, button.frame.origin.y, 5, 5);
        if (Flag[index]) {
            [imageView genieInTransitionWithDuration:1.0f destinationRect:rect destinationEdge:BCRectEdgeBottom completion:nil];
        }else{
            [imageView genieOutTransitionWithDuration:1.0f startRect:rect startEdge:BCRectEdgeBottom completion:nil];
        }
        
        
    }else if (button.tag == 14) {
        CGRect rect = CGRectMake(button.frame.origin.x+button.frame.size.width/2, button.frame.origin.y, 5, 5);
        if (Flag[index]) {
            [imageView genieInTransitionWithDuration:1.0f destinationRect:rect destinationEdge:BCRectEdgeTop completion:nil];
        }else{
            [imageView genieOutTransitionWithDuration:1.0f startRect:rect startEdge:BCRectEdgeTop completion:nil];
        }
    }
    
    NSLog(@"%@",NSStringFromCGRect(imageView.frame));
    
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
