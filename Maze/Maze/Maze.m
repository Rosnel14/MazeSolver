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
        //will be useful later
        BOOL visited[[self.mazeImage count]][[self.mazeImage count]];
        for(int i=0; i<[self.mazeImage count]; i++){
            for(int j=0; j<[[self.mazeImage objectAtIndex:i] count]; j++){
                visited[i][j] = NO;
            }
        }
    NSLog(@"%d",visited[2][2]);
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
        visited[temp.x][temp.y] = true; // this'll free up the stack from the start position, might be useful so I don't redraw the start rectangle in gamescene
        bool found = false;
        for(int a=0; a<4; a++){ //figured out a better way to check possible directions
            if(found) {
                break;
            }
            int nextX = temp.x +[[direction objectAtIndex:a] x];
            int nextY = temp.y + [[direction objectAtIndex:a]y];
            
           
            
            if(visited[nextY][nextX] == YES|| [[[self.mazeImage objectAtIndex:nextY] objectAtIndex:nextX] isEqualToString:@"#"] || nextX < 1 || nextY < 1 || nextX > [self.mazeImage count] || nextY > [self.mazeImage count]) { //here we check if the next block is visited, if we have a wall, and any of the edge cases where the position would go out of bounds (hopeful it works)
                
                continue; //inititate the next iteration of the loop, becuase at this point I know I'm stuck at a wall
            }
            position * tempHolder =[[position alloc] initWithCoord:nextX y:nextY]; //ahhh, not sure if this is completely right but I don't know how else to store nX and nY
            
            found = true;
            [pathStack push:tempHolder];
            visited[nextY][nextX] = true;
            NSLog(@"%d",visited[2][2]);
            
//            if([(int)[[self.mazeImage objectAtIndex:nextY] objectAtIndex:nextX]] == 71) {//if reach the end, char val of G
//                break;
//            }
        }
    
    }
 
    return pathStack;
    
   
}


//BFS algorithim start here
-(Queue *)BFS{
    int columns = 0;
    int rows = 0;
    for (int i = 0; i < [self.mazeImage.firstObject length]-1;i++) {
        columns += i;
    }
    rows = (int)[self.mazeImage count];
    
    //this will initialize a 2D array with the dimensions of the maze
    CRL2DArray * usableMaze = [[CRL2DArray alloc]initWithRows:rows columns:columns];
    
    //this will fill in each individual element in the array with
    //the specific character (though I'm treating them as strings)
    //from the text file as was stored into the mazeImage property

    NSString * object;
    for(int j=1; j < rows; j++){ // traverse rows
        for(int k=0; k < [[self.mazeImage objectAtIndex:j] length]-1; k++){ //traverse columns
            char currentChar = [[self.mazeImage objectAtIndex:j] characterAtIndex:k];
            object =[NSString stringWithFormat:@"%C",currentChar];
            [usableMaze insertObject:object atRow:j column:k];
            
        }
        //Aha, I got it to work! by using a char conversion and then making it a string it works, though it's a bit inefficient 4/19
    }  ///Aghhhh there is an out of bounds substring error and I can't figure out why this is happening -> -[__NSCFString substringWithRange:]: Range {9, 1} out of bounds; string length 8
    
    
    
    //now I need to figure out which values are the start and which are @ end
    position * start = [[position alloc]init];
    position * end =[[position alloc]init];
    
    for(int l=0; l <= rows-1; l++ ) {
        for(int m = 0; m <= columns-1; m++) {
            if([[usableMaze objectAtRow:l column:m] isEqualTo:@"S"]) {
                start.y=l;
                start.x=m;
            }
            if([[usableMaze objectAtRow:l column:m] isEqualTo:@"G"]) {
                end.y=l;
                end.x=m;
            }
        }
    }
    
    
    return [self BFSwrapper:usableMaze start:start end:end];
}

//reducing verbsoity with BFS method
-(Queue *)BFSwrapper:(CRL2DArray *)usableMaze start:(position *)start end:(position *)end{
    int columns = 0;
    int rows = 0;
    for (int i = 0; i < [self.mazeImage.firstObject length]-1;i++) {
        columns += i;
    }
    rows = (int)[self.mazeImage count];
    
    //creating an array that is similar to the current
    //but it returns to us if a position was traversed or not
    //will be useful later
    bool visited[rows][columns];
    for(int i=0; i<=rows-1; i++){
        for(int j=0; j<=columns-1; j++){
            visited[i][j] = false;
        }
    }
    

    //reminder that traversing in the x position goes across columns
    //and traversing in the y position goes across rows
    Queue* pathQueue= [[Queue alloc] init];
    
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
    
    while(!pathQueue.isEmpty || [[usableMaze objectAtRow:[[pathQueue peek]y] column:[[pathQueue peek]x]] isEqualTo:@"G"]) {//if empty, I don't think there is any possible solution lol
        position * temp = [[position alloc] initWithCoord:[[pathQueue peek]x] y:[[pathQueue peek]y]]; //let's use a position pointer for this
        [pathQueue dequeue];// this'll free up the queue from the start position, might be useful so I don't redraw the start rectangle in gamescene
        
        for(int a=0; a<4; a++){ //figured out a better way to check possible directions
            int nextX = temp.x +[[direction objectAtIndex:a] x];
            int nextY = temp.y + [[direction objectAtIndex:a]y];
            
            if(visited[nextY][nextX] || [[usableMaze objectAtRow:nextY column:nextX] isEqualTo:@"#"] || nextX < 1 || nextY < 1 || nextX > columns || nextY > rows) { //here we check if the next block is visited, if we have a wall, and any of the edge cases where the position would go out of bounds (hopeful it works)
                continue; //inititate the next iteration of the loop, becuase at this point I know I'm stuck at a wall
            }
            position * tempHolder =[[position alloc] initWithCoord:nextX y:nextY]; //ahhh, not sure if this is completely right but I don't know how else to store nX and nY
            [pathQueue enqueue:tempHolder];
            visited[nextY][nextX] = true;
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

