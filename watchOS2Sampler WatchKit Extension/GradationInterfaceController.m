//
//  GradationInterfaceController.m
//  watchOS2Sampler
//
//  Created by Shuichi Tsutsumi on 2015/07/14.
//  Copyright © 2015年 Shuichi Tsutsumi. All rights reserved.
//

#import "GradationInterfaceController.h"
@import UIKit;


@interface GradationInterfaceController ()
@property (nonatomic, weak) IBOutlet WKInterfaceImage *image;
@end


@implementation GradationInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

// =============================================================================
#pragma mark - Actions

- (IBAction)linearBtnTapped:(id)sender {

    CGSize size = CGSizeMake(100, 100);
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSaveGState(context);
    
    CFMutableArrayRef gradientColors = CFArrayCreateMutable(kCFAllocatorDefault, 2, &kCFTypeArrayCallBacks);
    CFArrayAppendValue(gradientColors, [UIColor greenColor].CGColor);
    CFArrayAppendValue(gradientColors, [UIColor blueColor].CGColor);
    
    CGPoint startPoint = CGPointMake(0, 0);
    CGPoint endPoint = CGPointMake(100, 100);
    
    CGFloat *locations = malloc(2 * sizeof(CGFloat));
    locations[0] = 0.0;
    locations[1] = 1.0;

    CGGradientRef gradient = CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), gradientColors, locations);
    CGContextDrawLinearGradient(context,
                                gradient,
                                startPoint,
                                endPoint,
                                kCGGradientDrawsAfterEndLocation|kCGGradientDrawsBeforeStartLocation);
    CGGradientRelease(gradient);
    CFRelease(gradientColors);
    CGContextRestoreGState(context);

    // Convert to UIImage
    CGImageRef cgimage = CGBitmapContextCreateImage(context);
    UIImage *uiimage = [UIImage imageWithCGImage:cgimage];
    
    // End the graphics context
    UIGraphicsEndImageContext();
    
    [self.image setImage:uiimage];
}

@end



