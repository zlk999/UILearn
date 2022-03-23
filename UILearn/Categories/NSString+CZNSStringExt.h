//
//  NSString+CZNSStringExt.h
//  UILearn
//
//  Created by apple on 2022/3/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (CZNSStringExt)

- (CGSize)sizeOftextWithMaxSize:(CGSize)maxSize font:(UIFont *)font;

+ (CGSize)sizeWithText:(NSString *)text maxSize:(CGSize)maxSize font:(UIFont *)font;

@end

NS_ASSUME_NONNULL_END
