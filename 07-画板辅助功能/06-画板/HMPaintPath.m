//
//  HMPaintPath.m
//  06-画板
//
//  Created by apple on 14-9-4.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HMPaintPath.h"

@implementation HMPaintPath

+ (instancetype)paintPathWithLineWidth:(CGFloat)width color:(UIColor *)color startPoint:(CGPoint)startP
{
    HMPaintPath *path = [[self alloc] init];
    path.lineWidth = width;
    path.color = color;
    [path moveToPoint:startP];
    
    return path;
}

@end
