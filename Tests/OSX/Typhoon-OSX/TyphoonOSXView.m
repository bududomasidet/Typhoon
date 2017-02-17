//
//  TyphoonOSXView.m
//  Typhoon
//
//  Created by Roman Truba on 17.02.17.
//  Copyright © 2017 typhoonframework.org. All rights reserved.
//

#import "TyphoonOSXView.h"
#import "NSObject+FactoryHooks.h"
@implementation TyphoonOSXView
@end

@implementation TyphoonOSXController
@dynamic view;

-(void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Magical number is: %@", self.view.magicalNumber);
    self.view.magicalSpellField.stringValue = self.magicalSpell;
}

@end
