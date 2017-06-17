//
//  TestVCViewController.m
//  TableViewDemo
//
//  Created by 张欢 on 2017/6/17.
//  Copyright © 2017年 张欢. All rights reserved.
//

#import "TestVCViewController.h"
#import "YTBaseTableview.h"
#import "TestCell.h"
#import "TestCellModel.h"
#import "TestNibCell.h"
#import "TestHeaderFooterView.h"
@interface TestVCViewController ()
@property(nonatomic,strong)YTBaseTableview *table;
@property(nonatomic,assign)NSInteger count;
@property(nonatomic,strong)NSMutableArray *arrM;
@end

@implementation TestVCViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    BTWeakSelf;

    self.table = [YTBaseTableview new];
    
    self.table.refreshFooter = ^(NSString *currPage){
        
        [weakSelf fetchData:currPage];
        //[self fetchSectionData:currPage];
    };
    
    self.table.refreshHeader = ^(NSString *currPage){
        
        [weakSelf fetchData:currPage];
        //[self fetchSectionData:currPage];
        
    };
    self.table.didSelect = ^(UITableView *tableView, NSIndexPath *indexPath, id model) {
        TestCellModel *m = model;
        NSLog(@"%@",m.text);
        [weakSelf dismissViewControllerAnimated:true completion:nil];
    };
    //    self.table.headerView = ^UIView *{
    //
    //        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40)];
    //        view.backgroundColor = [UIColor blueColor];
    //        return view;
    //    };
    //
    //    self.table.footerView = ^UIView *{
    //
    //        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
    //        view.backgroundColor = [UIColor orangeColor];
    //        return view;
    //    };
    self.count = 1;
    self.arrM = [NSMutableArray array];
    
    if (self.count == 1) {
        
        UITableView *tableView = [self.table createTableViewByClass:self.view.bounds cellClass:[TestCell class]  cellIdentifier:@"434" style:UITableViewStylePlain];
        [self.view addSubview:tableView];
        TestCellModel *model1 = [[TestCellModel alloc]initWithText:@"第1个" color:[UIColor redColor]];
        TestCellModel *model2 = [[TestCellModel alloc]initWithText:@"第2个" color:[UIColor orangeColor]];
        TestCellModel *model3 = [[TestCellModel alloc]initWithText:@"第3个" color:[UIColor blueColor]];
        [self.arrM addObjectsFromArray:@[model1,model2,model3]];
        [self.table loadData:self.arrM next:true];
    }
    
    if (self.count == 2) {
        UITableView *tableView = [self.table createTableViewByNibClass:self.view.bounds cellIdentifier:@"TestNibCell" style:UITableViewStylePlain];
        [self.view addSubview:tableView];
        TestCellModel *model1 = [[TestCellModel alloc]initWithText:@"第1个" color:[UIColor redColor]];
        TestCellModel *model2 = [[TestCellModel alloc]initWithText:@"第2个" color:[UIColor orangeColor]];
        TestCellModel *model3 = [[TestCellModel alloc]initWithText:@"第3个" color:[UIColor blueColor]];
        [self.table loadData:@[model1,model2,model3] next:false];
    }
    
    if (self.count == 3) {
        
        UITableView *tableView = [self.table createTableViewByClass:self.view.bounds cellClass:[TestCell class]  cellIdentifier:@"434" style:UITableViewStyleGrouped];
        [self.view addSubview:tableView];
        TestCellModel *model1 = [[TestCellModel alloc]initWithText:@"第1个" color:[UIColor redColor]];
        TestCellModel *model2 = [[TestCellModel alloc]initWithText:@"第2个" color:[UIColor orangeColor]];
        TestCellModel *model3 = [[TestCellModel alloc]initWithText:@"第3个" color:[UIColor blueColor]];
        YTBaseTableViewSectionModel *m1 = [[YTBaseTableViewSectionModel alloc]initSectionModelConfigWithHeaderModel:nil footerModel:[[TestCellModel alloc] initWithText:@"第一组组尾" color:[UIColor grayColor]] cellModel:@[model1,model2,model3]];
        YTBaseTableViewSectionModel *m2 = [[YTBaseTableViewSectionModel alloc]initSectionModelConfigWithHeaderModel:[[TestCellModel alloc] initWithText:@"第2组组头" color:[UIColor purpleColor]] footerModel:[[TestCellModel alloc] initWithText:@"第2组组尾" color:[UIColor orangeColor]] cellModel:@[model1,model2,model3]];
        [self.table registerHeaderFooterClass:[TestHeaderFooterView class]];
        [self.table loadSectionData:@[m1,m2] next:false];
    }
    
    if (self.count == 4) {
        
        UITableView *tableView = [self.table createTableViewByClass:self.view.bounds cellClass:[TestCell class]  cellIdentifier:@"434" style:UITableViewStyleGrouped];
        [self.view addSubview:tableView];
        TestCellModel *model1 = [[TestCellModel alloc]initWithText:@"第1个" color:[UIColor redColor]];
        TestCellModel *model2 = [[TestCellModel alloc]initWithText:@"第2个" color:[UIColor orangeColor]];
        TestCellModel *model3 = [[TestCellModel alloc]initWithText:@"第3个" color:[UIColor blueColor]];
        YTBaseTableViewSectionModel *m1 = [[YTBaseTableViewSectionModel alloc]initSectionModelConfigWithHeaderModel:[[TestCellModel alloc] initWithText:@"第一组组头" color:[UIColor grayColor]] footerModel:[[TestCellModel alloc] initWithText:@"第一组组尾" color:[UIColor grayColor]] cellModel:@[model1,model2,model3]];
        YTBaseTableViewSectionModel *m2 = [[YTBaseTableViewSectionModel alloc]initSectionModelConfigWithHeaderModel:[[TestCellModel alloc] initWithText:@"第2组组头" color:[UIColor purpleColor]] footerModel:[[TestCellModel alloc] initWithText:@"第2组组尾" color:[UIColor orangeColor]] cellModel:@[model1,model2,model3]];
        [self.table registerHeaderFooterNibClassIdentifier:@"TestHeaderFooterNib"];
        [self.table loadSectionData:@[m1,m2] next:false];
        
    }
    
}

