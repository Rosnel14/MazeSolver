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

@implementation Maze

-(instancetype)init {
    if (self) {
        self = [super init];
        self.pathQueue = [[Queue alloc] init];
        self.pathStack = [[Stack alloc]init];
        self.pathStack = nil;
        self.pathQueue = nil;
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
        self.pathQueue = [[Queue alloc] init];
        self.pathStack = [[Stack alloc]init];
        self.pathStack = nil;
        self.pathQueue = nil;
        
        //probably have to parse each char to create the rectangles later
        self.mazeImage = [fileContent componentsSeparatedByString:@"\n"];
    }
    
    return self;
            
}

-(NSMutableArray *)DFS {
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
    for(int j=0; j <= rows; j++){ // traverse rows
        for(int k=0; k <= columns; k++){ //traverse columns
            NSRange range = NSMakeRange(k, k+1);
            NSString * object = [[self.mazeImage objectAtIndex:j] substringWithRange:range];
            [usableMaze insertObject:object atRow:j column:k];
        }
    }
    return [self DFSwrapper:usableMaze];
    
}

//I had to create a wrapper because the top method was becoming too verbose
//and crowded ;(
//wrapper method will create the solution to maze using DFS
-(NSMutableArray *)DFSwrapper:(CRL2DArray *)usableMaze{
    return nil;
}




@end


//Things to do:
//1. Make DFS and BFS algorithim
//-> Create a 2D array with each string obj and have the maze solver traverse
//-> the 2D array. (#= wall, . = space, S= start, G = end, P = already passed

//psuedo DFS:
//begin at start
//add to the stack next possible position (


//pesuedo BFS:

