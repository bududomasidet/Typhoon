////////////////////////////////////////////////////////////////////////////////
//
//  TYPHOON FRAMEWORK
//  Copyright 2013, Typhoon Framework Contributors
//  All Rights Reserved.
//
//  NOTICE: The authors permit you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

#import "TyphoonPlatform.h"

#import "TyphoonViewControllerInjector.h"
#import "ViewController+TyphoonStoryboardIntegration.h"
#import "View+TyphoonDefinitionKey.h"

#import "TyphoonComponentFactory+TyphoonDefinitionRegisterer.h"


#import <objc/runtime.h>

//-------------------------------------------------------------------------------------------
#pragma mark - TyphoonViewControllerInjector

@implementation TyphoonViewControllerInjector

+ (void)load
{
    [TyphoonViewControllerBaseClass swizzleViewDidLoadMethod];
}

- (void)injectPropertiesForViewController:(TyphoonViewControllerBaseClass *)viewController withFactory:(id)factory
{
    [self injectPropertiesForViewController:viewController withFactory:factory storyboard:nil];
}

- (void)injectPropertiesForViewController:(TyphoonViewControllerBaseClass *)controller withFactory:(id<TyphoonComponentFactory>)factory storyboard:(TyphoonStoryboardClass *)storyboard
{
    if (controller.typhoonKey.length > 0) {
        [factory inject:controller withSelector:NSSelectorFromString(controller.typhoonKey)];
    }
    else {
        [factory inject:controller];
    }

    if ([controller isKindOfClass:[TyphoonViewControllerClass class]]) {
        TyphoonViewControllerClass *viewController = (id)controller;
        for (TyphoonViewControllerClass *child in viewController.childViewControllers) {
            if (storyboard && child.storyboard && ![child.storyboard isEqual:storyboard]) {
                continue;
            }
            [self injectPropertiesForViewController:child withFactory:factory storyboard:storyboard];
        }

        if ([viewController isViewLoaded]) {
            [self injectPropertiesInView:viewController.view withFactory:factory];
        } else {
            __weak __typeof (viewController) weakViewController = viewController;
            [viewController setViewDidLoadNotificationBlock:^{
                [self injectPropertiesInView:weakViewController.view withFactory:factory];
            }];
        }
    }
    
#if (!(TARGET_OS_IPHONE || TARGET_OS_TV))
    if ([controller isKindOfClass:[NSWindowController class]]) {
        TyphoonViewControllerClass *viewController = [(NSWindowController*)controller contentViewController];
        [self injectPropertiesForViewController:viewController withFactory:factory storyboard:storyboard];
    }
#endif
}

- (void)injectPropertiesInView:(TyphoonViewClass *)view withFactory:(id)factory
{
    if (view.typhoonKey.length > 0) {
        [factory inject:view withSelector:NSSelectorFromString(view.typhoonKey)];
    }
    
    if ([view.subviews count] == 0) {
        return;
    }
    
    for (TyphoonViewClass *subview in view.subviews) {
        [self injectPropertiesInView:subview withFactory:factory];
    }
}

@end
