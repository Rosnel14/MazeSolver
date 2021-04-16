//
//  ListNode.h
//  Maze
//
//  Created by Rosnel Leyva-Cortés on 4/15/21.
//


#ifndef ListNode_h
#define ListNode_h

@interface ListNode<ObjectType>:NSObject

@property  id object;

@property ListNode *next;

- (instancetype)initWithObject:(id)object;

- (instancetype)initWithObject:(id)object andNextNode:(ListNode *)node;

- (instancetype)init;

 

@end


#endif /* ListNode_h */
