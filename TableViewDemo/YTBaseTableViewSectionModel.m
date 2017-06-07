//
//  YTBaseTableViewSectionModel.m
//  TableViewDemo
//
//  Created by 张欢 on 2017/6/6.
//  Copyright © 2017年 张欢. All rights reserved.
//

#import "YTBaseTableViewSectionModel.h"

@interface YTBaseTableViewSectionModel ()


@end

@implementation YTBaseTableViewSectionModel


- (instancetype)initSectionModelConfigWithHeaderModel:(id)headerModel footerModel:(id)footerModel cellModel:(__kindof NSArray *)cellModel{
    
    if (self = [super init]) {
        
        self.headerModel = headerModel;
        self.footerModel = footerModel;
        self.cellModel = cellModel;
    }
    
    return self;
}

@end
