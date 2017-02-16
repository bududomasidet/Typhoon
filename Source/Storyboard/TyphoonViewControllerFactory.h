////////////////////////////////////////////////////////////////////////////////
//
//  TYPHOON FRAMEWORK
//  Copyright 2015, Typhoon Framework Contributors
//  All Rights Reserved.
//
//  NOTICE: The authors permit you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

#import <Foundation/Foundation.h>
#import "TyphoonPlatform.h"

@class TyphoonStoryboardDefinitionContext;
@protocol TyphoonComponentFactory;
@class TyphoonStoryboard;
@class TyphoonInjectionContext;

NS_CLASS_AVAILABLE(10_10, 5_0)
@interface TyphoonViewControllerFactory : NSObject

+ (TyphoonViewControllerBaseClass *)viewControllerWithStoryboardContext:(TyphoonStoryboardDefinitionContext *)context injectionContext:(TyphoonInjectionContext *)injectionContext factory:(id<TyphoonComponentFactory>)factory;
+ (TyphoonViewControllerBaseClass *)viewControllerWithIdentifier:(NSString *)identifier storyboard:(TyphoonStoryboard *)storyboard;
+ (TyphoonViewControllerBaseClass *)cachedViewControllerWithIdentifier:(NSString *)identifier storyboardName:(NSString *)storyboardName factory:(id<TyphoonComponentFactory>)factory;


@end
