//
//  Node.m
//  LinkedList
//
//  Created by Spencer Fornaciari on 2/24/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "Node.h"

@implementation Node

-(id)initWithValue:(NSInteger)value
{
    if (self = [super init]) {
        self.value = value;
    }
    
    return self;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"%d", self.value];
}


@end
