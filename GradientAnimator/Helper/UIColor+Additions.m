//
//  UIColor+Additions.m
//  ColorPicker
//
//  Created by Visvalingam Karthik on 4/7/16.
//  Copyright © 2016 4axis Solutions. All rights reserved.
//

#import "UIColor+Additions.h"

@implementation UIColor (Additions)

- (NSString *)hexString {
    const CGFloat *components = CGColorGetComponents(self.CGColor);
    
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    CGFloat a = components[3];
    
    return [NSString stringWithFormat:@"#%02lX%02lX%02lX%02lX",
            lroundf(r * 255),
            lroundf(g * 255),
            lroundf(b * 255),
            lroundf(a * 255)];
}

+(UIColor *)colorWithHexColorString: (NSString *) hexString {
    unsigned rgbValue = 0;
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    NSScanner *scanner = [NSScanner scannerWithString:colorString];
    //[scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    switch (colorString.length) {
        case 8:
            return [UIColor colorWithRed:((rgbValue & 0xFF000000) >> 24)/255.0 green:((rgbValue & 0xFF0000) >> 16)/255.0 blue:((rgbValue & 0xFF00) >> 8)/255.0 alpha:(rgbValue & 0xFF)/255.0];
            break;
            
        default://6
            return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
            

            break;
    }
    
    
}

@end
