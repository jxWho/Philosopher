//
//  thread.m
//  Philosopher
//
//  Created by god on 13-4-19.
//  Copyright (c) 2013年 god. All rights reserved.
//



#import "thread.h"
@interface thread()
{
    BOOL chopstick[6];
}
@end

@implementation thread

- (id)init
{

    if( self == [super init] ){
        p[1] = [[philosopher alloc]initWithNumber:1];
        p[2] = [[philosopher alloc]initWithNumber:2];
        p[3] = [[philosopher alloc]initWithNumber:3];
        p[4] = [[philosopher alloc]initWithNumber:4];
        p[5] = [[philosopher alloc]initWithNumber:5];
        myLock = [[NSLock alloc]init];
        for( int i = 1; i <=5; i++ )
            chopstick[i] = TRUE;
        [self createAndStartThread];
    }
    return self;
}

- (void)changePhilosopherStatus:(philosopher *)phi
{
    if( [myLock tryLock] ){
        if( phi.state == Thinking ){
            sleep(5);  //思考5秒
            phi.waitTime = 0;
            phi.state = Waiting;
        }else if( phi.state == Eating ){
            sleep(5);  //吃饭5秒
            int num = phi.Number;
            int rnum = (num == 5)? 1 : num + 1;
            chopstick[num] = TRUE;
            chopstick[rnum] = TRUE;
            phi.state = Thinking;
        }else{
            sleep(5);  //等待5秒
            phi.waitTime += 5;
            NSAssert(phi.waitTime < 60, @"%d 饿死了",phi.Number);
            int num = phi.Number;
            int lperson = (num == 1)? 5 : num - 1;
            int rPerson = (num == 5)? 1 : num + 1;
            if( p[lperson].waitTime >= 50 || p[rPerson].waitTime >= 50  )
                ;           //两边有人比自己等得久，濒临死亡...
            else{
                int rnum = rPerson;
                if (chopstick[rnum]&&chopstick[num]){
                    chopstick[rnum] = chopstick[num] = FALSE;
                    phi.state = Eating;
                    phi.waitTime = 0;
                }
            }
        }
        
        [myLock unlock];
    }
}

- (void)myThread:(philosopher *)P
{
    while (1) {
        [self changePhilosopherStatus:P];
    }
}

- (void)createAndStartThread
{
    NSThread *thread1 = [[NSThread alloc]initWithTarget:self selector:@selector(myThread:) object:p[1]];
    NSThread *thread2 = [[NSThread alloc]initWithTarget:self selector:@selector(myThread:) object:p[2]];
    NSThread *thread3 = [[NSThread alloc]initWithTarget:self selector:@selector(myThread:) object:p[3]];
    NSThread *thread4 = [[NSThread alloc]initWithTarget:self selector:@selector(myThread:) object:p[4]];
    NSThread *thread5 = [[NSThread alloc]initWithTarget:self selector:@selector(myThread:) object:p[5]];
    [thread1 start];
    [thread2 start];
    [thread3 start];
    [thread4 start];
    [thread5 start];

}

-(void)printPhilosopherStatus
{
    sleep(5);
    for( int i = 1; i <= 5; i++ ){
        NSString* S;
        if( p[i].state == Thinking )
            S = @"Thinking";
        else if( p[i].state == Waiting )
            S = @"Waiting";
        else
            S = @"Eating";
        NSLog(@"%d %@",i,S);
    }
}

@end
