//
//  ViewController.m
//  GradientAnimator
//
//  Created by Wimansha Chathuranga on 5/2/19.
//  Copyright © 2019 Wimansha. All rights reserved.
//

#import "ViewController.h"
#import "GradientAnimatorView.h"
#import "UIColor+Additions.h"
#import "FullScreenViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    GradientAnimatorView *_gradientView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addGradView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
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
    
    _gradientView.clipsToBounds = YES;
    [self.view addSubview:_gradientView];
    _gradientView.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_gradientView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_gradientView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_gradientView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_gradientView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.7 constant:0]];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"On Full Screen" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(showOnFullScreen) forControlEvents:UIControlEventTouchUpInside];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:button];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_gradientView attribute:NSLayoutAttributeTop multiplier:1.0 constant:-20.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:30]];
    
    
    UILabel *label = [UILabel new];
    label.text = @"Gradient Animator View";
    label.font = [UIFont boldSystemFontOfSize:30];
    label.textColor = UIColor.whiteColor;
    [self.view addSubview:label];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    [[label.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
    [[label.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor] setActive:YES];
    
}

-(void)showOnFullScreen{
    [self presentViewController:[FullScreenViewController new] animated:YES completion:nil];
}


@end
