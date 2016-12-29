//
//  Queue.h
//  LinklistExcercises
//
//  Created by Developer on 12/28/16.
//  Copyright © 2016 Developer. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Node.h"

@interface Queue : NSObject

@property (nonatomic) Node *first;

@property (nonatomic) Node *last;

@property (nonatomic) int length;


- (void)insert:(int)x;

- (int)enqueue;



@end
