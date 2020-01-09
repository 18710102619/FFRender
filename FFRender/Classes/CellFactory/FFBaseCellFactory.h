//
//  FFBaseCellFactory.h
//  FFKit
//
//  Created by 张玲玉 on 2018/9/7.
//

#import <Foundation/Foundation.h>
#import "FFBaseCell.h"

@interface FFBaseCellFactory : NSObject

/**
 移除非法cellModel
 */
+ (NSMutableArray *)removeErrorCellModel:(NSArray *)cellModelArray;

/**
 根据cellModel创建Cell
 */
+ (FFBaseCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath target:(id)target cellModel:(FFBaseCellModel *)cellModel;

/**
 获取分割线cellModel
 */
+ (FFBaseCellModel *)getLineModel:(double)cellHeight lineColor:(UIColor *)lineColor;

/**
 获取业务相关cellModel
 */
+ (FFBaseCellModel *)getCellModel:(id)cellData cellType:(NSInteger)cellType;

@end
