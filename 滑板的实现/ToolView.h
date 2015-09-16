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

@interface ToolView : UIView {
    
    UIView *_buttonView;
    UIView *_colorView;
    UIView *lineView;
    NSArray *colorarray;
    NSArray *linearray;
    
    SelectColorBlock _colorblock;
    SelectLineWidthBlock _linewidthblock;
    OtherBlock _eraseblock;
    OtherBlock _undoblock;
    OtherBlock _clearblock;
}

@property(nonatomic,strong)Selectbutton *selectbutton;

- (void)addSelectColorblock:(SelectColorBlock)selectcolorblock andSelectLineblock:(SelectLineWidthBlock)selectlineblock anderaseblock:(OtherBlock)eraseblock andundoblock:(OtherBlock)undoblock andclearblock:(OtherBlock)clearblock;
@end
