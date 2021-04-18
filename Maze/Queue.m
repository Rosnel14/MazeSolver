//
//  Queue.m
//  Maze
//
//  Created by Rosnel Leyva-Cortés on 4/15/21.
//

#import <Foundation/Foundation.h>
#import "Queue.h"
#import "ListNode.h"

@implementation Queue:NSObject

//contructor
-(instancetype)init{
    self = [super init];
    if(self){
        self.head = NULL;
    }
    return self;
}

-(instancetype)initWithHeadNode:(ListNode *)h{
    self = [super init];
    if(self){
        self.head = h;
    }
    return self;
}

-(instancetype)initWithHeadObject:(id)h{
    self = [super init];
    if(self){
        self.head = [[ListNode alloc] initWithObject:h];
    }
    return self;
}

//methods

//return the last node of the queue.
-(ListNode *)last{
    ListNode *cur = self.head;
    while(cur && cur.next){
        cur = cur.next;
    }
    return cur;
}

//push an item onto the queue
-(bool)enqueue : (id) item{
    if(!self.head){
        self.head = [[ListNode alloc] initWithObject:item];
        return true;
    }
    [self last].next = [[ListNode alloc] initWithObject:item];
    return true;
}

//removes and returns the item on the top of the queue
-(id)dequeue{
    ListNode *node = self.head;
    if(self.head){
        self.head = self.head.next;
    }
    return node.object;
}

//returns the item on the top of the queue
-(id)peek{
    return self.head.object;
}

//returns true if the queue is empty, false otherwise
-(bool)isEmpty{
    return self.head;
}

//returns the size of the queue
-(int)size{
    int count = 0;
    ListNode *cur = self.head;
    while(cur){
        cur = cur.next;
        count++;
    }
    return count;
}

//print out every element in the queue
-(void)print{
    ListNode *cur = self.head;
    while(cur){
        NSLog(@"%@\n", cur.object);
        cur = cur.next;
    }
}

//using pointers
-(bool)enqueueWithNode : (ListNode *) item{
    if(!self.head){
        self.head = item;
        return true;
    }
    [self last].next = item;
    return true;
}

//using pointers
-(ListNode *)dequeueWithNode {
    ListNode * item = self.head;
    if(self.head){
        self.head = self.head.next;
    }
    item.next = nil;
    return item;
    
}

@end
