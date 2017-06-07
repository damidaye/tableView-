//
//  TestCellModel.m
//  TableViewDemo
//
//  Created by 张欢 on 2017/6/6.
//  Copyright © 2017年 张欢. All rights reserved.
//

#import "TestCellModel.h"

@implementation TestCellModel

- (instancetype)initWithText:(NSString *)text color:(UIColor *)color{
    
    if (self = [super init]) {
        
        self.text = text;
        self.color = color;
    }
    return self;
}

@end
