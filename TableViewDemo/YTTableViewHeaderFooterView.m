//
//  YTTableViewHeaderFooterView.m
//  TableViewDemo
//
//  Created by 张欢 on 2017/6/6.
//  Copyright © 2017年 张欢. All rights reserved.
//

#import "YTTableViewHeaderFooterView.h"

@implementation YTTableViewHeaderFooterView

- (CGFloat)getHeight{
    
    return 0.0;
}

- (void)setHeadFooterModel:(id)T{
    
    
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    return [super initWithReuseIdentifier:NSStringFromClass([self class])];
}
@end
