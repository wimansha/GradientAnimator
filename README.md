# GradientAnimator
A custom UIView with an ability to animate a linear gradient layer for a given set of colors.

![iPhone Example](_GIFs/iphone_example.gif)

```
GradientAnimatorView *gradientView = [[GradientAnimatorView alloc] initWithColors:@[
                                                                          [UIColor redColor],
                                                                          [UIColor greenColor],
                                                                          [UIColor blueColor]
                                                                        ]];
```

## Installation

Just add `GradientAnimatorView` to your Podfile and install. Done!

```ruby
pod 'GradientAnimatorView'
