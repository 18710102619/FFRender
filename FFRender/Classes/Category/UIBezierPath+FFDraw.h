//
//  UIBezierPath+FFDraw.h
//  FFKit_Example
//
//  Created by 张玲玉 on 2019/3/29.
//  Copyright © 2019 18710102619. All rights reserved.
//

#import <UIKit/UIKit.h>

//圆角值
typedef struct {
    CGFloat topLeft;
    CGFloat topRight;
    CGFloat bottomLeft;
    CGFloat bottomRight;
} FFCornerRadii;

@interface UIBezierPath (FFDraw)

+ (UIBezierPath *)ff_getBezierPathWithRect:(CGRect)rect cornerRadii:(FFCornerRadii)radii lineWidth:(CGFloat)lineWidth;

@end
