//
//  Parent.h
//  CD
//
//  Created by Moseley, Logan on 11/19/13.
//  Copyright (c) 2013 The New York Times Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Child;

@interface Parent : NSManagedObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSSet *children;
@end

@interface Parent (CoreDataGeneratedAccessors)

- (void)addChildrenObject:(Child *)value;
- (void)removeChildrenObject:(Child *)value;
- (void)addChildren:(NSSet *)values;
- (void)removeChildren:(NSSet *)values;

@end
