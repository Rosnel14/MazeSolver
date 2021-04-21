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
        
//       NSLog(@"%@",[myMaze.mazeImage firstObject]);
//
        Stack * answerDFS = [[Stack alloc] init];
        
        answerDFS = [myMaze DFS]; // Idk why the stack keeps on becoming nil????
        
        [answerDFS print];
        
    }
    return NSApplicationMain(argc, argv);
}
