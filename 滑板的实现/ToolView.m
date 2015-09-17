//
//  ToolView.m
//  滑板的实现
//
//  Created by rongfeng on 15/9/16.
//  Copyright (c) 2015年 rongfeng. All rights reserved.
//

#import "ToolView.h"
#import "Selectbutton.h"
#import "common.h"
@implementation ToolView

- (void)drawRect:(CGRect)rect {
    [self createbuttonView];
    [self createcolorView];
    [self createlineView];
    [self createeraseView];
}


- (void)createbuttonView {
    
    //创建五个按钮的父视图
    _buttonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), 40)];
    _buttonView.backgroundColor = [UIColor clearColor];
    [self addSubview:_buttonView];
    
    
    NSArray *titlearray = @[@"颜色",@"线宽",@"橡皮",@"撤销",@"清屏"];
    
    CGFloat width = kScreenWidth/titlearray.count;
    
    for (NSInteger i = 0;i < titlearray.count; i++) {
        Selectbutton *button = [[Selectbutton alloc] initWithFrame:CGRectMake(i * width, 0, width, 40)];
        
        button.title = titlearray[i];
        button.backgroundColor = [UIColor clearColor];
        button.tag = i;
        
        [button addTarget:self action:@selector(clickbutton:) forControlEvents:UIControlEventTouchUpInside];
        
        [_buttonView addSubview:button];
        
        
    }
    
}


- (void)createcolorView {
    
    //创建颜色选择父视图
    _colorView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_buttonView.frame), kScreenWidth, 60)];
    _colorView.backgroundColor = [UIColor clearColor];
    
    _colorView.hidden = YES;
    
    [self addSubview:_colorView];

    colorarray = @[
                   [UIColor redColor],
                   [UIColor orangeColor],
                   [UIColor purpleColor],
                   [UIColor blackColor],
                   [UIColor blueColor],
                   [UIColor yellowColor],
                   [UIColor brownColor],
                   [UIColor greenColor]
                   ];
    CGFloat width = kScreenWidth/colorarray.count;
    for (NSInteger i = 0;i < colorarray.count;i++) {
        UIControl *ctr = [[UIControl alloc] initWithFrame:CGRectMake(i*width,5, width - 5, 50)];
        ctr.backgroundColor = colorarray[i];
        ctr.tag = i;
        [ctr addTarget:self action:@selector(selectcolor:) forControlEvents:UIControlEventTouchUpInside];
        [_colorView addSubview:ctr];
    }
    
}

- (void)createlineView {
    
    lineView  = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_buttonView.frame), kScreenWidth, 60)];
    lineView.backgroundColor = [UIColor grayColor];
    [self addSubview:lineView];
    lineView.hidden = YES;
    linearray = @[@1.0,@3.0,@5.0,@8.0,@11.0,@15.0,@18.0];
    CGFloat width = kScreenWidth/linearray.count;
    for (NSInteger i = 0;i < linearray.count;i++) {
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i*width,5, width, 40)];
        [button setTitle:[NSString stringWithFormat:@"%@点",linearray[i]] forState:UIControlStateNormal];
        button.tag = i;
        [button addTarget:self action:@selector(selectline:) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor = [UIColor clearColor];
        [lineView addSubview:button];
        
    }
    
}

- (void)createeraseView {
    _eraseView  = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_buttonView.frame), kScreenWidth, 60)];
    _eraseView.backgroundColor = [UIColor grayColor];
    [self addSubview:_eraseView];
    _eraseView.hidden = YES;
    eraselinearray = @[@10.0,@13.0,@15.0,@18.0,@20.0,@22.0,@24.0];
    CGFloat width = kScreenWidth/eraselinearray.count;
    for (NSInteger i = 0;i < eraselinearray.count;i++) {
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i*width,5, width, 40)];
        [button setTitle:[NSString stringWithFormat:@"%@点",eraselinearray[i]] forState:UIControlStateNormal];
        button.tag = i;
        [button addTarget:self action:@selector(selecteraseline:) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor = [UIColor clearColor];
        [_eraseView addSubview:button];
        
    }

    
    
}

- (void)clickbutton:(Selectbutton *)btn {
    
    self.selectbutton.selecatedState = NO;
    btn.selecatedState = YES;
    self.selectbutton = btn;
    
    
    switch (btn.tag) {
        case 0://颜色
            _colorView.hidden = NO;
            lineView.hidden = YES;
            _eraseView.hidden = YES;
            break;
        case 1://线宽
            _colorView.hidden = YES;
            lineView.hidden = NO;
            _eraseView.hidden = YES;
            break;
        case 2://橡皮
            _colorView.hidden = YES;
            lineView.hidden = YES;
            _eraseView.hidden = NO;
            break;
        case 3://撤销
            if (_undoblock != nil) {
                _undoblock();
            }
            break;
        case 4://清屏
            if (_clearblock != nil) {
                _clearblock();
            }
            break;

        default:
            break;
    }
    
    
    
}

- (void)selectcolor:(UIControl *)ctr{
    
    UIColor *color = colorarray[ctr.tag];
    NSLog(@"%@",color);
    //回调block
    if (_colorblock != nil) {
        _colorblock (color);
    }
    
    
}
- (void)selectline:(UIButton *)btn {
    
    NSLog(@"字号：%@",linearray[btn.tag]);
    
    CGFloat linewidth = [linearray[btn.tag] floatValue];
    if (_linewidthblock != nil) {
        _linewidthblock (linewidth);
    }
    
}


- (void)selecteraseline:(UIButton *)btn {
    
    CGFloat width = [eraselinearray[btn.tag] floatValue];
    
    
    if (_eraseblock != nil) {
        _eraseblock(width);
    }

    
    
}
- (void)addSelectColorblock:(SelectColorBlock)selectcolorblock andSelectLineblock:(SelectLineWidthBlock)selectlineblock anderaseblock:(EraseBlock)eraseblock andundoblock:(OtherBlock)undoblock andclearblock:(OtherBlock)clearblock{
    
    if (_colorblock != selectcolorblock) {
        _colorblock = [selectcolorblock copy];
    }
    if (_linewidthblock != selectlineblock) {
        _linewidthblock = [selectlineblock copy];
    }
    if (_eraseblock != eraseblock) {
        _eraseblock = [eraseblock copy];
    }
    if (_undoblock != undoblock) {
        _undoblock = [undoblock copy];
    }
    if (_clearblock != clearblock) {
        _clearblock = [clearblock copy];
    }
    
    
}


@end
