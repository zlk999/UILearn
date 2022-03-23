//
//  NSString+CZNSStringExt.m
//  UILearn
//
//  Created by apple on 2022/3/22.
//

#import "NSString+CZNSStringExt.h"

@implementation NSString (CZNSStringExt)

- (CGSize)sizeOftextWithMaxSize:(CGSize)maxSize font:(UIFont *)font{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

+ (CGSize)sizeWithText:(NSString *)text maxSize:(CGSize)maxSize font:(UIFont *)font{
    return [text sizeOftextWithMaxSize:maxSize font:font];
}

@end
