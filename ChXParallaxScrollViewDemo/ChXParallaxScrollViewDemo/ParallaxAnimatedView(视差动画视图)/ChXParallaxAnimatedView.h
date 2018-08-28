//
//  ChXParallaxAnimatedView.h
//  ChXParallaxScrollViewDemo
//
//  Created by Xu Chen on 2018/8/28.
//  Copyright © 2018年 xu.yzl. All rights reserved.
//  视差滚动视图，存放待滚动的 imageView 和 imageView的横坐标

#import <UIKit/UIKit.h>

@interface ChXParallaxAnimatedView : UIView
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, assign) CGFloat imageViewX;

@end
