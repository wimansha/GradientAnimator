//
//  GradientAnimatorView.h
//  GradientAnimator
//
//  Created by Wimansha Chathuranga on 5/2/19.
//  Copyright © 2019 Wimansha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GradientAnimatorView : UIView

-(instancetype)initWithColors:(NSArray<UIColor*>*)colors;
-(void)startAnimation;

@end
