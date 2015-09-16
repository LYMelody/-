//
//  PannelView.h
//  滑板的实现
//
//  Created by rongfeng on 15/9/16.
//  Copyright (c) 2015年 rongfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PannelView : UIView


@property(nonatomic,strong)UIColor *drawcolor;
@property(nonatomic,assign)CGFloat drawline;
@property(nonatomic,assign)CGMutablePathRef drawPath;
@property(nonatomic,strong)NSMutableArray *paths;

- (void)undo;

- (void)clearScreen;



@end
