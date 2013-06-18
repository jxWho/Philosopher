//
//  philosopher.m
//  Philosopher
//
//  Created by god on 13-4-19.
//  Copyright (c) 2013年 god. All rights reserved.
//

#import "philosopher.h"

@implementation philosopher
@synthesize thinkingTime, eatingTime, waitTime, state, Number;
- (id)initWithNumber:(int)number
{
    if( self = [super init] ){
        self.Number = number;
        self.thinkingTime = 0;
        self.eatingTime = 0;
        self.waitTime = 0;
        self.state = Thinking;
    }
    return self;
}

@end
