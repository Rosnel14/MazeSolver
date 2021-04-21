//
//  ListNode.h
//  Maze
//
//  Created by Rosnel Leyva-Cortés on 4/15/21.
//


#ifndef ListNode_h
#define ListNode_h

#import "position.h"
@interface ListNode:NSObject

@property  position * object;

@property ListNode *next;

- (instancetype)initWithObject:(position *)object;

- (instancetype)initWithObject:(position *)object andNextNode:(ListNode *)node;

- (instancetype)init;

 

@end


#endif /* ListNode_h */
