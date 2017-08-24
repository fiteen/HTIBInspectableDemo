//
//  UIButton+HTAdditions.h
//  HTIBInspectableDemo
//
//  Created by Huiting Mao on 2017/8/21.
//  Copyright © 2017年 Martell994. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (HTAdditions)

/**
 *  Layer
 */

#pragma mark - Layer

@property (nonatomic) IBInspectable CGFloat kCornerRadius;
@property (nonatomic) IBInspectable CGFloat kBorderWidth;
@property (nonatomic,copy) IBInspectable UIColor *gBorderColor;

/**
 *  Normal
 */

#pragma mark - Normal

@property (nonatomic,copy) NSString *ht_normalTitle;
@property (nonatomic,copy) UIColor *ht_normalTitleColor;

@end
