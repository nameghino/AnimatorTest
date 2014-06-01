//
//  FadeAnimation.m
//  Anim8
//
//  Created by Nicolas Ameghino on 6/1/14.
//  Copyright (c) 2014 Nicolas Ameghino. All rights reserved.
//

#import "FadeAnimation.h"

@implementation FadeAnimation

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.0f;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = [transitionContext containerView];
    
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect finalToViewControllerFrame = [transitionContext finalFrameForViewController:toViewController];
    
    UIView *fromView = fromViewController.view;
    UIView *toView = toViewController.view;
    
    toView.alpha = 0.0f;
    toView.frame = finalToViewControllerFrame;
//    toView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [containerView addSubview:toView];
    
    [containerView addConstraints:
     @[
       [NSLayoutConstraint constraintWithItem:toView
                                    attribute:NSLayoutAttributeHeight
                                    relatedBy:NSLayoutRelationEqual
                                       toItem:containerView
                                    attribute:NSLayoutAttributeHeight
                                   multiplier:1.0f
                                     constant:0.0f],
       [NSLayoutConstraint constraintWithItem:toView
                                    attribute:NSLayoutAttributeWidth
                                    relatedBy:NSLayoutRelationEqual
                                       toItem:containerView
                                    attribute:NSLayoutAttributeWidth
                                   multiplier:1.0f
                                     constant:0.0f],
       [NSLayoutConstraint constraintWithItem:toView
                                    attribute:NSLayoutAttributeCenterX
                                    relatedBy:NSLayoutRelationEqual
                                       toItem:containerView
                                    attribute:NSLayoutAttributeCenterX
                                   multiplier:1.0f
                                     constant:0.0f],
       [NSLayoutConstraint constraintWithItem:toView
                                    attribute:NSLayoutAttributeCenterY
                                    relatedBy:NSLayoutRelationEqual
                                       toItem:containerView
                                    attribute:NSLayoutAttributeCenterY
                                   multiplier:1.0f
                                     constant:0.0f]
       ]];
    [containerView updateConstraints];

    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
                         fromView.alpha = 0.0f;
                         toView.alpha = 1.0f;
                     } completion:^(BOOL finished) {
                         [transitionContext completeTransition:finished];
                         [fromView removeFromSuperview];
                     }];
    
}

@end
