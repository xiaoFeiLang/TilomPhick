//
//  HZYListTabBar.h
//  HZYListTabBarDemo
//
//  Created by MS on 16-3-11.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HZYListTabBar;
@protocol HZYListTabBarDelegate <NSObject>

@optional
/**
 *  tabBar选中当前item的代理方法
 */
- (void)listTabBar:(HZYListTabBar *)listTabBar didSelectedItemIndex:(NSInteger)index;
/**
 *  点击tabBar上的箭头按钮的代理方法
 */
- (void)listTabBarDidClickedArrowButton:(HZYListTabBar *)listTabBar;

@end

@interface HZYListTabBar : UIView


@property (nonatomic, weak) id <HZYListTabBarDelegate>delegate;

/**
 *  tabBar当前选中的item的索引
 */
@property (nonatomic, assign) NSInteger currentItemIndex;

/**
 *  tabBar上所有要显示的item标题
 */
@property (nonatomic, strong) NSArray *itemsTitle;



@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com