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

const BOOL DEMO_RADIX_SORT = TRUE;


@interface SFViewController () {
    int n;
    int m;
}

@property (nonatomic) LinkedList *bestList;
@property (nonatomic) BinaryTree *bestTree;
@property (strong, nonatomic) NSMutableArray *storedRadixArray, *rawData;
@property (nonatomic) int count, maxSize;

@end

@implementation SFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    n = 1;
    m = 10;
    self.count = 0;
    self.storedRadixArray = [NSMutableArray new];


    if(!DEMO_RADIX_SORT)
    {
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
        
        [self.bestTree addNodeToTree:nodeOne];
        [self.bestTree addNodeToTree:nodeTen];
        [self.bestTree addNodeToTree:nodeFive];
        [self.bestTree addNodeToTree:nodeFour];
        [self.bestTree addNodeToTree:nodeSeven];
        [self.bestTree addNodeToTree:nodeSix];
        [self.bestTree addNodeToTree:nodeThree];
        [self.bestTree addNodeToTree:nodeTwo];
        [self.bestTree addNodeToTree:nodeNine];
        [self.bestTree addNodeToTree:nodeEight];
        
        BOOL checkValue = [self.bestTree doesValueExistInTree:37];
        
        NSLog(@"%hhd", checkValue);
    }
    else if (DEMO_RADIX_SORT)
    {
//        self.rawData = [[NSMutableArray alloc] initWithArray:@[@4, @32, @76, @53, @943, @2, @632, @8, @242]];
        self.rawData = [[NSMutableArray alloc] initWithArray:@[@104, @306, @706, @503, @909, @205, @606, @808, @201, @1001, @15005]];

      //  [self printArray:self.rawData];
        [self radixSort:self.rawData];
       
        
        [self printArray:self.storedRadixArray];
    }

	// Do any additional setup after loading the view, typically from a nib.
}

-(void)radixSort:(NSMutableArray *)array
{
    [self findMaxSize:array];
    self.count++;

    // Blank Array
    NSMutableArray *radixArray = [[NSMutableArray alloc] init];
    
    for(int i=0; i<10; i++)
    {
        radixArray[i] = [[LinkedList alloc] init];
    }

    for(NSNumber *num in array)
    {
        int index = (num.integerValue % m) / n;
        Node *newNode = [[Node alloc] initWithValue:num.integerValue];
        LinkedList *indexList = radixArray[index];
        
        // This is where the node is finally assigned at the end
        [indexList addNodeToBackOfList:newNode];
    }
    
    self.storedRadixArray = [NSMutableArray new];
   
    for (int i = 0; i < 10; i++ ) {
        LinkedList *list = radixArray[i];
        Node *currentNode = list.firstNode;
        
        while (currentNode) {
            [self.storedRadixArray addObject:[NSNumber numberWithInt:currentNode.value]];
            currentNode = currentNode.nextNode;
        }
        
    }
    
    NSLog(@"Pass #%d", self.count);
    n *= 10;
    m *= 10;
    
    if (self.count < self.maxSize) {
        [self radixSort:self.storedRadixArray];

    }
    
}

-(void)findMaxSize:(NSMutableArray *)array
{
    for (NSNumber *number in array){
        int digits = floor (log10 (abs (number.integerValue))) + 1;
        if (digits > self.maxSize){
            self.maxSize = digits;
        }
    }
}

-(void)printArray:(NSMutableArray*)array{

    
    for(NSNumber *num in array)
    {
        NSLog(@"%@", num);
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
