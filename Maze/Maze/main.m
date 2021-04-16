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
        NSString * filename;
        NSString *fileContent;
        NSError *error;
        
        filename = [[NSBundle mainBundle] pathForResource:@"smallMaze" ofType:@"txt"];
        fileContent = [NSString stringWithContentsOfFile:filename encoding:NSUTF8StringEncoding error:NULL];
            if (error) NSLog(@"Error reading file: %@", error.localizedDescription);

         NSLog(@"contents: %@", fileContent);
         

    }
    return NSApplicationMain(argc, argv);
}
