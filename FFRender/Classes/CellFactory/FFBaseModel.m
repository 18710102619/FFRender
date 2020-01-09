//
//  FFBaseModel.m
//  FFKit_Example
//
//  Created by 张玲玉 on 2019/1/25.
//  Copyright © 2019年 18710102619. All rights reserved.
//

#import "FFBaseModel.h"

@implementation FFBaseModel

+ (instancetype)modelWithDict:(NSDictionary *)dict
{
    FFBaseModel *model = [[self alloc] init];
    if (dict && [dict isKindOfClass:[NSDictionary class]]) {
        [model setValuesForKeysWithDictionary:dict];
    }
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
