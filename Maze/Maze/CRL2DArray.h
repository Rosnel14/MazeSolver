//
//  CRLTwoDArray.h
//  JewelnJewels
//
//  Created by tGilani on 20/11/2012.
//
//I decided to use this because
// creating 2D arrays just became WAY too verbose 
#define kCRL2DArrayEmptyKey @"kCRL2DArrayEmptyKey"

#import <Foundation/Foundation.h>

@interface CRL2DArray : NSObject

- (id) initWithRows:(int)x columns:(int)y;

- (BOOL) insertObject:(id)data atRow:(int)x column:(int)y;
- (id) objectAtRow:(int)x column:(int)y;

- (void) removeAllObjects;

@end
