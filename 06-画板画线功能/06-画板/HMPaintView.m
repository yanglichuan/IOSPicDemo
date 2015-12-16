//
//  HMPaintView.m
//  06-画板
//
//  Created by apple on 14-9-4.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HMPaintView.h"

@interface HMPaintView ()

@property (nonatomic, strong) UIBezierPath *path;

@property (nonatomic, strong) NSMutableArray *paths;

@end

@implementation HMPaintView

- (NSMutableArray *)paths
{
    if (_paths == nil) {
        _paths = [NSMutableArray array];
    }
    
    return _paths;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (CGPoint)pointWithTouches:(NSSet *)touches
{
    UITouch *touch = [touches anyObject];
    
    return [touch locationInView:self];
}

#warning 确定起点
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    // 创建路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    _path = path;
    [self.paths addObject:path];
    
    // 获取触摸点
    CGPoint pos = [self pointWithTouches:touches];
    
    // 确定起点
    [path moveToPoint:pos];
}


#warning 确定路径终点
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 获取触摸点
    CGPoint pos = [self pointWithTouches:touches];

    // 确定终点
    [_path addLineToPoint:pos];
    
    // 重绘
    [self setNeedsDisplay];
    
}


// 把之前的全部清空 重新绘制
- (void)drawRect:(CGRect)rect
{
    
    // 遍历所有的路径绘制
    for (UIBezierPath *path in self.paths) {
        [path stroke];
     
    }
    
}


@end
