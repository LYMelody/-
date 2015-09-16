//
//  PathModel.m
//  滑板的实现
//
//  Created by rongfeng on 15/9/16.
//  Copyright (c) 2015年 rongfeng. All rights reserved.
//

#import "PathModel.h"

@implementation PathModel

- (void)setPath:(CGMutablePathRef)path {
    if (_path != path) {
        CGPathRelease(_path);
        CGPathRetain(path);
        _path = path;
    }
}

- (void)dealloc {
    CGPathRelease(_path);
}
@end
