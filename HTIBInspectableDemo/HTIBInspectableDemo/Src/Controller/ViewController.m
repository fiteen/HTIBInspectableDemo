//
//  ViewController.m
//  HTIBInspectableDemo
//
//  Created by Huiting Mao on 2017/8/22.
//  Copyright © 2017年 Martell994. All rights reserved.
//

#import "ViewController.h"
#import "HTMasonryView.h"

@interface ViewController ()

@property (nonatomic, strong) HTMasonryView *masonryView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initMasonryView];
}

- (void)initMasonryView {
    _masonryView = ({
        HTMasonryView *view = [[HTMasonryView alloc] initWithFrame:CGRectMake(0, 240, [UIScreen mainScreen].bounds.size.width, 45)];
        [self.view addSubview:view];
        view;
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
