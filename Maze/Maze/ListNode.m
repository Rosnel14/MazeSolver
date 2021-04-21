//
//  ListNode.m
//  Maze
//
//  Created by Rosnel Leyva-Cortés on 4/15/21.
//

#import <Foundation/Foundation.h>
#import "ListNode.h"

@implementation ListNode:NSObject


- (instancetype)initWithObject:(position *)object {
    self = [super init];
    if (self) {
        self.object = object;
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    return self;

}

- (instancetype)initWithObject:(position *)object andNextNode:(ListNode *)node {
    self = [super init];
    if (self) {
        self.object = object;
        self.next = node;
    }
    return self;

}

@end
