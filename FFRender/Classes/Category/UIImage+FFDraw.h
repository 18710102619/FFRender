//
//  UIImage+FFDraw.h
//  FFKit_Example
//
//  Created by 张玲玉 on 2019/3/22.
//  Copyright © 2019 18710102619. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIBezierPath+FFDraw.h"

@interface UIImage (FFDraw)

#pragma mark - 类方法

/**
 获取视觉元素的图片

 @param size 图片的大小
 @param color 图片的背景颜色
 @return 图片
 */
+ (UIImage *)ff_getImage:(CGSize)size
                   color:(UIColor *)color;
/**
 获取视觉元素的图片

 @param size 图片的大小
 @param veArray 视觉元素数据
 @return 图片
 */
+ (UIImage *)ff_getImage:(CGSize)size
                 veArray:(NSArray *)veArray;
/**
 获取视觉元素的图片
 
 @param size 图片的大小
 @param veArray 视觉元素数据
 @param fillColor 填充颜色
 @return 图片
 */
+ (UIImage *)ff_getImage:(CGSize)size
                 veArray:(NSArray *)veArray
               fillColor:(UIColor *)fillColor;
/**
 获取带圆角的图片
 
 @param size 图片的大小
 @param backgroundColor 图片的背景颜色
 @param borderWidth 边框的宽度
 @param borderColor 边框的颜色
 @param cornerRadius 圆角值
 @return 图片
 */
+ (UIImage *)ff_getImage:(CGSize)size
         backgroundColor:(UIColor *)backgroundColor
             borderWidth:(CGFloat)borderWidth
             borderColor:(UIColor *)borderColor
            borderRadius:(CGFloat)cornerRadius;
/**
 获取带圆角的图片

 @param size 图片的大小
 @param backgroundColor 图片的背景颜色
 @param borderWidth 边框的宽度
 @param borderColor 边框的颜色
 @param cornerRadii 圆角结构体
 @return 图片
 */
+ (UIImage *)ff_getImage:(CGSize)size
         backgroundColor:(UIColor *)backgroundColor
             borderWidth:(CGFloat)borderWidth
             borderColor:(UIColor *)borderColor
             cornerRadii:(FFCornerRadii)cornerRadii;
/**
 获取带线的图片

 @param size 图片的大小
 @param lineColor 线的颜色
 @param lengths 指明虚线是如何交替绘制，为NULL则为直线。例：CGFloat lengths[] = {5,5}
 @return 图片
 */
+ (UIImage *)ff_getImage:(CGSize)size
               lineColor:(UIColor *)lineColor
                 lengths:(CGFloat[])lengths;

#pragma mark - 实例方法

/**
 切圆形
 */
- (UIImage *)ff_clipCircle;

/**
 设置大小
 */
- (UIImage *)ff_setSize:(CGSize)size;
/**
 设置文本
 */
- (UIImage *)ff_setText:(NSMutableAttributedString *)text;
/**
 设置视觉元素
 */
- (UIImage *)ff_setVEArray:(NSArray *)veArray;
/**
 设置圆角
 */
- (UIImage *)ff_setCornerRadius:(CGFloat)cornerRadius;
/**
 分别设置圆角
 */
- (UIImage *)ff_setCornerRadii:(FFCornerRadii)cornerRadii;
/**
 打印内存消耗
 */
- (void)log_MemorySize;

@end
