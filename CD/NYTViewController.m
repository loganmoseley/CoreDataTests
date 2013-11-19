//
//  NYTViewController.m
//  CD
//
//  Created by Moseley, Logan on 11/19/13.
//  Copyright (c) 2013 The New York Times Company. All rights reserved.
//

#import "NYTViewController.h"
#import "Parent.h"
#import "Child.h"

@interface NYTViewController ()

@end

@implementation NYTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    NSManagedObjectModel *model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    NSManagedObjectContext *context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    context.persistentStoreCoordinator = psc;
    
    Parent *parent = [NSEntityDescription insertNewObjectForEntityForName:@"Parent" inManagedObjectContext:context];
    parent.name = @"Nathaniel Hawthorne";
    
    NSArray *childNames = @[@"Fern Gully", @"Ray Charles", @"Octocat", @"Doge", @"Tommy Jefferson"];
    for (NSString *name in childNames) {
        Child *child = [NSEntityDescription insertNewObjectForEntityForName:@"Child" inManagedObjectContext:context];
        child.name = name;
        [parent addChildrenObject:child];
    }
    
    NSLog(@"parent: %@", parent);
    
    NSLog(@"\n\nFetch parent and children independently.\n\n");
    
    NSError *error;
    NSFetchRequest *parentRequest = [NSFetchRequest fetchRequestWithEntityName:@"Parent"];
    NSFetchRequest *childRequest = [NSFetchRequest fetchRequestWithEntityName:@"Child"];
    NSArray *fetchedChildren = [context executeFetchRequest:childRequest error:&error];
    
    NSLog(@"(prove this request works) fetched children: %@", fetchedChildren);
    
    NSLog(@"\n\nDelete parent object.\n\n");
    [context deleteObject:parent];
    
    NSArray *fetchedChildren2 = [context executeFetchRequest:childRequest error:&error];
    NSArray *fetchedParents2 = [context executeFetchRequest:parentRequest error:&error];
    
    NSLog(@"fetched parents2: %@\nfetched children2: %@", fetchedParents2, fetchedChildren2);
    NSLog(@"\n\nPlay with the delete rule in 'Parent' entity in the model to see the effect on the children.\n\n");
}

@end
