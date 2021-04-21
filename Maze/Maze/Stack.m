//
//  Stack.m
//  Maze
//
//  Created by Rosnel Leyva-Cortés on 4/15/21.
//

#import <Foundation/Foundation.h>
#import "Stack.h"

@implementation Stack

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

-(instancetype)initWithHeadObject:(position *)h{
    self = [super init];
    if(self){
        self.head = [[ListNode alloc] initWithObject:h];
    }
    return self;
}

//methods

//returns the second to last node in the stack
-(ListNode *)beforeLast{
    if(!self.head || !self.head.next){
        return NULL;
    }
    ListNode *cur = self.head;
    while(cur && cur.next && cur.next.next){
        cur = cur.next;
    }
    return cur;
}

//push an item onto the stack
-(bool)push : (position *) item{
    if(!self.head){
        self.head = [[ListNode alloc] initWithObject:item];
        return true;
    }
    if(![self beforeLast]){
        self.head.next = [[ListNode alloc] initWithObject:item];
        return true;
    }
    ListNode *last = [self beforeLast].next;
    last.next = [[ListNode alloc] initWithObject:item];
    return true;
}

//removes and returns the item on the top of the stack
-(position *)pop{
    if(!self.head){
        return NULL;
    }
    ListNode * temp = self.head;
    self.head =self.head.next;
    return temp.object; 
}

//returns the item on the top of the stack
-(position *)peek{
    if(!self.head){
        return NULL;
    }
    return self.head.object;
}

//returns true if the stack is empty, false otherwise
-(bool)isEmpty{
    if(self.head == nil) {
        return YES;
    } else{
        return NO;
    }
}

//returns the size of the stack
-(int)size{
    int count = 0;
    ListNode *cur = self.head;
    while(cur){
        cur = cur.next;
        count++;
    }
    return count;
}

//print out every element in the list
-(void)print{
    ListNode *cur = self.head;
    while(cur){
        NSLog(@"%@\n", cur.object);
        cur = cur.next;
    }
}
@end
