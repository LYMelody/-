//
//  PathModel.h
//  滑板的实现
//
//  Created by rongfeng on 15/9/16.
//  Copyright (c) 2015年 rongfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
@interface PathModel : NSObject

@property(nonatomic,assign)CGMutablePathRef path;
@property(nonatomic,strong)UIColor *color;
@property(nonatomic,assign)CGFloat linewidth;
@end
