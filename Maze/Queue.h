//
//  Queue.h
//  Maze
//
//  Created by Rosnel Leyva-Cortés on 4/15/21.
//

#ifndef Queue_h
#define Queue_h


#import "ListNode.h"

@interface Queue<ObjectType> : NSObject

@property (nonatomic) ListNode<ObjectType> *head;

//constructor
-(instancetype)initWithHeadNode:(ListNode *)h;
-(instancetype)initWithHeadObject:(id)h;

//methods
-(bool)enqueue : (id) item; //push an item onto the queue
-(id)dequeue; //removes and returns the item on the top of the queue
-(id)peek; //returns the item on the top of the queue
-(bool)isEmpty; //returns true if the queue is empty, false otherwise
-(int)size; //returns the size of the queue
-(void)print; //print out every element in the queue

-(bool)enqueueWithNode : (ListNode *) item;
-(ListNode *)dequeueWithNode;


@end
#endif /* Queue_h */
