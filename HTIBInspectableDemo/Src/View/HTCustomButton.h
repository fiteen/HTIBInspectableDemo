//
//  HTCustomButton.h
//  HTIBInspectableDemo
//
//  Created by Huiting Mao on 2017/8/21.
//  Copyright © 2017年 Martell994. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface HTCustomButton : UIButton

/** 设置边框颜色可视化 */
@property (nonatomic, strong)IBInspectable UIColor *customBorderColor;

@end
