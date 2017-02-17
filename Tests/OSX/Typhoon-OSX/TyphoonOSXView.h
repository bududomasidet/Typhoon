//
//  TyphoonOSXView.h
//  Typhoon
//
//  Created by Roman Truba on 17.02.17.
//  Copyright © 2017 typhoonframework.org. All rights reserved.
//

#import <AppKit/AppKit.h>

IB_DESIGNABLE
@interface TyphoonOSXView : NSView
@property (nonatomic) IBOutlet NSTextField *magicalSpellField;
@property (nonatomic) NSNumber *magicalNumber;
@end

@interface TyphoonOSXController : NSViewController
@property (atomic) TyphoonOSXView *view;
@property (nonatomic) NSString *magicalSpell;
@end
