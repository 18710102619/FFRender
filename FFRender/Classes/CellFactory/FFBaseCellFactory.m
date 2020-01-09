//
//  FFBaseCellFactory.m
//  FFKit
//
//  Created by 张玲玉 on 2018/9/7.
//

#import "FFBaseCellFactory.h"

@implementation FFBaseCellFactory

/**
 移除非法cellModel
 */
+ (NSMutableArray *)removeErrorCellModel:(NSArray *)cellModelArray
{
    NSMutableArray *tempArray=[NSMutableArray array];
    for (FFBaseCellModel *cellModel in cellModelArray) {
        if (NSClassFromString(cellModel.cellName)) {
            [tempArray addObject:cellModel];
        }
    }
    return tempArray;
}

/**
 根据cellModel创建Cell
 */
+ (FFBaseCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath target:(id)target cellModel:(FFBaseCellModel *)cellModel
{
    FFBaseCell *cell=[tableView dequeueReusableCellWithIdentifier:cellModel.cellName];
    if (cell==nil) {
        cell=[[NSClassFromString(cellModel.cellName) alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellModel.cellName];
    }
    if (cell==nil) {
        cell=[[FFBaseCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FFBaseCell"];
    }
    cell.cellModel=cellModel;
    cell.delegate=target;
    return cell;
}

/**
 获取分割线cellModel
 */
+ (FFBaseCellModel *)getLineModel:(double)cellHeight lineColor:(UIColor *)lineColor
{
    FFBaseCellModel *line=[[FFBaseCellModel alloc]init];
    line.cellName=@"FFBaseCell";
    line.cellHeight=cellHeight;
    line.backgroundColor=lineColor;
    return line;
}

/**
 获取业务相关cellModel
 */
+ (FFBaseCellModel *)getCellModel:(id)cellData cellType:(NSInteger)cellType
{
    //override to subclass
    FFBaseCellModel *cellModel=[[FFBaseCellModel alloc]init];
    return cellModel;
}

@end
