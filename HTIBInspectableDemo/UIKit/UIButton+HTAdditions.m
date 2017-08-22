//
//  UIButton+HTAdditions.m
//  HTIBInspectableDemo
//
//  Created by Huiting Mao on 2017/8/21.
//  Copyright © 2017年 Martell994. All rights reserved.
//

#import "UIButton+HTAdditions.h"

@implementation UIButton (HTAdditions)

/**
 *  Layer
 */

#pragma mark - Layer

- (CGFloat)kCornerRadius {
    return self.layer.cornerRadius;
}
- (void)setKCornerRadius:(CGFloat)kCornerRadius {
    self.layer.cornerRadius = kCornerRadius;
    self.layer.masksToBounds = (kCornerRadius > 0);
}

- (CGFloat )kBorderWidth {
    return self.layer.borderWidth;
}
- (void)setKBorderWidth:(CGFloat)kBorderWidth {
    self.layer.borderWidth = kBorderWidth;
}

- (UIColor *)gBorderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}
- (void)setGBorderColor:(UIColor *)gBorderColor {
    self.layer.borderColor = [gBorderColor CGColor];
}

/**
 *  Normal
 */

#pragma mark - Normal

- (NSString *)ht_normalTitle {
    return [self titleForState:UIControlStateNormal];
}
- (void)setHt_normalTitle:(NSString *)ht_normalTitle {
    [self setTitle:ht_normalTitle forState:UIControlStateNormal];
}

- (UIColor *)ht_normalTitleColor {
    return [self titleColorForState:UIControlStateNormal];
}
- (void)setHt_normalTitleColor:(UIColor *)ht_normalTitleColor {
    [self setTitleColor:ht_normalTitleColor forState:UIControlStateNormal];
}

@end
