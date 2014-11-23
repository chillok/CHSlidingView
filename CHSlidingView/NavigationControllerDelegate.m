//
//  NavigationControllerDelegate.m
//  CHExpandingViews
//
//  Created by Cillian on 23/11/2014.
//  Copyright (c) 2014 Cillian. All rights reserved.
//

#import "NavigationControllerDelegate.h"
#import "AnimatedTransition.h"

@interface NavigationControllerDelegate()

@property (nonatomic, weak) IBOutlet UINavigationController *navigationController;
@property (nonatomic, strong) AnimatedTransition *animatedTransition;

@end

@implementation NavigationControllerDelegate

- (void)awakeFromNib {
    
    self.animatedTransition = [AnimatedTransition new];
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush) {
        return self.animatedTransition;
    }
    
    return nil;
}

@end
