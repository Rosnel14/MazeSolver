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
#import "CRL2DArray.h"


//for size options 0 = small, 1=medium, 2= large, 3=huge

@interface Maze : NSObject


//This array *should* be a visual
//of the array read in from the txt file
@property NSMutableArray * mazeImage;


//constructor as blank maze
-(instancetype)init;

//DFS algorithim, will return a solved set
//will be useful for displaying the solution later
-(Stack *)DFS;

//BFS algorithim, will return a solved set
//will be useful for displaying the solution later
-(Queue *)BFS;

//construct with a pre-determined filename
-(instancetype)initWithSize:(int)size;

@end


#endif /* Maze_h */



