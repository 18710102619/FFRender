//
//  NSMutableAttributedString+FFDraw.h
//  FFKit_Example
//
//  Created by 张玲玉 on 2019/2/15.
//  Copyright © 2019年 18710102619. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (FFDraw)

#pragma mark - 类方法

+ (instancetype)ff_stringWithString:(NSString *)string;

+ (instancetype)ff_stringWithHTMLString:(NSString *)string;

+ (instancetype)ff_stringWithString:(NSString *)string font:(UIFont *)font color:(UIColor *)color;

+ (instancetype)ff_stringWithString:(NSString *)string font:(UIFont *)font;

+ (instancetype)ff_stringWithString:(NSString *)string color:(UIColor *)color;

#pragma mark - 实例方法

/**
 设置字体大小
 */
- (void)ff_setFont:(UIFont *)font;
/**
 设置字体颜色
 */
- (void)ff_setColor:(UIColor *)color;
/**
 设置背景颜色
 */
- (void)ff_setBackgroundColor:(UIColor *)color;
/**
 设置中心偏移
 */
- (void)ff_setOffset:(int)offset;
/**
 追加字符串
 */
- (void)ff_appendString:(NSString *)string;
- (void)ff_appendString:(NSString *)string offset:(int)offset;
/**
 追加图片
 */
- (void)ff_appendImage:(UIImage *)image size:(CGSize)size;
- (void)ff_appendImage:(UIImage *)image size:(CGSize)size offset:(int)offset;
/**
 设置换行方式
 */
- (void)ff_setLineBreakMode:(NSLineBreakMode)lineBreakMode;
/**
 设置对齐方式
 */
- (void)ff_setAlignment:(NSTextAlignment)alignment;
/**
 设置行间距
 */
- (void)ff_setLineSpacing:(CGFloat)lineSpacing;
/**
 设置数字颜色
 */
- (void)ff_setNumberColor:(UIColor *)color;
/**
 根据宽度获取高度
 */
- (CGSize)ff_getSizeWithWidth:(CGFloat)width;

@end

