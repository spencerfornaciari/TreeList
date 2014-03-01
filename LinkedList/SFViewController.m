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

const BOOL DEMO_LINKED_LIST = FALSE;
const BOOL DEMO_RADIX_SORT = FALSE;
const BOOL DEMO_MERGE_SORT = TRUE;


@interface SFViewController () {
    int n;
    int m;
    NSMutableArray *finalArray;
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


    if(DEMO_LINKED_LIST)
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
        self.rawData = [[NSMutableArray alloc] initWithArray:@[@104, @306, @706, @503, @909, @205, @606, @808, @201, @1001, @15005, @4, @32, @76, @53, @943, @2, @632, @8, @242, @465, @1232, @1745, @1228, @6820, @9280, @9081, @2298, @5416, @180, @3216, @624, @5703, @1547, @5420, @5668, @5877, @1394, @5878, @2066, @8827, @972, @448, @518, @697, @931, @301, @671, @54, @506, @280, @121, @628, @380, @60, @673, @105, @953, @316, @207, @304, @227, @520, @338, @780, @857, @812, @999, @681, @935, @821, @20, @72, @95, @18, @19, @94, @37, @77, @46, @67, @32, @90, @52, @49, @1, @58, @50, @91, @92, @8]];
        [self findMaxSize:self.rawData];
        [self printArray:self.rawData];
        
        [self radixSort:self.rawData];
        [self printArray:self.storedRadixArray];
    } else if (DEMO_MERGE_SORT) {
//        NSMutableArray* theArray = [NSMutableArray arrayWithArray:@[@-4,@7,@-9,@1,@0,@5,@5,@3,@3,@6,@8,@11, @20, @15, @227, @27, @21]];
        NSMutableArray *theArray = [[NSMutableArray alloc] initWithArray:@[@104, @306, @706, @503, @909, @205, @606, @808, @201, @1001, @15005, @4, @32, @76, @53, @943, @2, @632, @8, @242, @465, @1232, @1745, @1228, @6820, @9280, @9081, @2298, @5416, @180, @3216, @624, @5703, @1547, @5420, @5668, @5877, @1394, @5878, @2066, @8827, @972, @448, @518, @697, @931, @301, @671, @54, @506, @280, @121, @628, @380, @60, @673, @105, @953, @316, @207, @304, @227, @520, @338, @780, @857, @812, @999, @681, @935, @821, @20, @72, @95, @18, @19, @94, @37, @77, @46, @67, @32, @90, @52, @49, @1, @58, @50, @91, @92, @8]];
        
        finalArray = [NSMutableArray new];
        
        for(int i = 0 ; i < theArray.count ;  i = i+2){
            if(i+1 != theArray.count){
                if([theArray[i]integerValue] > [theArray[i+1]integerValue]){
                    NSMutableArray *newArray = [NSMutableArray new];
                    [newArray addObject:theArray[i+1]];
                    [newArray addObject:theArray[i]];
                    
                    [finalArray addObject:newArray];
                    //swap em
                }
                else{
                    NSMutableArray *newArray = [NSMutableArray new];
                    [newArray addObject:theArray[i]];
                    [newArray addObject:theArray[i+1]];
                    
                    [finalArray addObject:newArray];
                    // no swap
                }
            } else {
                NSMutableArray *oddArray = finalArray[finalArray.count - 1];
                
                [finalArray removeObjectAtIndex:finalArray.count - 1];
                NSNumber *num = theArray[i];
                
                for (int j = 0; j < 2; j++) {
                    if ([oddArray[j] integerValue] < num.integerValue) {
                        
                    } else {
                        [oddArray insertObject:num atIndex:j];
                        break;
                    }
                }
                [finalArray addObject:oddArray];
            }
        }
        
        NSLog(@"%@", finalArray);
        
        [self mergeArrays];

    }

	// Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - Radix Sort

-(void)radixSort:(NSMutableArray *)array
{
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

#pragma mark - Merge Sort

-(void)mergeArrays
{
    
    NSMutableArray *tempArray = finalArray;
    finalArray = [NSMutableArray new];
    
    while (tempArray.count > 0) {
        if (tempArray.count > 1) {
            NSMutableArray *array1 = tempArray[0];
            NSMutableArray *array2 = tempArray[1];
            NSMutableArray *sorted = [NSMutableArray new];
            
            while (array1.count !=0 && array2.count != 0) {
                //If first object in array 1 has greater value
                if ([array1[0] integerValue] > [array2[0] integerValue]) {
                    [sorted addObject:array2[0]];
                    [array2 removeObjectAtIndex:0];
                }
                //If first object in array 2 has greater value
                else if ([array1[0] integerValue] < [array2[0] integerValue]) {
                    [sorted addObject:array1[0]];
                    [array1 removeObjectAtIndex:0];
                }
                //If first object in array 1 and array 2 are equal
                else {
                    [sorted addObject:array1[0]];
                    [sorted addObject:array2[0]];
                    [array1 removeObjectAtIndex:0];
                    [array2 removeObjectAtIndex:0];
                }
            }
            
            //Remove remaining objects in array 1 (if any)
            while (array1.count > 0) {
                [sorted addObject:array1[0]];
                [array1 removeObjectAtIndex:0];
            }
            //Remove remaining objects in array 2 (if any)
            while (array2.count > 0) {
                [sorted addObject:array2[0]];
                [array2 removeObjectAtIndex:0];
            }
            
            [tempArray removeObjectAtIndex:0];
            [tempArray removeObjectAtIndex:0];
            [finalArray addObject:sorted];
            
        } else {
            [finalArray addObject:tempArray];
            [tempArray removeObjectAtIndex:0];
        }
        
        
    }
    
    if (finalArray.count != 1) {
        [self mergeArrays];
        
    } else  {
        NSLog(@"Final: %@", finalArray[0]);
    }
    
}

#pragma mark - Memory Warnings

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
