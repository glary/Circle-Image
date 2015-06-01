//
//  UIImage+water.h
//  shuiyin
//
//  Created by mac on 14-11-15.
//  Copyright (c) 2014年 glary. All rights reserved.
//  

#import <UIKit/UIKit.h>

@interface UIImage (water)
/**
 *  创建一个带水印的图片
 *
 *  @param BackgroundImageName 背景图的名字
 *  @param logoImageName       水印的名字
 *
 */
+ (instancetype)addWaterWithBackgroundImageName:(NSString *)BackgroundImageName logoImageName:(NSString *)logoImageName;
/**
 *  添加一个带圆环的圆图.
 */
+ (instancetype)circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
/**
 *  添加一个不带圆环的图.
 */
+ (instancetype)circleImageWithName:(NSString *)name;

/**
 *  添加一个带圆环的圆图.
 */
+ (instancetype)circleImageWithImage:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
@end
