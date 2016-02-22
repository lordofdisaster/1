//
//  NBUserProfile.h
//  Etris
//
//  Created by nickinade on 24.11.15.
//  Copyright © 2015 Elf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NBUserProfile : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double score;

+ (NBUserProfile *)sharedInstance;

- (void)testTest;

@end
