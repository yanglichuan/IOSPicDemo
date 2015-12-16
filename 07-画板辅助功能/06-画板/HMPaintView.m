//
//  HMPaintView.m
//  06-画板
//
//  Created by apple on 14-9-4.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HMPaintView.h"

#import "HMPaintPath.h"

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


// 获取触摸点
- (CGPoint)pointWithTouches:(NSSet *)touches
{
    UITouch *touch = [touches anyObject];
    
    return [touch locationInView:self];
}

#warning 确定起点
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 获取触摸点
    CGPoint pos = [self pointWithTouches:touches];
    
    // 创建路径
    HMPaintPath *path = [HMPaintPath paintPathWithLineWidth:_width color:_color startPoint:pos];
    
    _path = path;
    [self.paths addObject:path];
    
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

#pragma mark 初始化线宽
- (void)awakeFromNib
{
    _width = 2;
}

// 把之前的全部清空 重新绘制
- (void)drawRect:(CGRect)rect
{
    if (!self.paths.count) return;
    
    // 遍历所有的路径绘制
    for (HMPaintPath *path in self.paths) {
        
        if ([path isKindOfClass:[UIImage class]]) { // UIImage
            UIImage *image = (UIImage *)path;
            [image drawAtPoint:CGPointZero];
        }else{ // HMPaintPath
            
            [path.color set];
            [path stroke];
        }
    }
}

#pragma mark - 清屏
- (void)clearScreen
{
    [self.paths removeAllObjects];
    
    // 重绘
    [self setNeedsDisplay];
}

#pragma mark - 撤销
- (void)undo
{
    [self.paths removeLastObject];
    
    // 重绘
    [self setNeedsDisplay];
}

#pragma mark - 设置图片，就把图片画在画板上
- (void)setImage:(UIImage *)image
{
    _image = image;
    
    [self.paths addObject:image];
    
    [self setNeedsDisplay];
}


@end
