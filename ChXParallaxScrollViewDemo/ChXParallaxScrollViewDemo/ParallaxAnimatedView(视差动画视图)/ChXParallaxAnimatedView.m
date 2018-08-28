//
//  ChXParallaxAnimatedView.m
//  ChXParallaxScrollViewDemo
//
//  Created by Xu Chen on 2018/8/28.
//  Copyright © 2018年 xu.yzl. All rights reserved.
//

#import "ChXParallaxAnimatedView.h"

@implementation ChXParallaxAnimatedView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self addSubview:self.imageView];
        
        // 当 imageView 超出本视图时，超出部分裁剪掉
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)setImageViewX:(CGFloat)imageViewX {
    _imageViewX = imageViewX;
    
    self.imageView.frame = CGRectMake(imageViewX, 0, self.frame.size.width, self.frame.size.height);
}

@end
