//
//  main.m
//  Maze
//
//  Created by Rosnel Leyva-Cortés on 4/15/21.
//

#import <Cocoa/Cocoa.h>
#import "Maze.h"
#import "Stack.h"
#import "Queue.h"
#import "ListNode.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        
        Maze * myMaze = [[Maze alloc]initWithSize:0];
    
        Stack * answerDFS = [[Stack alloc] init];
        
        Queue * answerBFS = [[Queue alloc] init];
        
        
        //this is my iterative implementation
        answerDFS = [myMaze DFS];
        
        answerBFS = [myMaze BFS];
        
        [answerDFS print];
        
        [answerBFS print];
        //end of iterative implementation
        
        
        
    }
    return NSApplicationMain(argc, argv);
}
