//
//  FFPrelayout.h
//  FFKit_Example
//
//  Created by 张玲玉 on 2019/4/18.
//  Copyright © 2019 18710102619. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FFBaseCellModel.h"

@interface FFPrelayout : NSObject
{
    dispatch_queue_t _prelayout_queue;
}

/**
 单例
 */
+ (instancetype)sharedPrelayout;

/**
 子线程异步预排版
 */
+ (void)asyncPrelayout:(FFBaseCellModel *)cellModel block:(void(^)(FFBaseCellModel *cellModel)) block;
- (void)asyncPrelayout:(FFBaseCellModel *)cellModel block:(void(^)(FFBaseCellModel *cellModel)) block;

/**
 主线程同步预排版
 */
+ (void)prelayout:(FFBaseCellModel *)cellModel block:(void(^)(FFBaseCellModel *cellModel)) block;

@end
