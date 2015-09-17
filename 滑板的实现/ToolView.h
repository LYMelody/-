//
//  ToolView.h
//  滑板的实现
//
//  Created by rongfeng on 15/9/16.
//  Copyright (c) 2015年 rongfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Selectbutton.h"


typedef void(^SelectColorBlock) (UIColor *);

typedef void(^SelectLineWidthBlock) (CGFloat);
typedef void(^OtherBlock) (void);
typedef void(^EraseBlock) (CGFloat);
@interface ToolView : UIView {
    
    UIView *_buttonView;
    UIView *_colorView;
    UIView *lineView;
    UIView *_eraseView;
    NSArray *eraselinearray;
    NSArray *colorarray;
    NSArray *linearray;
    
    SelectColorBlock _colorblock;
    SelectLineWidthBlock _linewidthblock;
    EraseBlock _eraseblock;
    OtherBlock _undoblock;
    OtherBlock _clearblock;
}

@property(nonatomic,strong)Selectbutton *selectbutton;

- (void)addSelectColorblock:(SelectColorBlock)selectcolorblock andSelectLineblock:(SelectLineWidthBlock)selectlineblock anderaseblock:(EraseBlock)eraseblock andundoblock:(OtherBlock)undoblock andclearblock:(OtherBlock)clearblock;
@end
