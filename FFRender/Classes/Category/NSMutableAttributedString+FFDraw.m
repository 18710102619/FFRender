//
//  NSMutableAttributedString+FFDraw.m
//  FFKit_Example
//
//  Created by 张玲玉 on 2019/2/15.
//  Copyright © 2019年 18710102619. All rights reserved.
//

#import "NSMutableAttributedString+FFDraw.h"

@implementation NSMutableAttributedString (FFDraw)

#pragma mark - 类方法

+ (instancetype)ff_stringWithString:(NSString *)string
{
    if ([string isKindOfClass:[NSString class]]) {
        return [[NSMutableAttributedString alloc] initWithString:string];
    }
    else {
        return [[NSMutableAttributedString alloc] init];
    }
}

+ (instancetype)ff_stringWithHTMLString:(NSString *)string
{
    if ([string isKindOfClass:[NSString class]]) {
        return [[NSMutableAttributedString alloc] initWithData:[string dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute : @(NSUTF8StringEncoding) } documentAttributes:nil error:nil];
    }
    else {
        return [self ff_stringWithString:string];
    }
}

+ (instancetype)ff_stringWithString:(NSString *)string font:(UIFont *)font color:(UIColor *)color
{
    NSMutableAttributedString *str = [self ff_stringWithString:string];
    [str ff_setFont:font];
    [str ff_setColor:color];
    return str;
}

+ (instancetype)ff_stringWithString:(NSString *)string font:(UIFont *)font
{
    NSMutableAttributedString *str = [self ff_stringWithString:string];
    [str ff_setFont:font];
    return str;
}

+ (instancetype)ff_stringWithString:(NSString *)string color:(UIColor *)color
{
    NSMutableAttributedString *str = [self ff_stringWithString:string];
    [str ff_setColor:color];
    return str;
}

#pragma mark - 实例方法

- (void)ff_setFont:(UIFont *)font
{
    [self addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, self.length)];
}

- (void)ff_setColor:(UIColor *)color
{
    [self addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, self.length)];
}

- (void)ff_setBackgroundColor:(UIColor *)color
{
    [self addAttribute:NSBackgroundColorAttributeName value:color range:NSMakeRange(0, self.length)];
}

- (void)ff_setOffset:(int)offset
{
    [self addAttribute:NSBaselineOffsetAttributeName value:@(offset) range:NSMakeRange(0, self.length)];
}

- (void)ff_appendString:(NSString *)string
{
    [self ff_appendString:string offset:0];
}

- (void)ff_appendString:(NSString *)string offset:(int)offset
{
    NSMutableAttributedString *str=[[NSMutableAttributedString alloc] initWithString:string];
    [str ff_setOffset:offset];
    [self appendAttributedString:str];
}

- (void)ff_appendImage:(UIImage *)image size:(CGSize)size
{
    [self ff_appendImage:image size:size offset:0];
}

- (void)ff_appendImage:(UIImage *)image size:(CGSize)size offset:(int)offset
{
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc]init];
    textAttachment.image = image;
    textAttachment.bounds = CGRectMake(0, 0, size.width, size.height);
    NSMutableAttributedString *str = [NSMutableAttributedString attributedStringWithAttachment:textAttachment];
    [str ff_setOffset:offset];
    [self appendAttributedString:str];
}

- (void)ff_setLineBreakMode:(NSLineBreakMode)lineBreakMode
{
    NSMutableParagraphStyle *style=[[NSMutableParagraphStyle alloc] init];
    style.lineBreakMode = lineBreakMode;
    [self addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, self.length)];
}

- (void)ff_setAlignment:(NSTextAlignment)alignment
{
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = alignment;
    [self addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, self.length)];
}

- (void)ff_setLineSpacing:(CGFloat)lineSpacing
{
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = lineSpacing;
    [self addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, self.length)];
}

- (void)ff_setNumberColor:(UIColor *)color
{
    NSArray *number = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"+"];
    for (int i = 0; i < self.length; i ++) {
        NSAttributedString *num=[self attributedSubstringFromRange:NSMakeRange(i, 1)];
        if ([number containsObject:num.string]) {
            [self setAttributes:@{NSForegroundColorAttributeName:color}range:NSMakeRange(i, 1)];
        }
    }
}

- (CGSize)ff_getSizeWithWidth:(CGFloat)width;
{
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGRect rect = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:options context:nil];
    return rect.size;
}

@end
