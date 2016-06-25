//
//  Node.h
//  LinklistExcercises
//
//  Created by Developer on 6/21/16.
//  Copyright © 2016 Developer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property (nonatomic) int content;

//As linklist node.
@property (nonatomic) Node *previous;
@property (nonatomic) Node *next;

//As Tree node.
@property (nonatomic) Node *left;
@property (nonatomic) Node *right;

@end
