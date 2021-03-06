//
//  LinklistExcerciseViewController.m
//  LinklistExcercises
//
//  Created by Developer on 6/21/16.
//  Copyright © 2016 Developer. All rights reserved.
//

#import "LinklistExcerciseViewController.h"


@interface LinklistExcerciseViewController ()

@property Queue *queueForMovingAverage;

@end

@implementation LinklistExcerciseViewController

- (void)viewDidLoad {
    [super viewDidLoad];


//    [self removeValueFromList];
//    [self linklistPartition];
//    [self sumLists];
    [self intersectOfTwoLists];

//    [self reverseList];
//    [self EqualLists];
//    [self movingAverage:3];
    
//    [self removeValueFromList];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (Node *)createListLength:(int)length startingAt:(int)content{
    
    if (length ==0) {
        return nil;
    }
    
    Node *node = [Node new];
    node.content = content;
    node.next = [self createListLength:length-1 startingAt:content-1];
    
    return node;
}

- (void)printList:(Node *)head {

    NSMutableString *outputString = [NSMutableString new];
    
    Node *current = head;
    
    while(current != nil) {
        
        [outputString appendFormat:@" %d", current.content];
        
        current = current.next;
    }

    NSLog(@"%@", outputString);
}


#pragma mark ReverseList

- (void)reverseList {
    
    Node *head = [self createListLength:6 startingAt:6];
    NSLog(@"%@", head);
    Node *headTwo = [self createListLength:4 startingAt:6];
    
    List *list = [self reverseListTwo:head];
    NSLog(@"%@", list.head);
}

- (List *)reverseListTwo:(Node *)head {

    List *reversedList = [List new];

    Node *current = head;
    while (current != nil) {
    
        Node *temp = current;
        current = current.next;
        
        //Insert temp into reverseList's front
        temp.next = reversedList.head;
        reversedList.head = temp;
    }

    return reversedList;
}

- (List *)reverseList:(Node *)head {

    if (head.next == nil) {
        
        List *reverseList = [[List alloc] init];
        reverseList.head = head;
        reverseList.tail = head;
        
        return reverseList;
    }

    List *reversedList = [self reverseList:head.next];
    
    head.next = nil;
    reversedList.tail.next = head;
    reversedList.tail = head;
    
    return reversedList;
}

#pragma mark Check for equality
- (void)EqualLists {
    Node *head = [self createListLength:6 startingAt:6];
    [self printList:head];
    Node *headTwo = [self createListLength:6 startingAt:6];
    
    BOOL result = [self IsListA:head equalToListB:headTwo];
    NSLog(@"%d", result);
}


- (BOOL)IsListA:(Node *)headA equalToListB:(Node *)headB {
        
    Node *currentA = headA;
    Node *currentB = headB;
    BOOL result = YES;
    while (currentA != nil && currentB != nil) {
        
        if (currentA.content != currentB.content) {
            result = NO;
            break;
        }
        
        currentA = currentA.next;
        currentB = currentB.next;
    }
    
    if(currentA !=nil || currentB !=nil){
        result = NO;
    }
    
    return result;
}

#pragma mark Remove value
//Remove all elements from a linked list of integers that have value val.
- (void)removeValueFromList {
    Node *head = [self createListLength:1 startingAt:6];
    NSLog(@"%@", head);
    Node *headTwo = [self createListLength:5 startingAt:6];
    
    /*  Create a list with duplicat and than remove duplicat   */
    List *list = [self reverseList:head];
    list.tail.next = headTwo;
    Node *listWithDuplicate = list.head;
    
    
    [self printList:listWithDuplicate];
    Node *solutionList = [self removeValue:6 fromList:listWithDuplicate];
    [self printList:solutionList];
}

- (Node *)removeValue:(int)value fromList:(Node *)head {

    Node *current = head;
    while(current.next != nil) {
        
        Node *next = current.next;
        if (next.content == value) {
        
            current.next = next.next;        
        }
        else {
            current = current.next;
        }
    }
    
    if (head.content == value) {
        
        head = head.next;
    }
    
    return head;
}

#pragma mark Linklist partiction

