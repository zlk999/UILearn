//
//  Person+CoreDataProperties.m
//  
//
//  Created by apple on 2022/3/4.
//
//

#import "Person+CoreDataProperties.h"

@implementation Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Person"];
}

@dynamic age;
@dynamic firstName;
@dynamic lastName;
@dynamic rrrr;
@end
