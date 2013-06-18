//
//  philosopher.h
//  Philosopher
//
//  Created by god on 13-4-19.
//  Copyright (c) 2013年 god. All rights reserved.
//

#import <Foundation/Foundation.h>

enum philosopherState{ Thinking, Waiting, Eating };

@interface philosopher : NSObject
{
    int Number;     //哲学家的编号
    int state;      //当前状态
    int waitTime;   //等待时间
    int eatingTime; //吃饭时间
    int thinkingTime; //思考时间
}

@property(nonatomic) int thinkingTime;
@property(nonatomic) int eatingTime;
@property(nonatomic) int waitTime;
@property(nonatomic) int state;
@property(nonatomic) int Number;

- (id)initWithNumber:(int)number;
@end
