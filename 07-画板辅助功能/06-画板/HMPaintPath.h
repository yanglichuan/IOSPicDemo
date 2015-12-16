//
//  HMPaintPath.h
//  06-画板
//
//  Created by apple on 14-9-4.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMPaintPath : UIBezierPath

@property (nonatomic, strong) UIColor *color;


+ (instancetype)paintPathWithLineWidth:(CGFloat)width color:(UIColor *)color startPoint:(CGPoint)startP;

@end
