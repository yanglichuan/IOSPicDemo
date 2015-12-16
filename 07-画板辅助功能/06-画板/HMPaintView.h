//
//  HMPaintView.h
//  06-画板
//
//  Created by apple on 14-9-4.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMPaintView : UIView
@property (nonatomic, assign) CGFloat width;

@property (nonatomic, strong) UIColor *color;

@property (nonatomic, strong) UIImage *image;


- (void)clearScreen;

- (void)undo;

@end
