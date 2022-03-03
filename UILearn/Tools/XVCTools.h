//
//  XVCTools.h
//  UILearn
//
//  Created by apple on 2022/1/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@protocol XVCToolsDelegate <NSObject>
- (void)getCityWithToool:(NSString *)cityName;
@end



@interface XVCTools : NSObject
@property(nonatomic, strong) NSString *currentCity;
@property (strong,nonatomic)void (^getCityblock) (NSString * cityName);
@property(nonatomic,weak) id<XVCToolsDelegate>delegate;
- (void)locate ;
@end


NS_ASSUME_NONNULL_END
 
