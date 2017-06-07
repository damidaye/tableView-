//
//  YTBaseTableview.h
//  TableViewDemo
//
//  Created by 张欢 on 2017/6/5.
//  Copyright © 2017年 张欢. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "YTTableViewHeaderFooterView.h"
#import "YTBaseTableViewSectionModel.h"
#import "YTBaseTableViewCell.h"
typedef UIView *(^viewClosure)();
typedef void(^refreshClosure)(NSString *currPage);
typedef void(^callBack)();

@interface YTBaseTableview : NSObject

- (UITableView *)createTableViewByClass:(CGRect)frame cellClass:(Class )cellClass cellIdentifier:(NSString *)cellIdentifier style:(UITableViewStyle)style;

- (UITableView *)createTableViewByNibClass:(CGRect)frame cellIdentifier:(NSString *)cellIdentifier style:(UITableViewStyle)style;

- (void)registerHeaderFooterClass:(Class)headerFooterView;

- (void)registerHeaderFooterNibClassIdentifier:(NSString *)identifier;

- (void)loadData:(__kindof NSArray *)list next:(BOOL)hasNext;

- (void)loadSectionData:(__kindof NSArray<YTBaseTableViewSectionModel *> *)list next:(BOOL)hasNext;

@property(nonatomic,copy)viewClosure headerView;

@property(nonatomic,copy)viewClosure footerView;

@property(nonatomic,copy)refreshClosure refreshHeader;

@property(nonatomic,copy)refreshClosure refreshFooter;

@end
