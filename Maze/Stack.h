//
//  Stack.h
//  Maze
//
//  Created by Rosnel Leyva-Cortés on 4/15/21.
//

#ifndef Stack_h
#define Stack_h
#import "ListNode.h"

@interface Stack<ObjectType> : NSObject

@property (nonatomic) ListNode<ObjectType> *head;

//constructor
-(instancetype)initWithHeadNode:(ListNode *)h;
-(instancetype)initWithHeadObject:(id)h;

//methods
-(bool)push : (id) item; //push an item onto the stack
-(id)pop; //removes and returns the item on the top of the stack
-(id)peek; //returns the item on the top of the stack
-(bool)isEmpty; //returns true if the stack is empty, false otherwise
-(int)size; //returns the size of the stack
-(void)print; //print out every element in the list

@end

#endif /* Stack_h */
