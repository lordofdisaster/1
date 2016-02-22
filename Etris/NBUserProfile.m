//
//  NBUserProfile.m
//  Etris
//
//  Created by nickinade on 24.11.15.
//  Copyright © 2015 Elf. All rights reserved.
//

#import "NBUserProfile.h"

@implementation NBUserProfile

+ (NBUserProfile *)sharedInstance {
    
    static NBUserProfile *userProfile = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken,^{
    
        if (userProfile == nil) {
            userProfile = [[super allocWithZone:NULL] init];
        }
    }
                  );
    
    return userProfile;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [self sharedInstance];
}

+ (instancetype)alloc {
    return  [self sharedInstance];
}

- (instancetype)init {
    return self;
}

- (void)testTest {
    
}

@end
