//
//  Maze.m
//  Maze
//
//  Created by Rosnel Leyva-Cortés on 4/15/21.
//

#import <Foundation/Foundation.h>
#import "Maze.h"
#import "ListNode.h"
#import "Stack.h"
#import "Queue.h"

@implementation Maze

-(instancetype)init {
    if (self) {
        self = [super init];
        self.pathQueue = [[Queue alloc] init];
        self.pathStack = [[Stack alloc]init];
        self.pathStack = nil;
        self.pathQueue = nil;
        self.fileNameFromSize = nil;
    }
    return self;
}

-(instancetype)initWithStackAndSize:(int)size {
    //this is just a placeholder until I figure out how to find file
    NSString * filename;
    switch (size) {
        case 0:
            filename = @"small";
            break;
        case 1:
            filename = @"medium";
            break;
        case 2:
            filename = @"large";
            break;
        case 3:
            filename = @"huge";
            break;
        default:
            break;
    }
    
    if(self) {
        self = [super init];
        self.pathStack = [[Stack alloc]init];
        self.pathQueue =[[Queue alloc]init];
        self.pathQueue = nil;
        self.fileNameFromSize = filename;
    }
    return self;
    
}

-(instancetype)initWithQueueAndSize:(int)size {
    //this is just a placeholder string until I figure out how to find file
    NSString * filename;
    switch (size) {
        case 0:
            filename = @"small";
            break;
        case 1:
            filename = @"medium";
            break;
        case 2:
            filename = @"large";
            break;
        case 3:
            filename = @"huge";
            break;
        default:
            break;
    }
    
    if(self) {
        self = [super init];
        self.pathStack = [[Stack alloc]init];
        self.pathQueue =[[Queue alloc]init];
        self.pathStack = nil;
        self.fileNameFromSize = filename;
    }
    return self;
}

-(instancetype)initWithSize:(int)size {
    //this is just a placeholder until I figure out how to find file
    NSString * filename;
    switch (size) {
        case 0:
            filename = @"small";
            break;
        case 1:
            filename = @"medium";
            break;
        case 2:
            filename = @"large";
            break;
        case 3:
            filename = @"huge";
            break;
        default:
            break;
    }
    
    if(self) {
        self = [super init];
        self.pathStack = [[Stack alloc]init];
        self.pathQueue =[[Queue alloc]init];
        self.pathStack = nil;
        self.pathQueue = nil;
        self.fileNameFromSize = filename;
    }
    return self;
}

-(bool)solve {
    return NO; //blegh
}
@end
