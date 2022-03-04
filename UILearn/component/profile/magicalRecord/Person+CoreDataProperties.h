//
//  Person+CoreDataProperties.h
//  
//
//  Created by apple on 2022/3/4.
//
//

#import "Person+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest NS_SWIFT_NAME(fetchRequest());

@property (nonatomic) int16_t age;
@property (nullable, nonatomic, copy) NSString *firstName;
@property (nullable, nonatomic, copy) NSString *lastName;
@property (nullable, nonatomic, copy) NSString *rrrr;
@end

NS_ASSUME_NONNULL_END
