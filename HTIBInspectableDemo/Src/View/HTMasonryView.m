//
//  HTMasonryView.m
//  HTIBInspectableDemo
//
//  Created by Huiting Mao on 2017/8/22.
//  Copyright © 2017年 Martell994. All rights reserved.
//

#import "HTMasonryView.h"
#import <Masonry.h>
#import "UIButton+HTAdditions.h"

IB_DESIGNABLE

@interface HTMasonryView ()

@property (nonatomic, strong) UIButton *masonryButton;

@end

@implementation HTMasonryView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    _masonryButton = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.kCornerRadius = 8.0f;
        btn.kBorderWidth = 1.0f;
        btn.gBorderColor = btn.ht_normalTitleColor;
        btn.ht_normalTitle = @"Masonry创建的按钮";
        [self addSubview:btn];
        btn;
    });
    [self layout];
}

- (void)layout {
    __weak __typeof(self) weakSelf = self;
    [_masonryButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-30);
        make.top.bottom.mas_equalTo(weakSelf);
    }];
}

@end
