//
//  Maze.h
//  Maze
//
//  Created by Rosnel Leyva-Cortés on 4/15/21.
//

#ifndef Maze_h
#define Maze_h
#import "ListNode.h"
#import "Stack.h"
#import "Queue.h"


@interface Maze : NSObject




//constructor
-(instancetype)init;

//solve method, return true or false if the maze can solved
-(bool)solve;

//construct with a pre-determined filename 
-(instancetype)initWithSize:(NSString *)filename;

@end


#endif /* Maze_h */
