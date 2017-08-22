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

@interface HTCustomButton : UIButton

@end
