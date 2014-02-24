//
//  LinkedList.m
//  LinkedList
//
//  Created by Spencer Fornaciari on 2/24/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "LinkedList.h"

@implementation LinkedList

- (id)init {
    if (self = [super init]) {
        self.firstNode = nil;
    }
    
    return self;
}

-(void)addNodeToFrontOfList:(Node *)newNode
{
    if (self.firstNode) {
        newNode.nextNode = self.firstNode;
        self.firstNode = newNode;
    }
    
    else {
        self.firstNode = newNode;
    }
    
}
-(void)removeNodeFromFrontOfList
{
   
    if (self.firstNode) {
        Node *deletedNode = self.firstNode;
        self.firstNode = self.firstNode.nextNode;
        deletedNode = nil;
    }
}

-(NSString *)description
{
    Node *currentNode = self.firstNode;
    
    NSString *nodeString = @"";
    while (currentNode) {
//        NSLog(@"%@", currentNode);
        nodeString = [nodeString stringByAppendingString:[NSString stringWithFormat:@"%@\n", currentNode.description]];
        
        currentNode = currentNode.nextNode;
        
    }
    
    return nodeString;
    
}

@end
