//
//  BinaryTree.m
//  LinkedList
//
//  Created by Spencer Fornaciari on 2/24/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "BinaryTree.h"

@implementation BinaryTree

-(void)addNodeToTree:(BinaryTreeNode *)node
{
    if (self.rootNode) {
        
        self.currentNodeWereLookingAt = self.rootNode;
        while (self.currentNodeWereLookingAt) {
            if (node.value > self.currentNodeWereLookingAt.value) {
                self.currentNodeWereLookingAt = self.currentNodeWereLookingAt.biggerNode;
            }
            else if (node.value < self.currentNodeWereLookingAt.value) {
                self.currentNodeWereLookingAt = self.currentNodeWereLookingAt.smallerNode;
            }
            else {
                //Do nothing because it is the same value
            }
        }
        
        
    }
    
    else {
        self.rootNode = node;
    }
}

-(NSString *)description
{
    
    return nil;
}
@end
