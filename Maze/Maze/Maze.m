//
//  Maze.m
//  Maze
//
//  Created by Rosnel Leyva-Cortés on 4/15/21.
//

#import <Foundation/Foundation.h>
#import "Maze.h"
#import "ListNode.h"
#import "Stack.h"
#import "Queue.h"
#import "CRL2DArray.h"
#import "position.h"

@implementation Maze

-(instancetype)init {
    if (self) {
        self = [super init];
        self.mazeImage = nil;
    }
    return self;
}

//0 is small, 1 is medium, 2 is large, 3 is huge
//selector for size of the maze
-(instancetype)initWithSize:(int)size {
    NSString * filename;
    NSString * fileContent;
    NSError * error;
    self.mazeImage = [[NSMutableArray alloc] init];
    switch (size) {
        case 0:
            filename = [[NSBundle mainBundle] pathForResource:@"smallMaze" ofType:@"txt"];
            fileContent = [NSString stringWithContentsOfFile:filename encoding:NSUTF8StringEncoding error:NULL];
                if (error) NSLog(@"Error reading file: %@", error.localizedDescription);
            break;
        case 1:
            filename = [[NSBundle mainBundle] pathForResource:@"mediumMaze" ofType:@"txt"];
            fileContent = [NSString stringWithContentsOfFile:filename encoding:NSUTF8StringEncoding error:NULL];
                if (error) NSLog(@"Error reading file: %@", error.localizedDescription);
            break;
            
        case 2:
            filename = [[NSBundle mainBundle] pathForResource:@"largeMaze" ofType:@"txt"];
            fileContent = [NSString stringWithContentsOfFile:filename encoding:NSUTF8StringEncoding error:NULL];
                if (error) NSLog(@"Error reading file: %@", error.localizedDescription);
            break;
            
        case 3:
            filename = [[NSBundle mainBundle] pathForResource:@"hugeMaze" ofType:@"txt"];
            fileContent = [NSString stringWithContentsOfFile:filename encoding:NSUTF8StringEncoding error:NULL];
                if (error) NSLog(@"Error reading file: %@", error.localizedDescription);
            break;
        default:
            break;
    }
    
    if(self) {
        self = [super init];
        
        //probably have to parse each char to create the rectangles later
        NSArray * lines = [fileContent componentsSeparatedByString:@"\n"];
        for(int i=0; i<lines.count;i++){
            NSMutableArray * temp = [[NSMutableArray alloc]init];
            NSString * characters = [lines objectAtIndex:i];
            for(int j=0; j<[characters length]; j++){
                [temp addObject:[NSString stringWithFormat:@"%C",[characters characterAtIndex:j]]];
            }
            [self.mazeImage addObject:temp];
        }
        
        
    }
    
    return self;
            
}

-(Stack *)DFS{
    
    
    //now I need to figure out which values are the start and which are @ end
    position * start = [[position alloc]init];
    position * end =[[position alloc]init];
    
    for(int i=0; i<[self.mazeImage count]; i++){ //rows
        for(int j=0; j<[[self.mazeImage objectAtIndex:i] count]; j++){//columns
            
            if([[[self.mazeImage objectAtIndex:i] objectAtIndex:j] isEqualToString:@"S"] ){ //S char
                start.x = j;
                start.y = i;
            }
            
            if([[[self.mazeImage objectAtIndex:i] objectAtIndex:j] isEqualToString:@"G"] ){ //G char
                end.x = j;
                end.y = i;
            }

        }
    }
        
        //creating an array that is similar to the current
        //but it returns to us if a position was traversed or not
        //will be useful later, let's try this {1 = visited, 2 = not-visited}
    NSMutableArray * visited = [[NSMutableArray alloc] initWithCapacity:[self.mazeImage count]];
    for(int i=0; i<[self.mazeImage count];i++){
        NSMutableArray * temp = [[NSMutableArray alloc] init];
        for(int j=0; j<[[self.mazeImage objectAtIndex:i] count]; j++){
            [temp addObject:@(NO)];
        }
        [visited addObject:temp];
    }
    
    //stack of position, hehe
    //reminder that traversing in the x position goes across columns
    //and traversing in the y position goes across rows
    Stack * pathStack = [[Stack alloc]init];
    
    //first we need to add the starting position to the stack
    [pathStack push:start];
    
    //going to create array of position that represent up, down, left, right
    NSMutableArray<position*> * direction = [[NSMutableArray alloc] initWithCapacity:4];
    position * up = [[position alloc] initWithCoord:0 y:-1];
    position * down = [[position alloc] initWithCoord:0 y:1];
    position * left = [[position alloc] initWithCoord:-1 y:0];
    position * right = [[position alloc] initWithCoord:1 y:0];
    [direction addObject:up];
    [direction addObject:down];
    [direction addObject:left];
    [direction addObject:right];
    
    while(![pathStack isEmpty] || ([pathStack peek].x == end.x && [pathStack peek].y == end.y)) {//if empty, I don't think there is any possible solution
        
        position * temp2 = [pathStack peek];
        position * temp = [[position alloc] initWithCoord:temp2.x y:temp2.y]; //let's use a position pointer for this
         // marked 1 means that it was visited
        // this'll free up the stack from the start position, might be useful so I don't redraw the start rectangle in gamescene
        [pathStack pop];
        bool found = false;
        for(int a=0; a<4; a++){ //figured out a better way to check possible directions
            if(found) {
                break;
            }
            int nextX = temp.x +[[direction objectAtIndex:a] x];
            int nextY = temp.y + [[direction objectAtIndex:a]y];
            
           
            
            if([[[visited objectAtIndex:nextY] objectAtIndex:nextX] isEqualTo:@(YES)] || [[[self.mazeImage objectAtIndex:nextY] objectAtIndex:nextX] isEqualToString:@"#"] || nextX < 1 || nextY < 1 || nextX > [self.mazeImage count] || nextY > [self.mazeImage count]) { //here we check if the next block is visited, if we have a wall, and any of the edge cases where the position would go out of bounds (hopeful it works)
                continue; //inititate the next iteration of the loop, becuase at this point I know I'm stuck at a wall
            }
            position * tempHolder =[[position alloc] initWithCoord:nextX y:nextY]; //ahhh, not sure if this is completely right but I don't know how else to store nX and nY
            
            found = true;
            [pathStack push:tempHolder];
            //mark as visited
            [[visited objectAtIndex:nextY] replaceObjectAtIndex:nextX withObject:@(YES)];
            
            

        }
    
    }
 
    return pathStack;
    
   
}


