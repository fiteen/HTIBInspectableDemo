//
//  HTCustomButton.h
//  HTIBInspectableDemo
//
//  Created by Huiting Mao on 2017/8/21.
//  Copyright © 2017年 Martell994. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,HTCustomButtonType){
    HTCustomButtonTypeImageTop = 0,
    HTCustomButtonTypeTitleTop,
    HTCustomButtonTypeImageLeft,
    HTCustomButtonTypeTitleLeft,
} ;

IB_DESIGNABLE

@interface HTCustomButton : UIButton

/** 可视化设置边框颜色 */
@property (nonatomic, strong)IBInspectable UIColor *borderColor;

@end
