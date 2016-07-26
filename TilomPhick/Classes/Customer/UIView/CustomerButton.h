//
//  CustomerButton.h
//  TilomPhick
//
//  Created by Loulou on 16/7/26.
//  Copyright © 2016年 QXB. All rights reserved.
//

#import <UIKIt/UIKIt.h>

@interface CustomerButton : UIButton

// 是否选中
@property (nonatomic, getter=isSelect) BOOL select;
// 是否自动切换状态
@property (nonatomic, getter=isAutotoggleEnabled) BOOL autotoggleEnabled;

/**
 *  @author lihui.han, 15-03-17
 *
 *  创建一个根据状态改变背景图片的button
 *
 *  @param selectImage      选中状态图片
 *  @param defaultImage     默认图片
 *  @param highlightedImage 高亮状态下图片
 *
 *  @return button
 */
+ (id)buttonWithSelectImage:(UIImage *)selectImage
               defaultImage:(UIImage *)defaultImage
           highlightedImage:(UIImage *)highlightedImage;

/**
 *  @author lihui.han, 15-03-17
 *
 *  创建一个根据状态改变文本颜色的button
 *
 *  @param selectTitleColor      选中文本颜色
 *  @param defaultTitleColor     默认文本颜色
 *  @param highlightedTitleColor 高亮文本颜色
 *
 *  @return button
 */
+ (id)buttonWithSelectTitleColor:(UIColor *)selectTitleColor
               defaultTitleColor:(UIColor *)defaultTitleColor
           highlightedTitleColor:(UIColor *)highlightedTitleColor;

/**
 *  @author lihui.han, 15-03-17
 *
 *  创建一个根据状态改变背景图片，文本颜色的button
 *
 *  @param selectImage      选中状态图片
 *  @param defaultImage     默认图片
 *  @param selectTitleColor      选中文本颜色
 *  @param defaultTitleColor     默认文本颜色
 *
 *  @return butto
 */
+ (id)buttonWithSelectImage:(UIImage *)selectImage
               defaultImage:(UIImage *)defaultImage
           selectTitleColor:(UIColor *)selectTitleColor
          defaultTitleColor:(UIColor *)defaultTitleColor;

/**
 *  @author lihui.han, 15-03-17
 *
 *  切换状态
 *
 *  @return bool
 */
- (BOOL)switchStatus;
@end
