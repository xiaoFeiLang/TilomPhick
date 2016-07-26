//
//  UIButton+MyButton.h
//  TilomPhick
//
//  Created by Loulou on 16/7/26.
//  Copyright © 2016年 QXB. All rights reserved.
//

#import <UIKIt/UIKIt.h>
typedef enum {
    UIButtonTitleWithImageAlignmentUp = 0,  // 图上字下
    UIButtonTitleWithImageAlignmentLeft,    // image is left, title is right
    UIButtonTitleWithImageAlignmentDown,    // image is down, title is up
    UIButtonTitleWithImageAlignmentRight    // image is right, title is left
} UIButtonTitleWithImageAlignment;

@interface UIButton (MyButton)
/**
 *  按钮样式
 *  UIButtonTitleWithImageAlignment 样式
 *  @param imgTextDistance   图片和标题距离,默认是5
 */
- (void)setButtonTitleWithImageAlignment:(UIButtonTitleWithImageAlignment)buttonTitleWithImageAlignment imgTextDistance:(CGFloat)imgTextDistance;

@end
