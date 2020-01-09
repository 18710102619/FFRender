//
//  UIBezierPath+FFDraw.m
//  FFKit_Example
//
//  Created by 张玲玉 on 2019/3/29.
//  Copyright © 2019 18710102619. All rights reserved.
//

#import "UIBezierPath+FFDraw.h"

/**
 - (void)addArcWithCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise
   可以画出一段弧线。看下各个参数的意义：
     center：圆心的坐标
     radius：半径
     startAngle：起始的弧度
     endAngle：圆弧结束的弧度
     clockwise：YES为顺时针，No为逆时针
 */

@implementation UIBezierPath (FFDraw)

+ (UIBezierPath *)ff_getBezierPathWithRect:(CGRect)rect cornerRadii:(FFCornerRadii)radii lineWidth:(CGFloat)lineWidth
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    CGFloat lineCenter=lineWidth/8.0;
    CGPoint point1=CGPointMake(radii.topLeft, lineCenter);
    CGPoint point2=CGPointMake(lineCenter, CGRectGetHeight(rect)-radii.bottomLeft);
    CGPoint point3=CGPointMake(CGRectGetWidth(rect)-radii.bottomRight, CGRectGetHeight(rect)-lineCenter);
    CGPoint point4=CGPointMake(CGRectGetWidth(rect)-lineCenter, radii.topRight);
    
    [path moveToPoint:point1];
    [path addArcWithCenter:CGPointMake(radii.topLeft, radii.topLeft) radius:radii.topLeft - lineCenter startAngle:M_PI * 1.5 endAngle:M_PI clockwise:NO];
    
    [path addLineToPoint:point2];
    [path addArcWithCenter:CGPointMake(radii.bottomLeft, CGRectGetHeight(rect) - radii.bottomLeft) radius:radii.bottomLeft - lineCenter startAngle:M_PI endAngle:M_PI * 0.5 clockwise:NO];
    
    [path addLineToPoint:point3];
    [path addArcWithCenter:CGPointMake(CGRectGetWidth(rect) - radii.bottomRight, CGRectGetHeight(rect) - radii.bottomRight) radius:radii.bottomRight - lineCenter startAngle:M_PI * 0.5 endAngle:0.0 clockwise:NO];
    
    [path addLineToPoint:point4];
    [path addArcWithCenter:CGPointMake(CGRectGetWidth(rect) - radii.topRight, radii.topRight) radius:radii.topRight - lineCenter startAngle:0.0 endAngle:M_PI * 1.5 clockwise:NO];
    
    [path closePath];
    return path;
}

@end
