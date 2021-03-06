//
//  YTBaseTableViewCell.h
//  TableViewDemo
//
//  Created by 张欢 on 2017/6/6.
//  Copyright © 2017年 张欢. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^cellConfig)(id model);

@interface YTBaseTableViewCell : UITableViewCell

- (CGFloat)getHeight;
- (void)setCellModel:(id)T;
@property(nonatomic,copy)cellConfig cellClosure;

@end
