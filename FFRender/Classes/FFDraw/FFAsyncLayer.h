//
//  FFBaseAsyncLayer.h
//  AFNetworking
//
//  Created by 张玲玉 on 2019/4/23.
//

#import <Foundation/Foundation.h>
#import "FFBaseCellModel.h"
@interface FFAsyncLayer : NSObject
{
    dispatch_queue_t async_layer_queue;
}

/**
 单例
 */
+ (instancetype)sharedAsyncLayer;

/**
 异步并发绘制
 */
+ (void)startAsyncLayer:(FFBaseCellModel *)cellModel block:(void(^)(FFBaseCellModel *cellModel,UIImage *image)) block;

/**
 异步串行绘制
 */
- (void)startAsyncSerialLayer:(FFBaseCellModel *)cellModel block:(void(^)(FFBaseCellModel *cellModel,UIImage *image)) block;

@end
