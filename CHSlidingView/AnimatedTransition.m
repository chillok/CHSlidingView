//
//  AnimatedTransition.m
//  CHExpandingViews
//
//  Created by Cillian on 23/11/2014.
//  Copyright (c) 2014 Cillian. All rights reserved.
//

#import "AnimatedTransition.h"

@implementation AnimatedTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.5f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [transitionContext.containerView addSubview:toViewController.view];
    toViewController.view.alpha = 0;
    toViewController.view.transform = CGAffineTransformMakeTranslation(0, 2000);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        fromViewController.view.transform = CGAffineTransformMakeScale(0.8, 0.8);
        toViewController.view.transform = CGAffineTransformIdentity;
        toViewController.view.alpha = 1;
       
    } completion:^(BOOL finished) {
       
        fromViewController.view.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
}

@end
