//
//  ViewController.m
//  滑板的实现
//
//  Created by rongfeng on 15/9/16.
//  Copyright (c) 2015年 rongfeng. All rights reserved.
//

#import "ViewController.h"
#import "PannelView.h"
#import "ToolView.h"
#import "common.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    PannelView *pannelView = [[PannelView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    pannelView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:pannelView];
    
    ToolView *toolView = [[ToolView alloc] initWithFrame:CGRectMake(0, 20, kScreenWidth, 100)];
    [self.view addSubview:toolView];
    toolView.backgroundColor = [UIColor grayColor];
    
    
    [toolView addSelectColorblock:^(UIColor *color) {
        pannelView.drawcolor = color;
    } andSelectLineblock:^(CGFloat linewidth) {
        pannelView.drawline = linewidth;
    } anderaseblock:^{
        pannelView.drawcolor = [UIColor whiteColor];
        pannelView.drawline = 10.0f;
    } andundoblock:^{
        [pannelView undo];
    } andclearblock:^{
        [pannelView clearScreen];
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
