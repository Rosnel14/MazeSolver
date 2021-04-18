//
//  position.h
//  Maze
//
//  Created by Rosnel Leyva-Cortés on 4/17/21.
//

#ifndef position_h
#define position_h

@interface position : NSObject

@property int x; //proportional to row

@property int y; //proportional to column

-(instancetype)init;

-(instancetype)initWithCoord:(int)x_coord y: (int)y_coord;


@end

#endif /* position_h */
