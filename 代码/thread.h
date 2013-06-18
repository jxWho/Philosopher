//
//  thread.h
//  Philosopher
//
//  Created by god on 13-4-19.
//  Copyright (c) 2013年 god. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "philosopher.h"
@interface thread : NSObject
{
    philosopher *p[6];
    NSLock* myLock;
}

- (void)changePhilosopherStatus:(philosopher *)phi;
- (void)createAndStartThread;
- (void)printPhilosopherStatus;
@end
