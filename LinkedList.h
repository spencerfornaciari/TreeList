//
//  LinkedList.h
//  LinkedList
//
//  Created by Spencer Fornaciari on 2/24/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@interface LinkedList : NSObject

@property (nonatomic) Node *firstNode;

-(void)addNodeToFrontOfList:(Node *)newNode;
-(void)removeNodeFromFrontOfList;

@end
