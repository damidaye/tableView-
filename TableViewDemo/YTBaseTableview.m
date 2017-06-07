//
//  YTBaseTableview.m
//  TableViewDemo
//
//  Created by 张欢 on 2017/6/5.
//  Copyright © 2017年 张欢. All rights reserved.
//


#import "YTBaseTableview.h"
#import "MJRefresh.h"

typedef NS_ENUM(NSInteger, TableRefresh) {
    
    TableRefreshNormal = 0,
    TableRefreshUp = 1,
    TableRefreshDown = 2
};

@interface YTBaseTableview ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray<YTBaseTableViewSectionModel *> *sections;
@property(nonatomic,strong)NSMutableArray *cellData;
@property(nonatomic,copy)NSString *cellIdentifier;
@property(nonatomic,copy)NSString *sectionIdentifier;
@property(nonatomic,assign)TableRefresh state;
@property(nonatomic,assign)NSUInteger currCount;

@end

@implementation YTBaseTableview


- (UITableView *)createTableViewByNibClass:(CGRect)frame cellIdentifier:(NSString *)cellIdentifier style:(UITableViewStyle)style{
    
    return [self createTableView:frame cellIdentifier:cellIdentifier cellClass:nil style:style];
}

- (UITableView *)createTableViewByClass:(CGRect)frame cellClass:(Class)cellClass cellIdentifier:(NSString *)cellIdentifier style:(UITableViewStyle)style{
    
    return [self createTableView:frame cellIdentifier:cellIdentifier cellClass:cellClass style:style];
}

- (UITableView *)createTableView:(CGRect)frame cellIdentifier:(NSString *)cellIdentifier cellClass:(Class)cellClass style:(UITableViewStyle)style{
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:frame style:style];
    self.cellIdentifier = cellIdentifier;
    if (cellClass) {
        
        [tableView registerClass:cellClass forCellReuseIdentifier:cellIdentifier];
        
    }else{
        
        [tableView registerNib:[UINib nibWithNibName:cellIdentifier bundle:nil] forCellReuseIdentifier:cellIdentifier];
    }
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    self.currCount = 1;
    self.tableView = tableView;
    if (_headerView != nil) {
        
        tableView.tableHeaderView = _headerView();
    }
    if (_footerView != nil) {
        
        tableView.tableFooterView = _footerView();
    }
    self.cellData = [NSMutableArray array];
    self.sections = [NSMutableArray array];
    return tableView;

}

- (void)registerHeaderFooterClass:(Class)headerFooterView{
    
    self.sectionIdentifier = NSStringFromClass(headerFooterView);
    [self.tableView registerClass:headerFooterView forHeaderFooterViewReuseIdentifier:NSStringFromClass(headerFooterView)];
}

- (void)registerHeaderFooterNibClassIdentifier:(NSString *)identifier{
    
    self.sectionIdentifier = identifier;
    [self.tableView registerNib:[UINib nibWithNibName:identifier bundle:nil] forHeaderFooterViewReuseIdentifier:identifier];
}


- (void)loadData:(__kindof NSArray *)list next:(BOOL)hasNext{
    
    [self updateFromData:self.cellData addData:list hasNext:hasNext];
}

- (void)loadSectionData:(__kindof NSArray<YTBaseTableViewSectionModel *> *)list next:(BOOL)hasNext{
    
    [self updateFromData:self.sections addData:list hasNext:hasNext];
}

- (void)configTable{
    
    if (self.refreshHeader != nil) {
        
        self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            
            self.state = TableRefreshDown;
            self.currCount = 1;
            self.refreshFooter([NSString stringWithFormat:@"%lu",self.currCount]);
        }];
        
    }
    if (self.refreshFooter != nil) {
        
        self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            
            self.state = TableRefreshUp;
            self.currCount++;
            self.refreshFooter([NSString stringWithFormat:@"%lu",self.currCount]);
        }];
    }
}

- (void)updateFromData:(NSMutableArray *)fromDate addData:(__kindof NSArray*)list hasNext:(BOOL)hasNext{
    
    if (self.state == TableRefreshNormal) {
        
        [self configTable];
        [fromDate removeAllObjects];
        [fromDate addObjectsFromArray:list];
        [self.tableView reloadData];
        
    }else if (self.state == TableRefreshUp){
        
        [fromDate addObjectsFromArray:list];
        hasNext ? [self.tableView.mj_footer endRefreshing] : [self.tableView.mj_footer endRefreshingWithNoMoreData];
        [self.tableView reloadData];
        
    }else if (self.state == TableRefreshDown){
        
        [fromDate removeAllObjects];
        [fromDate addObjectsFromArray:list];
        if (hasNext) {
            
            [self.tableView.mj_footer resetNoMoreData];
        }
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.sections.count == 0 ? 1 : self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.sections.count == 0 ? self.cellData.count : self.sections[section].cellModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    id model;
    if (self.sections.count != 0) {
        
        model = self.sections[indexPath.section].cellModel[indexPath.row];
        
    }else{
        
        model = self.cellData[indexPath.row];
    }
    
    YTBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    [cell setCellModel:model];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (self.sections.count != 0) {
        
        YTTableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:self.sectionIdentifier];
        YTBaseTableViewSectionModel *model = self.sections[section];
        if (model.headerModel) {
            if (!view) {
                view = [NSClassFromString(self.sectionIdentifier) new];
            }
            [view setHeadFooterModel:model.headerModel];
            return view;
            
        }else{
            
            return nil;
        }
        
    }else{
        
        return nil;
    }
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    if (self.sections.count != 0) {
        
        YTTableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:self.sectionIdentifier];
        YTBaseTableViewSectionModel *model = self.sections[section];
        if (model.footerModel) {
            if (!view) {
                
                view = [NSClassFromString(self.sectionIdentifier) new];
            }
            [view setHeadFooterModel:model.footerModel];
            return view;
            
        }else{
            
            return nil;
        }

    }else{
        
        return nil;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    YTBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    return cell.getHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    if (self.sections.count != 0) {
        
        YTBaseTableViewSectionModel *model = self.sections[section];
        YTTableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:self.sectionIdentifier];
        if (!view) {
            view = [NSClassFromString(self.sectionIdentifier) new];
        }
        return model.footerModel == nil ? 0.001 : [view getHeight];
        
    }else{
        
        return 0.001;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (self.sections.count != 0) {
        
        YTBaseTableViewSectionModel *model = self.sections[section];
        YTTableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:self.sectionIdentifier];
        if (!view) {
            view = [NSClassFromString(self.sectionIdentifier) new];
        }
        return model.headerModel == nil ? 0.001 : [view getHeight];
        
    }else{
        
        return 0.001;
    }
}

@end
