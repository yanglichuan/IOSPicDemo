//
//  HMHandleImageView.h
//  06-画板
//
//  Created by apple on 14-9-4.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^HMHandleImageViewBlock)(UIImage *image);

@interface HMHandleImageView : UIView

@property (nonatomic, strong) UIImage *image;

@property (nonatomic, copy) HMHandleImageViewBlock block;

@end
