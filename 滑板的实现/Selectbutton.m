//
//  Selectbutton.m
//  滑板的实现
//
//  Created by rongfeng on 15/9/16.
//  Copyright (c) 2015年 rongfeng. All rights reserved.
//

#import "Selectbutton.h"

@implementation Selectbutton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

 */


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
       self.title = @"";
       self.font = [UIFont systemFontOfSize:16];
        self.selecatedState = NO;
        
    }
    
    return self;
}


 - (void)drawRect:(CGRect)rect {
     //花标题
     NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
     style.alignment = NSTextAlignmentCenter;
     style.lineBreakMode = NSLineBreakByTruncatingTail;
     
     NSDictionary *attibutes = @{
                                 NSFontAttributeName : self.font,
                                 NSForegroundColorAttributeName : [UIColor blackColor],
                                 NSParagraphStyleAttributeName : style
                                 };
     [self.title drawInRect:rect withAttributes:attibutes];
     //画红线；
     if (self.selecatedState) {
         
         CGRect frame = CGRectMake(0, CGRectGetHeight(rect) - 5, CGRectGetWidth(rect), 2);
         [[UIColor redColor] setFill];
         UIRectFill(frame);
         
     }
     
}

- (void)setFont:(UIFont *)font {
    if (_font != font) {
        _font = font;
    }
    [self setNeedsDisplay];
}

- (void)setTitle:(NSString *)title {
    if (_title != title) {
        _title = title;
    }
    [self setNeedsDisplay];
}

- (void)setSelecatedState:(BOOL)selecatedState {
    if (_selecatedState != selecatedState) {
        _selecatedState = selecatedState;
    }
    [self setNeedsDisplay];
}
@end
