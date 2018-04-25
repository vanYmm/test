//
//  VANContentView.m
//  wangyiNew
//
//  Created by 罗美 on 2018/4/18.
//  Copyright © 2018年 罗美. All rights reserved.
//

#import "VANContentView.h"

@interface VANContentView ()

@property(nonatomic, strong) NSArray <NSString *> *titles;

@property(nonatomic, strong)UIViewController *parentVc;

@end

@implementation VANContentView

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray<NSString *> *)titles parentVc:(UIViewController *)parentVc{
    if (self = [super initWithFrame:frame]) {
        self.titles = titles;
        self.parentVc = parentVc;
        [self setupUI];
    }
    return self;
}
- (void)setupUI{
    
    self.backgroundColor = [UIColor redColor];
    
    for (int i =0; i<self.titles.count; i++) {
        UIViewController *vc = [[UIViewController alloc] init];
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor yellowColor];
        label.text = self.titles[i];
        [label sizeToFit];
        label.center = vc.view.center;
        [vc.view addSubview:label];
        [self.parentVc addChildViewController:vc];
        
        if (i == 0) {
            [self addSubview:vc.view];
        }
    }
    

}
@end
