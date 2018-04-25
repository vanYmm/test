//
//  VANTitleBar.m
//  wangyiNew
//
//  Created by 罗美 on 2018/4/18.
//  Copyright © 2018年 罗美. All rights reserved.
//

#import "VANTitleBar.h"

@interface VANTitleBar () <UIScrollViewDelegate>

@property(nonatomic, strong)NSArray <NSString *> *titles;

@property(nonatomic, strong)UIScrollView *scrollow;

@property(nonatomic, strong)UIButton *selectBtn;

@end

@implementation VANTitleBar

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray<NSString *> *)titles{
    if (self = [super initWithFrame:frame]) {
        self.titles = titles;
        [self setupUI];
    }
    return self;
}
- (void)setupUI{

    [self addSubview:self.scrollow];
    self.scrollow.contentSize = CGSizeMake(self.titles.count *88, 0);
    self.scrollow.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    for (int i = 0; i<self.titles.count; i++) {
        
        UIButton *btn = [[UIButton alloc] init];

        CGFloat btnW = 88;
        CGFloat btnH = self.frame.size.height;
        CGFloat btnX = i * btnW;
        CGFloat btnY = 0;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        [btn setTitle:self.titles[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        btn.tag = 999 + i;
        [btn addTarget:self action:@selector(btnTopEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollow addSubview:btn];
        
        if (i == 0) {
            // 默认选择第一个
            btn.selected = YES;
            self.selectBtn = btn;
        }
    }
}

- (void)btnTopEvent:(UIButton *)btn{
    
    self.selectBtn.selected = NO;
    btn.selected = YES;
    self.selectBtn = btn;
    if ([self.delegate respondsToSelector:@selector(btnInTitleBarTopEvent:selectIndex:)]) {
        [self.delegate btnInTitleBarTopEvent:self selectIndex:btn.tag - 999];
    }
    
}
- (UIScrollView *)scrollow{
    if (_scrollow == nil) {
        UIScrollView *scrollow = [[UIScrollView alloc] initWithFrame:self.bounds];
        scrollow.showsVerticalScrollIndicator = NO;
        scrollow.showsHorizontalScrollIndicator = NO;
        scrollow.bounces = NO;
        scrollow.alwaysBounceHorizontal = NO;
        scrollow.alwaysBounceVertical = NO;
        scrollow.backgroundColor = [UIColor purpleColor];
        scrollow.delegate = self;
        _scrollow = scrollow;
    }
    
    return _scrollow;
}
// 滚动结束
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSInteger currentIndex = scrollView.contentOffset.x/88.0;
    if ([self.delegate respondsToSelector:@selector(btnInTitleBarTopEvent:selectIndex:)]) {
        [self.delegate btnInTitleBarTopEvent:self selectIndex:currentIndex];
    }
    NSLog(@"滚动结束");

}
// 停止滚动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    NSLog(@"停止滚动");
    if (!scrollView.decelerating) {
        
        NSInteger currentIndex = scrollView.contentOffset.x/88.0;
        if ([self.delegate respondsToSelector:@selector(btnInTitleBarTopEvent:selectIndex:)]) {
            [self.delegate btnInTitleBarTopEvent:self selectIndex:currentIndex];
        }
    }
}

// 结束拖拽
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{

    NSLog(@"结束拖拽");
}
@end