/* Linklist partiction: partition a link list around a vlaue x, such that all nodes less than x comes before all 
 nodes greater than or equal to x.  If x is contained within the list, the value just needs to be after the element
 less than x  */

- (void)linklistPartition {
    Node *head = [self createListLength:6 startingAt:6];
    Node *headTwo = [self createListLength:3 startingAt:6];

    //Create a list with duplicat and than remove duplicat
    List *list = [self reverseList:headTwo];
    list.tail.next = head;
    Node *listWithDuplicate = list.head;
    //4 - 5 - 6 - 6 - 5 - 4 - 3 - 2 - 1
    
    int x=5;
    
    [self printList:listWithDuplicate];
    Node *partitionedList = [self partitionLinkList:listWithDuplicate atValue:x];
    [self printList:partitionedList];
    // 1 - 2 - 3 - 4 - 5 - 6 - 6 - 5 - 4
}

- (Node *)partitionLinkListTwo:(Node *)head atValue:(int)k {
    
    Node *front;
    Node *endOfFront;
    Node *back;
    
    Node *current = head;
    while ( current != nil) {
    
        Node *temp = current;
        current = current.next;
        temp.next = nil;
        
        if (temp.content < k) {
            if (front == nil) {
                front = temp;
                endOfFront = front;
            }
            else {
                temp.next = front;
                front = temp;
            }
        }
        else {
            if (back == nil) {
                back = temp;
            }
            else {
                temp.next = back;
                back = temp;
            }
        }
    }
    
    endOfFront.next = back;
    return front;
}

- (Node *)partitionLinkList:(Node *)head atValue:(int)k {
    
    List *newList = [List new];
    
    while (head != nil) {
        
        Node *current = [Node new];
        current.content = head.content;
        if (newList.head == nil && newList.tail == nil) {
            newList.head = current;
            newList.tail = current;
        }
        
        if (current.content<k) {
            //insertHead at the head of the new list
            [self insertNode:current atHeadOfList:newList];
        }
        else {
            //insertHead at the tail of the new list
            [self insertNode:current atTailOfList:newList];
        }
        
        //step to the next node
        head = head.next;
    }
    
    return newList.head;
}


- (void)insertNode:(Node *)node atHeadOfList:(List *)list {

    node.next = list.head;
    list.head = node;
}

- (void)insertNode:(Node *)node atTailOfList:(List *)list {

    list.tail.next = node;
    list.tail = node;
}


# pragma mark Sum Lists
/*  Sum List: Two numbers are represented by a linked list, where each node contains a single digit.  
 The digits are stored in reverse order.  
 While a function that adds the two numbers and returns the sum as a linked list   */

- (void)sumLists {
    Node *head = [self createListLength:1 startingAt:4];   // 6 - 5 - 4 - 3 - 2 - 1
    Node *headTwo = [self createListLength:1 startingAt:4];  // 6 - 5 - 4
    //Create reverse list.
    List *list = [self reverseList:headTwo];
    headTwo = list.head;  // 4 - 5 - 6
    
    Node *sum = [Node new];
    sum.content = 0;
    [self addListA:head andB:headTwo toC:sum];
    [self printList:sum];
}

- (void)addListA:(Node *)nodeA andB:(Node *)nodeB toC:(Node *)nodeC {

    int a = 0;
    if (nodeA) {
        a = nodeA.content;
    }
    
    int b = 0;
    if (nodeB) {
        b = nodeB.content;
    }
    
    int c = nodeC.content;
    
    int sum = a + b + c;
    c = sum % 10;
    nodeC.content = c;

    int carray = sum / 10;
    
    if (nodeA.next != nil || nodeB.next != nil || carray > 0 ) {
    
        Node *carrayNode = [Node new];
        carrayNode.content = carray;
        nodeC.next = carrayNode;
        [self addListA:nodeA.next andB:nodeB.next toC:nodeC.next];
    }
}


#pragma mark IntersectOfTwoLists

