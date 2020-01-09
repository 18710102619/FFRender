//
//  FFVisualElement.m
//  FFKit_Example
//
//  Created by 张玲玉 on 2019/2/13.
//  Copyright © 2019年 18710102619. All rights reserved.
//

#import "FFVisualElement.h"

@implementation FFVisualElement

- (id)copyWithZone:(NSZone *)zone
{
    FFVisualElement *model = [[[self class] allocWithZone:zone] init];
    model.value = self.value;
    model.frame = self.frame;
    return model;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.touch=[[FFTouch alloc]init];
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    _frame=CGRectMake(ceil(frame.origin.x), ceil(frame.origin.y), ceil(frame.size.width), ceil(frame.size.height));//向上取整
}

#pragma mark - X

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

#pragma mark - Y

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

#pragma mark - Max

- (CGFloat)maxX
{
     return self.frame.origin.x+self.frame.size.width;
}

- (CGFloat)maxY
{
    return self.frame.origin.y+self.frame.size.height;
}

#pragma mark - Width

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

#pragma mark - Height

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

#pragma mark - CenterX

- (CGFloat)centerX
{
    return self.frame.origin.x+self.frame.size.width/2.0;
}

- (CGFloat)centerY
{
    return self.frame.origin.y+self.frame.size.height/2.0;
}

#pragma mark - 折叠

- (void)setIsUnfold:(BOOL)isUnfold
{
    _isUnfold=isUnfold;
    if (_isUnfold) {
        self.height=self.unfoldHeight;
    }
    else {
        self.height=self.foldHeight;
    }
}

@end
