//
//  LinklistExcerciseViewController.h
//  LinklistExcercises
//
//  Created by Developer on 6/21/16.
//  Copyright © 2016 Developer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Node.h"

@interface LinklistExcerciseViewController : UIViewController

@end

@interface List : NSObject

@property (nonatomic) Node *head;
@property (nonatomic) Node *tail;

@end