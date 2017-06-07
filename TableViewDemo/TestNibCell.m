//
//  TestNibCell.m
//  TableViewDemo
//
//  Created by 张欢 on 2017/6/6.
//  Copyright © 2017年 张欢. All rights reserved.
//

#import "TestNibCell.h"
#import "TestCellModel.h"
@implementation TestNibCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (CGFloat)getHeight{
    
    return 280;
}

- (void)setCellModel:(id)T{
    
    TestCellModel *model = T;
    self.textLabel.text = model.text;
    self.backgroundColor = model.color;
}

@end
