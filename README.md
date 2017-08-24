# HTIBInspectableDemo

交互设计和UI设计水准很大程度影响着用户对应用的评价，iOS开发发展至今已逾10年，开发者对于界面UI编码的习惯逐渐分化成三大流派：

- code - 易追踪、可复用、便于版本控制，但不直观
- xib - 简单便捷、直观、一一对应，但易冲突
- storyboard - 逻辑清晰、简单易用、直观高效，虽易冲突、复用性不佳，但仍是未来趋势

xib 和 storyboard 均采用了 Interface Builder（IB）来生成GUI，通过面板上简单的拖拽替代繁琐冗余的code来构建页面。但我们经常发现，既有的功能并不能完全满足布局的需要，那么，我们可以通过在特定的位置定义可视化属性`IBInspectable`、定义宏`IB_DESIGNABLE`来精简代码。

下文具体介绍一下如何使用。

>【场景】设置按钮：圆角`cornerRadius`：8pt、边框颜色`borderWidth`：1pt、边框宽度`borderColor`：系统蓝色

### **巧用`IBInspectable`**

`【IBInspectable】` 这一属性提供了访问功能的新方式：用户自定义的运行时属性，让支持KVC的属性能够在身份检查器（Identity Inspector）的 User Defined Runtime Attributes 中配置。

它支持修饰的属性类型有：`BOOL`、`NSNumber`、`CGPoint`、`CGSize`、`CGRect`、`UIColor`、`NSString`、`NSLocalizedString`、`NSRange`、`UIImage`、`NSNull`。

如果想让特定类型的控件设置某个属性，可以为对应的UIKit添加分类，为定义该属性时加上`IBInspectable`，示例：

```
#import <UIKit/UIKit.h>

@interface UIButton (HTAdditions)

@property (nonatomic) IBInspectable CGFloat kCornerRadius;
@property (nonatomic) IBInspectable CGFloat kBorderWidth;
@property (nonatomic,copy) IBInspectable UIColor *gBorderColor;

@end

```

这时Xcode的Attributes Inspector栏中就会出现三个新的可编辑属性。

![Attributes Inspector显示的可视化属性](http://wx4.sinaimg.cn/mw690/ae7fac63gy1fitn2cls1yj207c0a8js4.jpg "Attributes Inspector显示的可视化属性")

Identity Inspector下的 User Defined Runtime Attributes也会出现相应的key path和value值。

![User Defined Runtime Attributes](http://wx2.sinaimg.cn/mw690/ae7fac63gy1fitoxt8bd3j207h0580t0.jpg "User Defined Runtime Attributes显示的可视化属性")

设置好后run一下工程就能看到场景中要求的效果，但通常开发者不需要所有的按钮都设置圆角、边框，更多的是采用自定义视图的形式统一处理相似风格的control。为了更高效地开发，接下来介绍宏定义`IB_DESIGNABLE`。

### **巧用`IB_DESIGNABLE`**

`【IB_DESIGNABLE】` 在类名前加上此宏定义，初始化、布置和绘制方法将被用来在画布上渲染该类的自定义视图。

操作步骤：
1. storyboard中拖拽一个UIButton；
2. 创建父类是UIButton的HTCustomButton类文件，并在.h的`interface`前定义`IB_DESIGNABLE`；
3. 给步骤1按钮的Custom Class关联上HTCustomButton。

这时我们就可以直接在User Defined Runtime Attributes中加入想要的属性，例如圆角、边框宽度等。边框颜色由于UIColor类型的特殊性，需要重新定义。

HTCustomButton.h：
```
#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface HTCustomButton : UIButton

/** 设置边框颜色可视化 */
@property (nonatomic, strong)IBInspectable UIColor *customBorderColor;

@end
```
HTCustomButton.m：
```
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
```
设置好后就可以直接添加或修改相应的属性动态刷新控件，如下图：

![自定义视图通过`IB_DESIGNABLE`动态刷新效果图](http://wx3.sinaimg.cn/large/ae7fac63gy1fitsfvesgvg20lr0epaff.gif "自定义视图通过`IB_DESIGNABLE`动态刷新效果图")

-----
### **纯代码开发流派如何借助`IB_DESIGNABLE`动态查看布局效果**

对于很多被强制勒令用纯代码coding的开发者来说，下面介绍的干货绝对会大大提升开发效率。

举个例子：创建基于UIView的HTMasonryView，以及同名的.xib文件，并在Custom Class中关联好。接下来在HTMasonryView.m中创建并布局masonryButton，注意添加`IB_DESIGNABLE`，代码如下：
```
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
        btn.ht_normalTitle = @"code创建-Masonry布局的按钮";
        btn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
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
```
点开HTMasonryView.xib查看会发现已经渲染出了Masonry的布局效果。

![通过Masonry布局动态刷新效果图](http://wx4.sinaimg.cn/large/ae7fac63gy1fitsfurja3g20r80gwh68.gif "通过Masonry布局动态刷新效果图")

ps：如果渲染失败，查看Editor->Automatically Refresh Views 是否勾选，尝试重启Xcode。

开启成功的特点就是Show the Identity inspector->Custom Class->Designables:Up to date(更新完毕)/Updating(更新中)，如果显示Build failed建议检查布局代码。
