//
//  XImagePickCV.m
//  UILearn
//
//  Created by apple on 2022/1/12.
//

#import "XImagePickCV.h"
#import "Person+CoreDataProperties.h"
#import "UIButton+XExtension.h"
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
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 550, 200, 50)];
    [btn setTitle:@"按钮点击" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    // 按钮不可点击时,文字颜色置灰
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
//    btn.center = self.view.center;
    [btn addTarget:self action:@selector(tapBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    [self drawExpecialBtn];
}

//方法一
//通过UIButton的enabled属性和userInteractionEnabled属性控制按钮是否可点击。此方案在逻辑上比较清晰、易懂，但具体代码书写分散，常常涉及多个地方。
//- (void)tapBtn:(UIButton *)btn{//防止按钮多次点击
//    btn.enabled = NO;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        btn.enabled = YES;
//    });
//}

//方法二：
// 此方法会在连续点击按钮时取消之前的点击事件，从而只执行最后一次点击事件
//+ (void)cancelPreviousPerformRequestsWithTarget:(id)aTarget selector:(SEL)aSelector object:(nullable id)anArgument;
// 多长时间后做某件事情
//- (void)performSelector:(SEL)aSelector withObject:(nullable id)anArgument afterDelay:(NSTimeInterval)delay;
//- (void)tapBtn:(UIButton *)btn{//防止按钮多次点击
//    NSLog(@"按钮点击了");
//    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(ButtonClickAction:) object:btn];
//    [self performSelector:@selector(ButtonClickAction:) withObject:btn afterDelay:2.0];
//
//}
//- (void)ButtonClickAction:(UIButton*)btn{
//    NSLog(@"点真正开始执行业务 - 比如网络请求...");
//}

/**方法3
 
 通过Runtime交换UIButton的响应事件方法，从而控制响应事件的时间间隔。

 实现步骤如下:

 创建一个UIButton的分类，使用runtime增加public属性cs_eventInterval和private属性cs_eventInvalid。
 在+load方法中使用runtime将UIButton的-sendAction:to:forEvent:方法与自定义的cs_sendAction:to:forEvent:方法进行交换
 使用cs_eventInterval作为控制cs_eventInvalid的计时因子，用cs_eventInvalid控制UIButton的event事件是否有效。
*/

/** 用法 */
- (void)drawExpecialBtn{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 650, 200, 50)];
    [btn setTitle:@"运行时防止重复点击" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    // 按钮不可点击时,文字颜色置灰
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    btn.backgroundColor = UIColor.systemPinkColor;
    [btn addTarget:self action:@selector(tapBtn:) forControlEvents:UIControlEventTouchUpInside];
    btn.cs_eventInterval = 2.0;
    [self.view addSubview:btn];
}

- (void)tapBtn:(UIButton *)btn {
    NSLog(@"按钮点击...");
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
