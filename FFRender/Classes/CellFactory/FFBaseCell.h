//
//  FFBaseCell.h
//  FFKit
//
//  Created by 张玲玉 on 2018/9/7.
//

#import <UIKit/UIKit.h>
#import "FFBaseCellModel.h"
#import "FFVisualElement.h"

@interface FFBaseCell : UITableViewCell

@property(nonatomic,weak)id delegate;
@property(nonatomic,strong)FFBaseCellModel *cellModel;
@property(nonatomic,strong)UILabel *cellLabel;

- (void)startAsyncLayer:(UIView *)view;

- (void)containsPoint:(CGPoint)point block:(void(^)(FFVisualElement *ve))block;

@end
