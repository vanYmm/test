//
//  ViewController.m
//  wangyiNew
//
//  Created by 罗美 on 2018/4/18.
//  Copyright © 2018年 罗美. All rights reserved.
//

#import "ViewController.h"
#import "VANPageView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    VANPageView *pageView = [[VANPageView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64) addParentController:self];
    [self.view addSubview:pageView];
    
}


@end
