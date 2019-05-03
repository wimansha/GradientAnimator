//
//  UIColor+Additions.h
//  ColorPicker
//
//  Created by Visvalingam Karthik on 4/7/16.
//  Copyright © 2016 4axis Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Additions)

- (NSString *)hexString;
+(UIColor *)colorWithHexColorString: (NSString *) hexString;
@end