- (void)intersectOfTwoLists {
    
    Node *listA = [self createListLength:6 startingAt:6];   // 6 - 5 - 4 - 3 - 2 - 1
    Node *listB = [self createListLength:3 startingAt:6];  // 6 - 5 - 4
    //Create reverse list.
    List *customListB = [self reverseList:listB]; //4 - 5 - 6

    Node *intersect = listA;
    for (int i=0; i<4; i++) {
        intersect = intersect.next;
    }
    
    customListB.tail.next = intersect;  // 4 - 5 - 6 - 2 - 1
    listB = customListB.head;
    
    Node *intersection = [self intersectOfListA:listA andListB:listB];
    [self printList:intersection];
}


- (Node *)v2intersectOfListA:(Node *)headA andListB:(Node *)headB {

    //Find longer of the two
    Node *longerList;
    Node *shorterList;
    
    int diffOfLists = 0;
    Node *currentA = headA;
    Node *currentB = headB;
    while (currentA != nil || currentB != nil){
    
        if (currentA == nil) {
            longerList = headB;
            shorterList = headA;
            diffOfLists++;
        }
        if (currentB == nil) {
            longerList = headA;
            shorterList = headB;
            diffOfLists++;
        }
        
        currentA = currentA.next;
        currentB = currentB.next;
    }

    for (int i=0; i<diffOfLists; i++){
        longerList = longerList.next;
    }
    
    Node *currentLong = longerList;
    Node *currentShort = shorterList;
    while (currentLong != nil && currentShort != nil) {
        
        if (currentLong.content == currentShort.content) {
            break;
        }
        
        currentLong = currentLong.next;
        currentShort = currentShort.next;
    }

    return currentLong;
}


- (Node *)intersectOfListA:(Node *)nodeA andListB:(Node *)nodeB {
    
    int lengthA = [self lengthOfList:nodeA];
    int lengthB = [self lengthOfList:nodeB];
    Node *longerList, *shorterList;
    int lengthDifference = 0;
    if (lengthA>=lengthB){
        longerList = nodeA;
        shorterList = nodeB;
        lengthDifference = lengthA-lengthB;
    }
    else {
        longerList = nodeB;
        shorterList = nodeA;
        lengthDifference = lengthB-lengthA;
    }
    
    //Step in longer List til lenght is same as shorter.
    Node *startOfLongList = longerList;
    for (int i=0; i<lengthDifference; i++) {
        startOfLongList = startOfLongList.next;
    }
    
    while (startOfLongList && shorterList) {
        
        if (startOfLongList == shorterList) {
            break;
        }
        
        startOfLongList = startOfLongList.next;
        shorterList = shorterList.next;
    }
    
    return shorterList;
}

- (int)lengthOfList:(Node *)node {
    
    int count = 0;
    while (node != nil) {
        
        count++;
        node = node.next;
    }
    
    return count;
}


#pragma mark Moving Data Stream
//            Moving Average from Data Stream
//
//            Given a stream of integers and a window size, calculate the moving average of all integers in the sliding window.
//
//            For example,
//            MovingAverage m = new MovingAverage(3);
//            m.next(1) = 1
//            m.next(10) = (1 + 10) / 2
//            m.next(3) = (1 + 10 + 3) / 3
//            m.next(5) = (10 + 3 + 5) / 3

- (void)movingAverage:(int)window {

    self.queueForMovingAverage = [Queue new];
    
    int average = [self movingAverageWindow:window Next:1];
    NSLog(@"%d", average);
    
    average = [self movingAverageWindow:window Next:3];
    NSLog(@"%d", average);
    
    average = [self movingAverageWindow:window Next:5];
    NSLog(@"%d", average);
}

- (int)movingAverageWindow:(int)window Next:(int)next {
    
    if (self.queueForMovingAverage.length > window) {
        [self.queueForMovingAverage enqueue];
    }
    [self.queueForMovingAverage insert:next];
    
    Queue *newQueue = [Queue new];
    
    
    int sum = 0;
    int length = self.queueForMovingAverage.length;
    for (int i=0; i<length; i++) {
        
        int first = [self.queueForMovingAverage enqueue];
        sum = sum + first;
        
        [newQueue insert:first];
    }
    
    
    self.queueForMovingAverage = newQueue;
    
    return sum/length;
}


@end



@implementation List

@end


