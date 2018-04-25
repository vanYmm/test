//
//  VANTitleBar.h
//  wangyiNew
//
//  Created by 罗美 on 2018/4/18.
//  Copyright © 2018年 罗美. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VANTitleBar;
@protocol VANTitleBarDelegate <NSObject>

@required

- (void)btnInTitleBarTopEvent:(VANTitleBar *)bar selectIndex:(NSInteger)selectIndex;

@end

@interface VANTitleBar : UIView

@property(nonatomic, weak) id <VANTitleBarDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray <NSString *> *)titles;

@end
