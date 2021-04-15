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


//for size options 0 = small, 1=medium, 2= large, 3=huge

@interface Maze : NSObject

//this stack will be used for
//pathfinding using DFS
@property Stack * pathStack;

//this queue will be used for
//pathfinding using BFS
@property Queue * pathQueue;

//this will determine how big the maze is
//base of what file is passed 
@property NSString * fileNameFromSize;

//constructor as blank maze
-(instancetype)init;

//construct as a DFS maze
-(instancetype)initWithStackAndSize:(int)size;

//construct as a BFS maze
-(instancetype)initWithQueueAndSize:(int)size;

//solve method, return true or false if the maze can solved
-(bool)solve;

//construct with a pre-determined filename
-(instancetype)initWithSize:(int)size;

@end


#endif /* Maze_h */
