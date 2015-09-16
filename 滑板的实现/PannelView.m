//
//  PannelView.m
//  滑板的实现
//
//  Created by rongfeng on 15/9/16.
//  Copyright (c) 2015年 rongfeng. All rights reserved.
//

#import "PannelView.h"
#import "PathModel.h"
@implementation PannelView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

 */


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.drawcolor = [UIColor blackColor];
        self.drawline = 10.0f;
    }
    return self;
    
}


- (void)drawRect:(CGRect)rect {
   
    for (PathModel *p in self.paths) {
        
        
        [self drawPath:p.path withColor:p.color withLineWidth:p.linewidth];
        
    }
    
    if (self.drawPath != nil) {
        [self drawPath:self.drawPath withColor:self.drawcolor withLineWidth:self.drawline];
        
    }
     
}

//封装一个方法来画某一条路径
- (void)drawPath:(CGMutablePathRef)path withColor:(UIColor *)color withLineWidth:(CGFloat)lineWidth {
    //获取图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //设置当前context的属性
    [color setStroke];
    
    CGContextSetLineWidth(context, lineWidth);
    
    //获取路径并把它添加到context上去
    CGContextAddPath(context, path);
    
    //绘制
    CGContextDrawPath(context, kCGPathStroke);
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    self.drawPath = CGPathCreateMutable();
    CGPathMoveToPoint(self.drawPath, NULL, point.x, point.y);
    
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    CGPathAddLineToPoint(self.drawPath, NULL, point.x, point.y);
    
    [self setNeedsDisplay];
    
    
    
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if (self.paths == nil) {
        self.paths = [NSMutableArray array];
    }
    PathModel *model = [[PathModel alloc] init];
    
    model.path = self.drawPath;
    model.color = self.drawcolor;
    model.linewidth = self.drawline;
    
    [self.paths addObject:model];
    
    CGPathRelease(self.drawPath);
    
    self.drawPath = nil;
    
}

- (void)undo {
    
    [self.paths removeLastObject];
    [self setNeedsDisplay];
    
    
}
- (void)clearScreen {
    [self.paths removeAllObjects];
    [self setNeedsDisplay];
}
@end
