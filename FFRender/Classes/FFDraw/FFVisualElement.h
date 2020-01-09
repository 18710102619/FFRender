//
//  FFVisualElement.h
//  FFKit_Example
//
//  Created by 张玲玉 on 2019/2/13.
//  Copyright © 2019年 18710102619. All rights reserved.
//  视觉元素

#import <Foundation/Foundation.h>
#import "FFTouch.h"

@interface FFVisualElement : NSObject<NSCopying>

@property(nonatomic,copy)NSString *name;
@property(nonatomic,strong)id value;
@property(nonatomic,assign)CGRect frame;
@property(nonatomic,strong)FFTouch *touch;

@property(nonatomic,assign)CGFloat x;
@property(nonatomic,assign)CGFloat y;
@property(nonatomic,assign)CGFloat maxX;
@property(nonatomic,assign)CGFloat maxY;
@property(nonatomic,assign)CGFloat width;
@property(nonatomic,assign)CGFloat height;
@property(nonatomic,assign)CGFloat centerX;
@property(nonatomic,assign)CGFloat centerY;

@property(nonatomic,assign)BOOL unfoldEnabled;   //可展开
@property(nonatomic,assign)BOOL isUnfold;        //展开的
@property(nonatomic,assign)double foldHeight;    //折叠高度
@property(nonatomic,assign)double unfoldHeight;  //展开高度

@end
