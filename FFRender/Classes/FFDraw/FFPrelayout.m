//
//  Prelayout.m
//  FFKit_Example
//
//  Created by 张玲玉 on 2019/4/18.
//  Copyright © 2019 18710102619. All rights reserved.
//

#import "FFPrelayout.h"

@implementation FFPrelayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        const char *queue_name = [[NSString stringWithFormat:@"%@_prelayout_queue", [self class]] cStringUsingEncoding:NSUTF8StringEncoding];
        _prelayout_queue = dispatch_queue_create(queue_name, DISPATCH_QUEUE_SERIAL);//串行队列
    }
    return self;
}

+ (instancetype)sharedPrelayout
{
    static FFPrelayout *_shared = nil;
    static dispatch_once_t _once;
    dispatch_once(&_once, ^{
        _shared = [[self alloc] init];
    });
    return _shared;
}

+ (void)asyncPrelayout:(FFBaseCellModel *)cellModel block:(void(^)(FFBaseCellModel *cellModel)) block;
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self prelayout:cellModel block:^(FFBaseCellModel * _Nonnull cellModel) {
            dispatch_async(dispatch_get_main_queue(), ^{
                block(cellModel);
            });
        }];
        NSLog(@"%@预排版[异步并发]：%@",cellModel.cellName,[NSThread currentThread]);
    });
}

- (void)asyncPrelayout:(FFBaseCellModel *)cellModel block:(void(^)(FFBaseCellModel *cellModel)) block;
{
    dispatch_async(_prelayout_queue, ^{
        [FFPrelayout prelayout:cellModel block:^(FFBaseCellModel * _Nonnull cellModel) {
            dispatch_async(dispatch_get_main_queue(), ^{
                block(cellModel);
            });
        }];
        NSLog(@"%@预排版[异步串行]：%@",cellModel.cellName,[NSThread currentThread]);
    });
}

+ (void)prelayout:(FFBaseCellModel *)cellModel block:(void(^)(FFBaseCellModel *cellModel)) block
{
    //override
}

@end
