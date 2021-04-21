//
//  Stack.h
//  Maze
//
//  Created by Rosnel Leyva-Cortés on 4/15/21.
//

#ifndef Stack_h
#define Stack_h
#import "ListNode.h"
#import "position.h"

@interface Stack : NSObject

@property (nonatomic) ListNode *head;

//constructor
-(instancetype)initWithHeadNode:(ListNode *)h;
-(instancetype)initWithHeadObject:(position *)h;

//methods
-(bool)push : (id) item; //push an item onto the stack
-(position *)pop; //removes and returns the item on the top of the stack
-(position *)peek; //returns the item on the top of the stack
-(bool)isEmpty; //returns true if the stack is empty, false otherwise
-(int)size; //returns the size of the stack
-(void)print; //print out every element in the list

@end

#endif /* Stack_h */
