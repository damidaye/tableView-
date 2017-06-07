//
//  TestHeaderFooterNib.m
//  TableViewDemo
//
//  Created by 张欢 on 2017/6/6.
//  Copyright © 2017年 张欢. All rights reserved.
//

#import "TestHeaderFooterNib.h"
#import "TestCellModel.h"

@interface TestHeaderFooterNib ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@end
@implementation TestHeaderFooterNib

- (CGFloat)getHeight{
    
    return 40;
}

- (void)setHeadFooterModel:(id)T{
    
    TestCellModel *model = T;
    self.contentView.backgroundColor = model.color;
    self.label.text = model.text;
}

@end
