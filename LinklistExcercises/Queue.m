//
//  Queue.m
//  LinklistExcercises
//
//  Created by Developer on 12/28/16.
//  Copyright © 2016 Developer. All rights reserved.
//

#import "Queue.h"

@implementation Queue


- (void)insert:(int)x {
    
    if (self.first == nil) {
        
        self.first = [Node new];
        self.first.content = x;
        self.first.next = nil;
        
        self.length = 1;
        
        self.last = self.first;
    }
    else {
        
        Node *newElement = [Node new];
        newElement.content = x;
        newElement.next = nil;
        
        self.last.next = newElement;
        self.last = self.last.next;
        
        self.length = self.length + 1;
    }
}

- (int)enqueue {

    if (self.length == 0 || self.first == nil) {
        return INT_MIN;
    }
    else {
        int returnValue = self.first.content;
        
        self.first = self.first.next;
        
        self.length = self.length - 1;
        
        return returnValue;
    }
}





@end
