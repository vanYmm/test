//
//  VANPageView.m
//  wangyiNew
//
//  Created by 罗美 on 2018/4/18.
//  Copyright © 2018年 罗美. All rights reserved.
//

#import "VANPageView.h"
#import "VANTitleBar.h"
#import "VANContentView.h"


@interface VANPageView ()<VANTitleBarDelegate>

@property(nonatomic, strong)UIViewController *parentVc;

@property(nonatomic, weak) VANTitleBar *bar;

@property(nonatomic, weak) VANContentView *contentView;

@end

@implementation VANPageView

- (instancetype)initWithFrame:(CGRect)frame addParentController:(UIViewController *)parentVc{
    if (self = [super initWithFrame:frame]) {
        self.parentVc = parentVc;
        [self setupUI];
    }
    return self;
}
- (void)setupUI{
    
    NSArray *titles = @[@"大王",@"小王后",@"黑桃A",@"红桃",@"方块",@"梅花",@"麻将"];
    
    VANTitleBar *bar = [[VANTitleBar alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 44.0) titles:titles];
    self.bar = bar;
    bar.delegate = self;
    [self addSubview:bar];
    
    VANContentView *contentView = [[VANContentView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(bar.frame), self.frame.size.width, self.frame.size.height - CGRectGetMaxY(bar.frame)) titles:titles parentVc:self.parentVc];
    self.contentView = contentView;
    [self addSubview:contentView];
    
}
- (void)run{
    NSLog(@"在master上增加了一个run方法");
}

- (void)test{
    NSLog(@"在dev_van上增加了test");
}
- (void)addOBJ{
    NSLog(@"增加obj_master");
    NSLog(@"在dev_van上");

}
- (void)btnInTitleBarTopEvent:(VANTitleBar *)bar selectIndex:(NSInteger)selectIndex{

    UIViewController *vc = self.parentVc.childViewControllers[selectIndex];
    for (UIView *sub in self.contentView.subviews) {
        [sub removeFromSuperview];
    }
    [self.contentView addSubview:vc.view];

}
@end
