//
//  YTBaseTableViewSectionModel.h
//  TableViewDemo
//
//  Created by 张欢 on 2017/6/6.
//  Copyright © 2017年 张欢. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YTBaseTableViewSectionModel : NSObject

@property(nonatomic,strong)id headerModel;

@property(nonatomic,strong)id footerModel;

@property(nonatomic,strong)NSArray *cellModel;

- (instancetype)initSectionModelConfigWithHeaderModel:(id)headerModel footerModel:(id)footerModel cellModel:(__kindof NSArray *)cellModel;

@end
