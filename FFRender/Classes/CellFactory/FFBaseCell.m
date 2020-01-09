//
//  FFBaseCell.m
//  FFKit
//
//  Created by 张玲玉 on 2018/9/7.
//

#import "FFBaseCell.h"
#import "FFVisualElement.h"
#import "FFAsyncLayer.h"

@implementation FFBaseCell

- (UILabel *)cellLabel
{
    if (_cellLabel==nil) {
        _cellLabel=[[UILabel alloc]init];
        [self addSubview:_cellLabel];
    }
    return _cellLabel;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        self.backgroundColor=[UIColor whiteColor];
        self.layer.masksToBounds=YES;
        self.contentView.layer.masksToBounds=YES;
        
        UIView *selectedView = [[UIView alloc] init];
        selectedView.backgroundColor = [UIColor lightGrayColor];
        self.selectedBackgroundView = selectedView;
    }
    return self;
}

- (void)setCellModel:(FFBaseCellModel *)cellModel
{
    _cellModel=cellModel;

    if (_cellModel.isStartAsyncLayer) {
        [self startAsyncLayer:self.contentView];
    } else {
        self.contentView.layer.contents=nil;
    }
    self.backgroundColor=cellModel.backgroundColor;
    
}

- (void)startAsyncLayer:(UIView *)view
{
    [FFAsyncLayer startAsyncLayer:self.cellModel block:^(FFBaseCellModel *cellModel, UIImage *image) {
        view.layer.contents=(__bridge id)(image.CGImage);
        view.frame=CGRectMake(view.frame.origin.x, view.frame.origin.y, image.size.width, image.size.height);
        if (cellModel.isCacheCellImage) {
            cellModel.cellImage=image;
        }
    }];
}

- (void)containsPoint:(CGPoint)point block:(void(^)(FFVisualElement *ve))block
{
    for (FFVisualElement *ve in self.cellModel.veArray) {
        if (CGRectContainsPoint(ve.frame, point)) {
            block(ve);
            return;
        }
    }
    for (id key in self.cellModel.veDictionary.allKeys) {
        FFVisualElement *ve = [self.cellModel.veDictionary objectForKey:key];
        if (CGRectContainsPoint(ve.frame, point)) {
            block(ve);
            return;
        }
    }
}

@end
