//
//  HTCustomButton.m
//  HTIBInspectableDemo
//
//  Created by Huiting Mao on 2017/8/21.
//  Copyright © 2017年 Martell994. All rights reserved.
//

#import "HTCustomButton.h"

@implementation HTCustomButton

/**
 *  设置边框颜色
 *
 *  @param customBorderColor 可视化视图传入的值
 */
- (void)setCustomBorderColor:(UIColor *)customBorderColor {
    self.layer.borderColor = customBorderColor.CGColor;
}

@end
