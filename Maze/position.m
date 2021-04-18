//
//  position.m
//  Maze
//
//  Created by Rosnel Leyva-Cortés on 4/17/21.
//

#import <Foundation/Foundation.h>
#import "position.h"

@implementation position

-(instancetype)init{
    if(self){
        self = [super init];
        self.x = 0;
        self.y = 0;
    }
    return self;
}

-(instancetype)initWithCoord:(int)x_coord y:(int)y_coord {
    if(self){
        self = [super init];
        self.x = x_coord;
        self.y = y_coord;
    }
    return self; 
}

@end
