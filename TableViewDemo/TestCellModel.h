//
//  TestCellModel.h
//  TableViewDemo
//
//  Created by 张欢 on 2017/6/6.
//  Copyright © 2017年 张欢. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TestCellModel : NSObject

@property(nonatomic,copy)NSString *text;
@property(nonatomic,strong)UIColor *color;
- (instancetype)initWithText:(NSString *)text color:(UIColor *)color;

@end
