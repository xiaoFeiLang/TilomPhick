//
//  CustomerButton.m
//  TilomPhick
//
//  Created by Loulou on 16/7/26.
//  Copyright © 2016年 QXB. All rights reserved.
//

#import "CustomerButton.h"

@implementation CustomerButton

//+ (id)buttonWithSelectImage:(UIImage *)selectImage
//               defaultImage:(UIImage *)defaultImage
//           highlightedImage:(UIImage *)highlightedImage {
//
//    CustomerButton *button = [self buttonWithType:UIButtonTypeCustom];
//    button.selectImage = selectImage;
//    button.defaultImage = defaultImage;
//    [button setBackgroundImage:defaultImage forState:UIControlStateNormal];
//    [button setBackgroundImage:highlightedImage
//                      forState:UIControlStateHighlighted];
//    button.autotoggleEnabled = YES;
//    return button;
//}
//
//- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
//    [super endTrackingWithTouch:touch withEvent:event];
//    if (self.touchInside && self.autotoggleEnabled) {
//        [self switchStatus];
//    }
//}
//
//- (BOOL)switchStatus {
//    self.select = !self.select;
//    return self.select;
//}
//- (void)setSelect:(BOOL)selectBool {
//    if (_select != selectBool) {
//        _select = selectBool;
//        [self setBackgroundImage:(_select ? self.selectImage : self.defaultImage)
//                        forState:UIControlStateNormal];
//        [self setTitleColor:(_select ? self.selectTitleColor : self.defaultTitleColor)
//                   forState:UIControlStateNormal];
//    }
//}
//
//- (void)awakeFromNib {
//    self.autotoggleEnabled = YES;
//    self.selectImage = [self backgroundImageForState:UIControlStateSelected];
//    self.defaultImage = [self backgroundImageForState:UIControlStateNormal];
//    [self setBackgroundImage:nil forState:UIControlStateSelected];
//    
//    self.selectTitleColor = [self titleColorForState:UIControlStateSelected];
//    self.defaultTitleColor = [self titleColorForState:UIControlStateNormal];
//    [self setTitleColor:nil forState:UIControlStateSelected];
//}
//
- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    CGRect size =self.frame;
    
    //title
    
    CGRect titleOrigin=self.titleLabel.frame;
    
    //image
    
    CGRect imageOrigin=self.imageView.frame;
    
    imageOrigin.origin.y=size.size.height/2- (self.imageView.frame.size.height/2+self.titleLabel.frame.size.height/2+8/2);
    
    titleOrigin.origin.y=imageOrigin.origin.y+self.imageView.frame.size.height+8;
    
    imageOrigin.origin.x=size.size.width/2-self.imageView.frame.size.width/2;
    
    titleOrigin.origin.x=size.size.width/2-self.titleLabel.frame.size.width/2;
    
    self.titleLabel.frame= titleOrigin;
    
    self.imageView.frame= imageOrigin;
    
}

@end
