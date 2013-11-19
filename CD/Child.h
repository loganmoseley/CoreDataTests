//
//  Child.h
//  CD
//
//  Created by Moseley, Logan on 11/19/13.
//  Copyright (c) 2013 The New York Times Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Parent;

@interface Child : NSManagedObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) Parent *parent;

@end
