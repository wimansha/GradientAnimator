//
//  GradientAnimatorView.m
//  GradientAnimator
//
//  Created by Wimansha Chathuranga on 5/2/19.
//  Copyright © 2019 Wimansha. All rights reserved.
//

#import "GradientAnimatorView.h"

@interface GradientAnimatorView()<CAAnimationDelegate>

@end

@implementation GradientAnimatorView{
    CAGradientLayer *_gradientLayer;
    NSArray<UIColor*>* _colors;
    
    NSMutableArray *_mainLocations;
    NSMutableArray *_locationSetsArray;
    
    NSInteger _currentLocationsSetIndex;
}

- (instancetype)initWithColors:(NSArray<UIColor*>*)colors
{
    self = [super init];
    if (self) {
        NSMutableArray *allColors = [NSMutableArray array];
        [allColors addObjectsFromArray:colors];
        [allColors addObjectsFromArray:colors];
        
        _colors = allColors;
        
        [self configure];
    }
    return self;
}

-(void)configure{
    _gradientLayer = [CAGradientLayer new];
    _gradientLayer.drawsAsynchronously = YES;
    
    NSMutableArray *gradColors = [NSMutableArray array];
    for (UIColor *color in _colors) {
        [gradColors addObject:(id)color.CGColor];
    }
    _gradientLayer.colors = gradColors;
    
    
    NSInteger halfCount = [_colors count]/2;
    
    _mainLocations = [NSMutableArray array];
    
    for (int i = 0; i < halfCount ; i++) {
        [_mainLocations addObject:@(i * 1.0f/ (halfCount-1))];
    }
    
    _locationSetsArray = [NSMutableArray array];
    
    for (int i = 0; i <= halfCount ; i++) {
        NSInteger shift = halfCount - i;
        
        NSMutableArray *locations = [NSMutableArray array];
        
        for (int j = 0; j < halfCount*2 ; j++) {
            if (j < shift) {
                [locations addObject:@(0)];
            }
        }
        [locations addObjectsFromArray:_mainLocations];
        
        NSInteger locationCount = locations.count;
        for (int j = 0; j < _colors.count - locationCount ; j++) {
            [locations addObject:@(1)];
        }
        
        [_locationSetsArray addObject:locations];
        
    }
    
    _currentLocationsSetIndex = 0;
    _gradientLayer.locations = _locationSetsArray[0];
    
    _gradientLayer.startPoint = CGPointMake(0.0, 0.5);
    _gradientLayer.endPoint = CGPointMake(1.0, 0.5);
    
    [self.layer addSublayer:_gradientLayer];
    
}

-(void)startAnimation{
    [self animateLocations];
}

-(void)animateLocations{
    if (_currentLocationsSetIndex >= _locationSetsArray.count-1) {
        _currentLocationsSetIndex = 0;
        _gradientLayer.locations = _locationSetsArray[0];
    }
    
    CABasicAnimation *locationsAnimation = [CABasicAnimation animationWithKeyPath:@"locations"];
    locationsAnimation.duration = 1.5;
    locationsAnimation.fromValue = _locationSetsArray[_currentLocationsSetIndex];
    locationsAnimation.toValue = _locationSetsArray[_currentLocationsSetIndex+1];
    locationsAnimation.fillMode = kCAFillModeForwards;
    locationsAnimation.removedOnCompletion = NO;
    locationsAnimation.delegate = self;
    
    [_gradientLayer addAnimation:locationsAnimation forKey:@"locationsAnimation"];
    
    _currentLocationsSetIndex++;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat x = self.bounds.size.width*3;
    _gradientLayer.frame = CGRectMake(-x, 0, self.bounds.size.width+(2*x), self.bounds.size.height);
}

#pragma mark - CAAnimationDelegate methods

- (void)animationDidStop:(CABasicAnimation *)anim finished:(BOOL)flag{
    if (flag) {
        if ([anim.keyPath isEqualToString:@"locations"]) {
            [self animateLocations];
        }
    }
}

@end
