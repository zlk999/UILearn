//
//  XImagePickCV.m
//  UILearn
//
//  Created by apple on 2022/1/12.
//

#import "XImagePickCV.h"
#import "Person+CoreDataProperties.h"

@interface XImagePickCV ()

@end

@implementation XImagePickCV

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"UIImagePickerController";
    self.view.backgroundColor = UIColor.whiteColor;
    // Do any additional setup after loading the view.
    
    [self creatImagePickerViewController];
}

- (void)creatImagePickerViewController{
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button.frame = CGRectMake(50, 150, 200, 50);
    button.layer.cornerRadius = 20;
    button.layer.masksToBounds = YES;
    button.titleLabel.font = [UIFont systemFontOfSize:20];;
    button.backgroundColor = UIColor.redColor;
    [button setTitle:@"保存数据" forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(createData) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
    
    
    UIButton *findData = [UIButton buttonWithType:(UIButtonTypeCustom)];
    findData.frame = CGRectMake(50, 250, 200, 50);
    findData.layer.cornerRadius = 20;
    findData.layer.masksToBounds = YES;
    findData.titleLabel.font = [UIFont systemFontOfSize:20];;
    findData.backgroundColor = UIColor.redColor;
    [findData setTitle:@"findData" forState:(UIControlStateNormal)];
    [findData addTarget:self action:@selector(findData) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:findData];
    
    UIButton *updateDate = [UIButton buttonWithType:(UIButtonTypeCustom)];
    updateDate.frame = CGRectMake(50, 350, 200, 50);
    updateDate.layer.cornerRadius = 20;
    updateDate.layer.masksToBounds = YES;
    updateDate.titleLabel.font = [UIFont systemFontOfSize:20];;
    updateDate.backgroundColor = UIColor.redColor;
    [updateDate setTitle:@"updateDate" forState:(UIControlStateNormal)];
    [updateDate addTarget:self action:@selector(updateDate) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:updateDate];

    UIButton *deleteData = [UIButton buttonWithType:(UIButtonTypeCustom)];
    deleteData.frame = CGRectMake(50, 450, 200, 50);
    deleteData.layer.cornerRadius = 20;
    deleteData.layer.masksToBounds = YES;
    deleteData.titleLabel.font = [UIFont systemFontOfSize:20];;
    deleteData.backgroundColor = UIColor.redColor;
    [deleteData setTitle:@"deleteData" forState:(UIControlStateNormal)];
    [deleteData addTarget:self action:@selector(deleteData) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:deleteData];
}

- (void)createData{
    Person *pp = [Person MR_createEntity];
    pp.firstName = @"张";
    pp.lastName = @"3";
    pp.age = 25;
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait]; //向数据库添加记录，至永久储存
}

//查询记录
- (void)findData{
//    查询数据库中所有数据
    NSArray *person = [Person MR_findAll];
//    查询所有的Person并按照firstname排序
    NSArray *personSorted = [Person MR_findAllSortedBy:@"firstName" ascending:YES];
//    差询所有age属性为25的person记录
    NSArray *personAgeEqual25 = [Person MR_findByAttribute:@"age" withValue:[NSNumber numberWithInt:25]];
//    查询数据库中的第一条记录
    Person *personFirst = [Person MR_findFirst];
    
    NSLog(@"person:%@  personSorted:%@  personAgeEqual25:%@ personFirst: %@", person, personSorted, personAgeEqual25, personFirst);
    
    // 查找数据库中的第一条记录的全名
    personFirst = [Person MR_findFirst];
    NSLog(@"personName:%@ %@ personNameAGE:%d", personFirst.firstName, personFirst.lastName,personFirst.age);
    
    NSLog(@"数量%ld",person.count);
}

- (void)updateDate{
    NSArray *personArr = [Person MR_findByAttribute:@"age" withValue:[NSNumber numberWithInt:25]];
    NSEnumerator *keyEnumerator;
    keyEnumerator = [personArr objectEnumerator];
    Person *person;
    while (person = [keyEnumerator nextObject]) {
        person.firstName = @"李";
    }
    for (Person *person in personArr) {
        person.lastName = @"四";
    }
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

- (void)deleteData{
    NSArray *personArr = [Person MR_findByAttribute:@"age" withValue:[NSNumber numberWithInt:25]];
    for (Person *person in personArr) {
        [person MR_deleteEntity];
    }
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

@end