- (void)fetchData:(NSString *)page{
    
    NSLog(@"%@",page);
    
    if (page.integerValue == 1) {
        
        TestCellModel *model1 = [[TestCellModel alloc]initWithText:@"第1个" color:[UIColor redColor]];
        TestCellModel *model2 = [[TestCellModel alloc]initWithText:@"第2个" color:[UIColor orangeColor]];
        TestCellModel *model3 = [[TestCellModel alloc]initWithText:@"第3个" color:[UIColor blueColor]];
        [self.table loadData:@[model1,model2,model3] next:true];
        
    }
    
    if (page.integerValue == 2) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            TestCellModel *model1 = [[TestCellModel alloc]initWithText:@"第4个" color:[UIColor orangeColor]];
            [self.table loadData:@[model1] next:true];
        });
    }
    
    if (page.integerValue == 3) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            TestCellModel *model1 = [[TestCellModel alloc]initWithText:@"第5个" color:[UIColor orangeColor]];
            [self.table loadData:@[model1] next:false];
        });
    }
}

- (void)fetchSectionData:(NSString *)page{
    
    NSLog(@"%@",page);
    
    if (page.integerValue == 1) {
        
        UITableView *tableView = [self.table createTableViewByClass:self.view.bounds cellClass:[TestCell class]  cellIdentifier:@"434" style:UITableViewStyleGrouped];
        [self.view addSubview:tableView];
        TestCellModel *model1 = [[TestCellModel alloc]initWithText:@"第1个" color:[UIColor redColor]];
        TestCellModel *model2 = [[TestCellModel alloc]initWithText:@"第2个" color:[UIColor orangeColor]];
        YTBaseTableViewSectionModel *m1 = [[YTBaseTableViewSectionModel alloc]initSectionModelConfigWithHeaderModel:[[TestCellModel alloc] initWithText:@"第一组组头" color:[UIColor grayColor]] footerModel:[[TestCellModel alloc] initWithText:@"第一组组尾" color:[UIColor grayColor]] cellModel:@[model1,model2]];
        [self.table registerHeaderFooterClass:[TestHeaderFooterView class]];
        [self.table loadSectionData:@[m1] next:false];
        
    }
    
    if (page.integerValue == 2) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            TestCellModel *model1 = [[TestCellModel alloc]initWithText:@"第1个" color:[UIColor redColor]];
            YTBaseTableViewSectionModel *m1 = [[YTBaseTableViewSectionModel alloc]initSectionModelConfigWithHeaderModel:[[TestCellModel alloc] initWithText:@"第3组组头" color:[UIColor grayColor]] footerModel:[[TestCellModel alloc] initWithText:@"第3组组尾" color:[UIColor grayColor]] cellModel:@[model1]];
            [self.table registerHeaderFooterClass:[TestHeaderFooterView class]];
            [self.table loadSectionData:@[m1] next:true];
        });
    }
    
    if (page.integerValue == 3) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            TestCellModel *model1 = [[TestCellModel alloc]initWithText:@"第1个" color:[UIColor redColor]];
            TestCellModel *model2 = [[TestCellModel alloc]initWithText:@"第2个" color:[UIColor orangeColor]];
            YTBaseTableViewSectionModel *m1 = [[YTBaseTableViewSectionModel alloc]initSectionModelConfigWithHeaderModel:[[TestCellModel alloc] initWithText:@"第4组组头" color:[UIColor grayColor]] footerModel:[[TestCellModel alloc] initWithText:@"第4组组尾" color:[UIColor grayColor]] cellModel:@[model1,model2]];
            [self.table registerHeaderFooterClass:[TestHeaderFooterView class]];
            [self.table loadSectionData:@[m1] next:false];
        });
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
