//
//  FullScreenViewController.m
//  GradientAnimator
//
//  Created by Wimansha Chathuranga on 6/23/19.
//  Copyright © 2019 Wimansha. All rights reserved.
//


#import "FullScreenViewController.h"
#import "GradientAnimatorView.h"
#import "UIColor+Additions.h"

@interface FullScreenViewController ()

@end

@implementation FullScreenViewController{
    GradientAnimatorView *_gradientView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addGradView];
    [_gradientView startAnimation];
}


-(void)addGradView{
    _gradientView = [[GradientAnimatorView alloc] initWithColors:@[[UIColor colorWithHexColorString:@"#ff6874"],
                                                                   [UIColor colorWithHexColorString:@"#ffd35a"],
                                                                   [UIColor colorWithHexColorString:@"#87db6b"],
                                                                   [UIColor colorWithHexColorString:@"#71cbff"],
                                                                   [UIColor colorWithHexColorString:@"#905bd9"],
                                                                   [UIColor colorWithHexColorString:@"#ff5be7"]
                                                                   ]];
    [self.view addSubview:_gradientView];
    _gradientView.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_gradientView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_gradientView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_gradientView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_gradientView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
    
    //--
    
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [closeButton setTitle:@"Dismiss" forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    closeButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:closeButton];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:closeButton attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-8]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:closeButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant:4.0]];
}

-(void)close{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
