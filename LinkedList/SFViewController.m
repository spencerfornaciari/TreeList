//
//  SFViewController.m
//  LinkedList
//
//  Created by Spencer Fornaciari/Chris Meehan/Ivan Lesko/Rich Lichkus on 2/24/14.
//  Copyright (c) 2014 Spencer Fornaciari/Chris Meehan/Ivan Lesko/Rich Lichkus. All rights reserved.
//

#import "SFViewController.h"
#import "LinkedList.h"
#import "Node.h"
#import "BinaryTree.h"
#import "BinaryTreeNode.h"

@interface SFViewController ()

@property (nonatomic) LinkedList *bestList;
@property (nonatomic) BinaryTree *bestTree;

@end

@implementation SFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Linked List Demo
    self.bestList = [[LinkedList alloc] init];
    
    Node *one = [[Node alloc] initWithValue:13];
    Node *two = [[Node alloc] initWithValue:26];
    Node *three = [[Node alloc] initWithValue:5];
    Node *four = [[Node alloc] initWithValue:90];
    Node *five = [[Node alloc] initWithValue:18];
    
    [self.bestList addNodeToFrontOfList:one];
    [self.bestList addNodeToFrontOfList:two];
    [self.bestList addNodeToFrontOfList:three];
    
    NSLog(@"%@", self.bestList);
    
    [self.bestList removeNodeFromFrontOfList];
    
    NSLog(@"%@", self.bestList);
    
    [self.bestList addNodeToFrontOfList:four];
    [self.bestList addNodeToFrontOfList:five];
    
    NSLog(@"%@", self.bestList);
    
    //Binary Tree Demo
    self.bestTree = [[BinaryTree alloc] init];
    
    BinaryTreeNode *nodeOne = [[BinaryTreeNode alloc] initWithValue:13];
    BinaryTreeNode *nodeTwo = [[BinaryTreeNode alloc] initWithValue:26];
    BinaryTreeNode *nodeThree = [[BinaryTreeNode alloc] initWithValue:5];
    BinaryTreeNode *nodeFour = [[BinaryTreeNode alloc] initWithValue:90];
    BinaryTreeNode *nodeFive = [[BinaryTreeNode alloc] initWithValue:18];
    BinaryTreeNode *nodeSix = [[BinaryTreeNode alloc] initWithValue:43];
    BinaryTreeNode *nodeSeven = [[BinaryTreeNode alloc] initWithValue:28];
    BinaryTreeNode *nodeEight = [[BinaryTreeNode alloc] initWithValue:7];
    BinaryTreeNode *nodeNine = [[BinaryTreeNode alloc] initWithValue:37];
    BinaryTreeNode *nodeTen = [[BinaryTreeNode alloc] initWithValue:52];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
