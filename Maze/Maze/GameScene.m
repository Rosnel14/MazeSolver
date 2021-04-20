//
//  GameScene.m
//  Maze
//
//  Created by Rosnel Leyva-Cortés on 4/15/21.
//

#import "GameScene.h"
#import "Maze.h"

@implementation GameScene {
    SKShapeNode *_spinnyNode;
    SKShapeNode * wall;
}

- (void)didMoveToView:(SKView *)view {
    Maze * testMaze = [[Maze alloc]initWithSize:0];
    // Setup your scene here
    int columns = 0;
    int rows = 0;
    for (int i = 0; i < [testMaze.mazeImage.firstObject length]-1;i++) {
        columns += i;
    }
    rows = (int)[testMaze.mazeImage count];
    
 //   CGFloat w = (self.size.width + self.size.height) * 0.05;
    
    // Create shape node to use during mouse interaction
//    wall = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(w, w)];
//    wall.lineWidth = 2.5;
//    [self addChild:wall];
    
    //setup the maze background
//    for (int i=0;i<=rows; i++){
//        for (int j=0;j<=columns;j++){
//
//        }
//    }
    
    
}




-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
}

@end