//BFS algorithim start here
-(Queue *)BFS{
    
    //now I need to figure out which values are the start and which are @ end
    position * start = [[position alloc]init];
    position * end =[[position alloc]init];
    
    for(int i=0; i<[self.mazeImage count]; i++){ //rows
        for(int j=0; j<[[self.mazeImage objectAtIndex:i] count]; j++){//columns
            
            if([[[self.mazeImage objectAtIndex:i] objectAtIndex:j] isEqualToString:@"S"] ){ //S char
                start.x = j;
                start.y = i;
            }
            
            if([[[self.mazeImage objectAtIndex:i] objectAtIndex:j] isEqualToString:@"G"] ){ //G char
                end.x = j;
                end.y = i;
            }

        }
    }
        
        //creating an array that is similar to the current
        //but it returns to us if a position was traversed or not
        //will be useful later, let's try this {1 = visited, 2 = not-visited}
    NSMutableArray * visited = [[NSMutableArray alloc] initWithCapacity:[self.mazeImage count]];
    for(int i=0; i<[self.mazeImage count];i++){
        NSMutableArray * temp = [[NSMutableArray alloc] init];
        for(int j=0; j<[[self.mazeImage objectAtIndex:i] count]; j++){
            [temp addObject:@(NO)];
        }
        [visited addObject:temp];
    }
    
    //queue of position, hehe
    //reminder that traversing in the x position goes across columns
    //and traversing in the y position goes across rows
    Queue * pathQueue = [[Queue alloc] init];
    
    //first we need to add the starting position to the queue
    [pathQueue enqueue:start];
    
    //going to create array of position that represent up, down, left, right
    NSMutableArray<position*> * direction = [[NSMutableArray alloc] initWithCapacity:4];
    position * up = [[position alloc] initWithCoord:0 y:-1];
    position * down = [[position alloc] initWithCoord:0 y:1];
    position * left = [[position alloc] initWithCoord:-1 y:0];
    position * right = [[position alloc] initWithCoord:1 y:0];
    [direction addObject:up];
    [direction addObject:down];
    [direction addObject:left];
    [direction addObject:right];
    
    while(![pathQueue isEmpty] || ([pathQueue peek].x == end.x && [pathQueue peek].y == end.y)) {//if empty, I don't think there is any possible solution
        
        position * temp2 = [pathQueue peek];
        position * temp = [[position alloc] initWithCoord:temp2.x y:temp2.y]; //let's use a position pointer for this
         // marked 1 means that it was visited
        // this'll free up the stack from the start position, might be useful so I don't redraw the start rectangle in gamescene
        [pathQueue dequeue];
        bool found = false;
        for(int a=0; a<4; a++){ //figured out a better way to check possible directions
            if(found) {
                break;
            }
            int nextX = temp.x +[[direction objectAtIndex:a] x];
            int nextY = temp.y + [[direction objectAtIndex:a]y];
            
           
            
            if([[[visited objectAtIndex:nextY] objectAtIndex:nextX] isEqualTo:@(YES)] || [[[self.mazeImage objectAtIndex:nextY] objectAtIndex:nextX] isEqualToString:@"#"] || nextX < 1 || nextY < 1 || nextX > [self.mazeImage count] || nextY > [self.mazeImage count]) { //here we check if the next block is visited, if we have a wall, and any of the edge cases where the position would go out of bounds (hopeful it works)
                continue; //inititate the next iteration of the loop, becuase at this point I know I'm stuck at a wall
            }
            position * tempHolder =[[position alloc] initWithCoord:nextX y:nextY]; //ahhh, not sure if this is completely right but I don't know how else to store nX and nY
            
            found = true;
            [pathQueue enqueue:tempHolder];
            //mark as visited
            [[visited objectAtIndex:nextY] replaceObjectAtIndex:nextX withObject:@(YES)];
            
            

        }
    
    }
 
    return pathQueue;
    
   
}





@end


//Things to do:
//1. Make DFS and BFS algorithim
//-> Create a 2D array with each string obj and have the maze solver traverse
//-> the 2D array. (#= wall, . = space, S= start, G = end, P = already passed

//psuedo DFS: DFS is done 4/18
//begin at start
//add to the stack next possible position (


//pesuedo BFS: BFS is done 4/18 

