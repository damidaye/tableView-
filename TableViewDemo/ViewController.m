//
//  ViewController.m
//  TableViewDemo
//
//  Created by 张欢 on 2017/6/5.
//  Copyright © 2017年 张欢. All rights reserved.
//

#import "ViewController.h"
#import "TestVCViewController.h"
@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self presentViewController:[TestVCViewController new] animated:true completion:nil];
}

@end
