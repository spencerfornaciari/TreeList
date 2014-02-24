//
//  BinaryTreeNode.h
//  LinkedList
//
//  Created by Spencer Fornaciari on 2/24/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BinaryTreeNode : NSObject

@property (nonatomic) NSInteger value;
@property (nonatomic) BinaryTreeNode *smallerNode, *biggerNode;

-(id)initWithValue:(NSInteger)value;

@end
