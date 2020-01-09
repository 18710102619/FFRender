//
//  FFBaseCellModel.m
//  FFKit
//
//  Created by 张玲玉 on 2018/9/7.
//

#import "FFBaseCellModel.h"

@implementation FFBaseCellModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cellImageWidth=[UIScreen mainScreen].bounds.size.width;
        _veArray=[NSMutableArray array];
        _veDictionary=[NSMutableDictionary dictionary];
    }
    return self;
}

@end
