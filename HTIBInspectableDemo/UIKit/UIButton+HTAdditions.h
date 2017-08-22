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

@property (nonatomic) IBInspectable CGFloat kCornerRadius; // Defaults to zero.

@property (nonatomic) IBInspectable CGFloat kBorderWidth; // Defaults to zero.

@property (nonatomic,copy) IBInspectable UIColor *gBorderColor; // Defaults to opaque black.

@end
