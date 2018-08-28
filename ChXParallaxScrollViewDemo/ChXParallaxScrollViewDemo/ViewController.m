//
//  ViewController.m
//  ChXParallaxScrollViewDemo
//
//  Created by Xu Chen on 2018/8/28.
//  Copyright © 2018年 xu.yzl. All rights reserved.
//

#import "ViewController.h"
#import "ChXParallaxAnimatedView.h"

@interface ViewController () <UIScrollViewDelegate>
@property (nonatomic, assign) CGFloat kWidth;
@property (nonatomic, assign) CGFloat kHeight;
/*! 默认 tag 值，用于获取 parallaxView */
@property (nonatomic, assign) CGFloat defaultTag;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
}

- (void)setupUI {
    self.kWidth = self.view.frame.size.width;
    self.kHeight = self.view.frame.size.height;
    self.defaultTag = 110;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    
    CGFloat imageCount = 6;
    for (int idx = 0; idx < imageCount; idx++) {
        ChXParallaxAnimatedView *parallaxView = [[ChXParallaxAnimatedView alloc] initWithFrame:CGRectMake(idx * self.kWidth, 0, self.kWidth, self.kHeight)];
        parallaxView.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",idx]];
        [scrollView addSubview:parallaxView];
        
        parallaxView.tag = self.defaultTag + idx;
    }
    
    scrollView.contentSize = CGSizeMake(self.kWidth * imageCount, _kHeight);
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat x = scrollView.contentOffset.x;
    NSLog(@"x偏移量= %f",x);
    
    NSInteger currentIndex = x / self.kWidth;
    NSLog(@"当前页数：%ld",(long)currentIndex);
    
    // 获取待滚动的左右视图
    ChXParallaxAnimatedView *leftView = [scrollView viewWithTag:(currentIndex + self.defaultTag)];
    ChXParallaxAnimatedView *rightView = [scrollView viewWithTag:(currentIndex + 1 + self.defaultTag)];

    // 移动距离（可移动的距离，差的这个 100 是，最多剩 100 的距离就算翻页了，这一页就翻过去了）
    CGFloat moveLength = self.kWidth - 100;
    
    // leftView 默认横坐标
    CGFloat leftViewX = (currentIndex + 1) * self.kWidth;
    // leftView 拖拽距离
    CGFloat leftDragLength = x - leftViewX;
    // leftView 移动百分比
    CGFloat leftMovePer = leftDragLength / self.kWidth;

    leftView.imageViewX = moveLength + leftMovePer * moveLength;
    NSLog(@"leftView.contentX: %.2f",leftView.imageViewX);


    CGFloat rightViewX = currentIndex * self.kWidth;
    CGFloat rightDragLength = x - rightViewX;
    CGFloat rightMovePer = rightDragLength / self.kWidth;

    rightView.imageViewX = -moveLength + rightMovePer * moveLength;
    NSLog(@"rightView.contentX: %.2f",rightView.imageViewX);

    
//    rightView.imageViewX = -moveLength + (x - (currentIndex * self.kWidth))/self.kWidth * moveLength;
//    leftView.imageViewX = (moveLength + (x - ((currentIndex + 1) * self.kWidth))/self.kWidth * moveLength);
//
    
}




@end
