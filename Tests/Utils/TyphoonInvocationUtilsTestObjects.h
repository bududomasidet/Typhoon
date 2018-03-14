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


#import <Foundation/Foundation.h>

@interface ObjectBlockArgument : NSObject

+ (void)setBlock:(void(^)(void))block;

@end


@interface ObjectInitRetained : NSObject

@end

@interface ObjectNewRetained : NSObject

+ (instancetype)newObject;

@end


@interface ObjectNewAutorelease : NSObject

+ (instancetype)object;

@end

@interface ObjectInitCluster : NSObject

- (instancetype)initOldRelease;

- (instancetype)initOldAutorelease;

- (instancetype)initReturnNil;

@end

