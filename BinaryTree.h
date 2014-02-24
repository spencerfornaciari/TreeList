//
//  BinaryTree.h
//  LinkedList
//
//  Created by Spencer Fornaciari on 2/24/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BinaryTreeNode.h"

@interface BinaryTree : NSObject

@property (nonatomic) BinaryTreeNode *rootNode, *currentNodeWereLookingAt;

-(void)addNodeToTree:(BinaryTreeNode *)node;

-(NSString *)description;

@end
