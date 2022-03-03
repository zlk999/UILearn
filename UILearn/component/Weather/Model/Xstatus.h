//
//  Xstatus.h
//  UILearn
//
//  Created by apple on 2021/12/25.
//

#import <Foundation/Foundation.h>
#import "XWeather.h"
NS_ASSUME_NONNULL_BEGIN

@interface Xstatus : NSObject
@property(nonatomic,copy) NSString *status;
@property(nonatomic,copy) NSString *count;
@property(nonatomic,copy) NSString *info;
@property(nonatomic,copy) NSString *infocode;
//@property(nonatomic,strong) XInfo *lives;
@property(nonatomic,copy) NSArray  *lives;
@end

NS_ASSUME_NONNULL_END
