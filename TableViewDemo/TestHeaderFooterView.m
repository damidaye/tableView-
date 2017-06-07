//
//  TestHeaderFooterView.m
//  TableViewDemo
//
//  Created by 张欢 on 2017/6/6.
//  Copyright © 2017年 张欢. All rights reserved.
//

#import "TestHeaderFooterView.h"
#import "TestCellModel.h"

@interface TestHeaderFooterView ()

@property(nonatomic,strong)UILabel *label;

@end
@implementation TestHeaderFooterView


- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithReuseIdentifier:NSStringFromClass([self class])]) {
        
        self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 20)];
        [self.contentView addSubview:self.label];
    }
    return self;
}

- (CGFloat)getHeight{
    
    return 20;
}

- (void)setHeadFooterModel:(id)T{
    
    TestCellModel *model = T;
    self.label.text = model.text;
    self.contentView.backgroundColor = model.color;
    NSLog(@"%@",self);
    
}

@end
