//
//  UIImage+FFDraw.m
//  FFKit_Example
//
//  Created by 张玲玉 on 2019/3/22.
//  Copyright © 2019 18710102619. All rights reserved.
//

#import "UIImage+FFDraw.h"
#import "FFVisualElement.h"
#import <malloc/malloc.h>

/*
 UIGraphicsBeginImageContextWithOptions(size, NO, 0)
 第一个参数 图片的尺寸
 第二个参数 图片的背景是否为不透明，YES 背景是黑色 NO 背景是黑色，一般设置为NO
 第三个参数 图片的缩放因子，一般设置为0
     这个缩放因子与UIImage的scale属性所指的含义是一致的
     传入0则表示让图片的缩放因子根据屏幕的分辨率而变化，所以我们得到的图片不管是在单分辨率还是视网膜屏上看起来都会很好
 */

@implementation UIImage (FFDraw)

+ (UIImage *)ff_getImage:(CGSize)size
                   color:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect rect=CGRectMake(0, 0, size.width, size.height);
    CGContextSetFillColorWithColor(ctx, color.CGColor);
    CGContextFillRect(ctx, rect);
    
    UIImage *icon = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return icon;
}

+ (UIImage *)ff_getImage:(CGSize)size
                 veArray:(NSArray *)veArray
{
    return [self ff_getImage:size veArray:veArray fillColor:[UIColor clearColor]];
}

+ (UIImage *)ff_getImage:(CGSize)size
                 veArray:(NSArray *)veArray
               fillColor:(UIColor *)fillColor
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect rect=CGRectMake(0, 0, size.width, size.height);
    CGContextSetFillColorWithColor(ctx, [fillColor CGColor]);
    CGContextFillRect(ctx, rect);
    
    @try {
        for (int i=0; i<veArray.count; i++) {
            FFVisualElement *ve = [veArray objectAtIndex:i];
            if ([ve.value isKindOfClass:[UIImage class]] || [ve.value isKindOfClass:[NSAttributedString class]]) {
                [ve.value drawInRect:ve.frame];
            }
        }
    }
    @catch (NSException *exception) {
        NSLog(@"ff_getImage ex: %@", [exception callStackSymbols]);
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)ff_getImage:(CGSize)size
         backgroundColor:(UIColor *)backgroundColor
             borderWidth:(CGFloat)borderWidth
             borderColor:(UIColor *)borderColor
            borderRadius:(CGFloat)cornerRadius
{
    FFCornerRadii cornerRadii=(FFCornerRadii){cornerRadius,cornerRadius,cornerRadius,cornerRadius};
    UIImage *image=[UIImage ff_getImage:size backgroundColor:backgroundColor borderWidth:borderWidth borderColor:borderColor cornerRadii:cornerRadii];
    return image;
}

+ (UIImage *)ff_getImage:(CGSize)size
         backgroundColor:(UIColor *)backgroundColor
             borderWidth:(CGFloat)borderWidth
             borderColor:(UIColor *)borderColor
             cornerRadii:(FFCornerRadii)cornerRadii
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect rect=CGRectMake(0, 0, size.width, size.height);
    CGContextSetFillColorWithColor(ctx, [[UIColor clearColor] CGColor]);
    CGContextFillRect(ctx, rect);
    
    UIBezierPath *path = [UIBezierPath ff_getBezierPathWithRect:rect cornerRadii:cornerRadii lineWidth:borderWidth];
    [path setUsesEvenOddFillRule:YES];
    [path addClip];
    
    CGContextAddPath(ctx, path.CGPath);
    CGContextSetFillColorWithColor(ctx, [backgroundColor CGColor]);
    CGContextFillRect(ctx, rect);
    
    CGContextAddPath(ctx, path.CGPath);
    CGContextSetStrokeColorWithColor(ctx, borderColor.CGColor);
    CGContextSetLineWidth(ctx, borderWidth);
    CGContextDrawPath(ctx, kCGPathFillStroke);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)ff_getImage:(CGSize)size
               lineColor:(UIColor *)lineColor
                 lengths:(CGFloat[])lengths
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, [[UIColor clearColor] CGColor]);
    CGContextFillRect(ctx, CGRectMake(0, 0, size.width, size.height));
    
    if (lengths) {
        CGContextSetLineDash(ctx, 0, lengths, 2);
    }
    CGContextSetLineWidth(ctx, 30);
    
    CGFloat y=size.height/2.0;
    CGContextMoveToPoint(ctx, 0, y);
    CGContextAddLineToPoint(ctx, size.width, y);
    
    CGContextSetStrokeColorWithColor(ctx, lineColor.CGColor);
    CGContextStrokePath(ctx);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)ff_clipCircle
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    
    UIBezierPath *path=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    [path addClip];
    [self drawAtPoint:CGPointZero];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)ff_setSize:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    CGRect rect=CGRectMake(0, 0, size.width, size.height);
    [self drawInRect:rect];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)ff_setText:(NSMutableAttributedString *)text
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    [text drawAtPoint:CGPointMake((self.size.width-text.size.width)/2, (self.size.height-text.size.height)/2)];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)ff_setVEArray:(NSArray *)veArray
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    
    @try {
        for (int i=0; i<veArray.count; i++) {
            FFVisualElement *ve = [veArray objectAtIndex:i];
            if ([ve.value isKindOfClass:[UIImage class]] || [ve.value isKindOfClass:[NSAttributedString class]]) {
                [ve.value drawInRect:ve.frame];
            }
        }
    }
    @catch (NSException *exception) {
        NSLog(@"ff_setVEArray ex: %@", [exception callStackSymbols]);
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)ff_setCornerRadius:(CGFloat)cornerRadius
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    
    CGRect rect=CGRectMake(0, 0, self.size.width, self.size.height);
    UIBezierPath *path=[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius];
    [path addClip];
    [self drawInRect:rect];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)ff_setCornerRadii:(FFCornerRadii)cr;
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    CGRect rect=CGRectMake(0, 0, self.size.width, self.size.height);
    
    UIBezierPath *path1 = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(cr.topLeft, cr.topLeft)];
    UIBezierPath *path2 = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerTopRight cornerRadii:CGSizeMake(cr.topRight, cr.topRight)];
    UIBezierPath *path3 = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerBottomLeft cornerRadii:CGSizeMake(cr.bottomLeft, cr.bottomLeft)];
    UIBezierPath *path4 = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerBottomRight cornerRadii:CGSizeMake(cr.bottomRight, cr.bottomRight)];
    
    [path1 addClip];
    [path2 addClip];
    [path3 addClip];
    [path4 addClip];
    
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)log_MemorySize
{
    CGFloat rowBytes = CGImageGetBytesPerRow(self.CGImage);
    CGFloat w = CGImageGetWidth(self.CGImage);
    CGFloat h = CGImageGetHeight(self.CGImage);
    CGFloat size = rowBytes * h;
    
    NSString *unit;
    if (size<1024) {
        unit=@"B";
    }
    else {
        size=size/1024.0;
        if (size<1024) {
             unit=@"KB";
        }
        else {
             size=size/1024.0;
             unit=@"MB";
        }
    }
    NSLog(@"w:%0.0f h:%0.0f rowBytes:%0.0f 占内存大小:%0.2f%@",w,h,rowBytes,size,unit);
    return;
}

@end
