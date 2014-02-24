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
                if (self.currentNodeWereLookingAt.biggerNode) {
                    self.currentNodeWereLookingAt = self.currentNodeWereLookingAt.biggerNode;
                }
                else
                {
                    self.currentNodeWereLookingAt.biggerNode = node;
                    self.currentNodeWereLookingAt = nil;
                }
            }
            else if (node.value < self.currentNodeWereLookingAt.value) {
                if (self.currentNodeWereLookingAt.smallerNode) {
                    self.currentNodeWereLookingAt = self.currentNodeWereLookingAt.smallerNode;
                }
                else
                {
                    self.currentNodeWereLookingAt.smallerNode = node;
                    self.currentNodeWereLookingAt = nil;
                }
                
            }
            else {
                //Do nothing because it is the same value
            }
        }
        //
        self.currentNodeWereLookingAt.value = node.value;
        
    }
    
    else {
        self.rootNode = node;
    }
}

-(BOOL)doesValueExistInTree:(NSInteger)valueToTest
{
    self.currentNodeWereLookingAt = self.rootNode;
    while (self.currentNodeWereLookingAt.value != valueToTest) {
        if (valueToTest > self.currentNodeWereLookingAt.value) {
            if (self.currentNodeWereLookingAt.biggerNode) {
                self.currentNodeWereLookingAt = self.currentNodeWereLookingAt.biggerNode;
            }
            else
            {
                return FALSE;
            }
        }
        else if (valueToTest < self.currentNodeWereLookingAt.value) {
            if (self.currentNodeWereLookingAt.smallerNode) {
                self.currentNodeWereLookingAt = self.currentNodeWereLookingAt.smallerNode;
            }
            else
            {
                return FALSE;
            }
            
        }
        else {
            //Do nothing because it is the same value
            return TRUE;
        }
    }
    
    return TRUE;
}


-(NSString *)description
{
    
    return nil;
}
@end
