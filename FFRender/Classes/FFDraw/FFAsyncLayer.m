//
//  FFBaseAsyncLayer.m
//  AFNetworking
//
//  Created by 张玲玉 on 2019/4/23.
//

#import "FFAsyncLayer.h"
#import "UIImage+FFDraw.h"

@implementation FFAsyncLayer

- (instancetype)init
{
    self = [super init];
    if (self) {
        const char *queue_name = [[NSString stringWithFormat:@"%@_asyn_layer_queue", [self class]] cStringUsingEncoding:NSUTF8StringEncoding];
        async_layer_queue = dispatch_queue_create(queue_name, DISPATCH_QUEUE_SERIAL);//串行队列
    }
    return self;
}

+ (instancetype)sharedAsyncLayer
{
    static FFAsyncLayer *_shared = nil;
    static dispatch_once_t _once;
    dispatch_once(&_once, ^{
        _shared = [[self alloc] init];
    });
    return _shared;
}

+ (void)startAsyncLayer:(FFBaseCellModel *)cellModel block:(void(^)(FFBaseCellModel *cellModel,UIImage *image)) block
{
    if (cellModel.cellImage) {
        block(cellModel,cellModel.cellImage);
    }
    else {
        //全局队列和并发对列的工作特性一致，
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            UIImage *image=[UIImage ff_getImage:CGSizeMake(cellModel.cellImageWidth, cellModel.cellImageHeight) veArray:cellModel.veArray];
            dispatch_async(dispatch_get_main_queue(), ^{
                block(cellModel,image);
            });
        });
    }
}

- (void)startAsyncSerialLayer:(FFBaseCellModel *)cellModel block:(void(^)(FFBaseCellModel *cellModel,UIImage *image)) block
{
    if (cellModel.cellImage) {
        block(cellModel,cellModel.cellImage);
    }
    else {
        dispatch_async(async_layer_queue, ^{
            UIImage *image=[UIImage ff_getImage:CGSizeMake(cellModel.cellImageWidth, cellModel.cellHeight) veArray:cellModel.veArray];
            dispatch_async(dispatch_get_main_queue(), ^{
                block(cellModel,image);
            });
        });
    }
}

@end
