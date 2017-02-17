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


#import "OSXPlistConfiguredAssembly.h"
#import "TyphoonOSXAppDelegate.h"
#import "Knight.h"
#import "CavalryMan.h"
#import "TyphoonConfigPostProcessor.h"
#import "TyphoonStoryboard.h"

@implementation OSXPlistConfiguredAssembly
{

}

- (TyphoonOSXAppDelegate *)appDelegate
{
    return [TyphoonDefinition withClass:[TyphoonOSXAppDelegate class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(assembly) with:self];
        [definition injectProperty:@selector(storyboard) with:[self storyboard]];
    }];
}

- (Knight *)configuredCavalryMan
{
    return [TyphoonDefinition withClass:[CavalryMan class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(damselsRescued) with:TyphoonConfig(@"damsels.rescued")];
        definition.scope = TyphoonScopeSingleton;
    }];
}

- (NSStoryboard *)storyboard {
    return [TyphoonDefinition withClass:[TyphoonStoryboard class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition useInitializer:@selector(storyboardWithName:factory:bundle:)
                                              parameters:^(TyphoonMethod *initializer) {
                                                  [initializer injectParameterWith:@"Main"];
                                                  [initializer injectParameterWith:self];
                                                  [initializer injectParameterWith:nil];
                                              }];
                          }];
}

@end
