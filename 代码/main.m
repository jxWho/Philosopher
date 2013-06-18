//
//  main.m
//  Philosopher
//
//  Created by god on 13-4-19.
//  Copyright (c) 2013年 god. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "thread.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        

        thread* mythread = [[thread alloc]init];
        while (1) {

            [mythread printPhilosopherStatus];
            NSLog(@"   ");
        }
    }
    return 0;
}

