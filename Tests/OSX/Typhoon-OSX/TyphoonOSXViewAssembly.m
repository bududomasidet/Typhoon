//
//  TyphoonOSXViewAssembly.m
//  Typhoon
//
//  Created by Roman Truba on 17.02.17.
//  Copyright © 2017 typhoonframework.org. All rights reserved.
//

#import "TyphoonOSXViewAssembly.h"
#import "TyphoonOSXView.h"
@implementation TyphoonOSXViewAssembly

- (TyphoonOSXView *)magicalView {
    return [TyphoonDefinition withClass:[TyphoonOSXView class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(magicalNumber)
                                                    with:@(42)];
                          }];
}

- (TyphoonOSXController *)magicalController {
    return [TyphoonDefinition withClass:[TyphoonOSXController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(magicalSpell)
                                                    with:[self spell]];
                          }];
}

- (NSString*)spell {
    NSArray *array = @[@"Sectumsempra", @"Expelliarmus", @"Avada kedavra", @"Accio", @"Wingardium Leviosa"];
    return [array objectAtIndex:arc4random_uniform((uint32_t)array.count)];
}

@end
