//
//  FFBaseCellModel.h
//  FFKit
//
//  Created by 张玲玉 on 2018/9/7.
//

#import <Foundation/Foundation.h>

typedef void (^FFRefreshBlock)(void);

@interface FFBaseCellModel : NSObject

#pragma mark - 基础

/**
 cell的行号
 */
@property(nonatomic,assign)NSInteger row;
/**
 cell的类名
 */
@property(nonatomic,copy)NSString *cellName;
/**
 cell的数据
 */
@property(nonatomic,strong)id cellData;
/**
 cell的高
 */
@property(nonatomic,assign)int cellHeight;
/**
 cell的背景颜色
 */
@property(nonatomic,strong)UIColor *backgroundColor;

#pragma mark - 位图

/**
 cell的位图
 */
@property(nonatomic,strong)UIImage *cellImage;
/**
 cell的位图宽
 */
@property(nonatomic,assign)int cellImageWidth;
/**
 cell的位图高
 */
@property(nonatomic,assign)int cellImageHeight;
/**
 是否缓存cellImage
 */
@property(nonatomic,assign)BOOL isCacheCellImage;

#pragma mark - 视觉元素

/**
 视觉元素数组
 */
@property(nonatomic,strong)NSMutableArray *veArray;
/**
 视觉元素字典
 */
@property(nonatomic,strong)NSMutableDictionary *veDictionary;
/**
 是否默认异步绘制
 */
@property(nonatomic,assign)BOOL isStartAsyncLayer;

#pragma mark - 业务

/**
 以展示过
 */
@property(nonatomic,assign)BOOL isShowed;
/**
 刷新Block
 */
@property(nonatomic,copy)FFRefreshBlock refreshBlock;

@end

