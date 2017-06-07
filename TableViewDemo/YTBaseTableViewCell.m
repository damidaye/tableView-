//
//  YTBaseTableViewCell.m
//  TableViewDemo
//
//  Created by 张欢 on 2017/6/6.
//  Copyright © 2017年 张欢. All rights reserved.
//

#import "YTBaseTableViewCell.h"

@implementation YTBaseTableViewCell

- (void)awakeFromNib {

    [super awakeFromNib];
}

-(CGFloat)getHeight{
    
    return 0.0;
}

- (void)setCellModel:(id)T{
    
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    return [super initWithStyle:style reuseIdentifier:reuseIdentifier];
}
@end
