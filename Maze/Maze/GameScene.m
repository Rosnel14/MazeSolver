//
//  GameScene.m
//  Maze
//
//  Created by Rosnel Leyva-Cortés on 4/15/21.
//

#import "GameScene.h"

@implementation GameScene {
    SKShapeNode *_spinnyNode;
}

- (void)didMoveToView:(SKView *)view {
    // Setup your scene here

    
    CGFloat w = (self.size.width + self.size.height) * 0.05;
    
    // Create shape node to use during mouse interaction
    _spinnyNode = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(w, w) cornerRadius:w * 0.3];
    _spinnyNode.lineWidth = 2.5;
    [self addChild:_spinnyNode];
    
}




-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
}

@end
