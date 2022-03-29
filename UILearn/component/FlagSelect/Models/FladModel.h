//
//  FladModel.h
//  UILearn
//
//  Created by apple on 2022/3/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FladModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;

- (instancetype)initWithDic:(NSDictionary *)dic;

+ (instancetype)flagWithDic:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
