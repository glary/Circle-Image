//
//  UIImage+water.m
//  shuiyin
//
//  Created by mac on 14-11-15.
//  Copyright (c) 2014年 lanou. All rights reserved.
//

#import "UIImage+water.h"

@implementation UIImage (water)
+(instancetype)addWaterWithBackgroundImageName:(NSString *)BackgroundImageName logoImageName:(NSString *)logoImageName
{
    //添加背景图
    UIImage *bgImage = [UIImage imageNamed:BackgroundImageName];
  
    //创建一个基于 位图的上下文(开启一个基于位图的上下文).
    // size:新图片的大小
    //opaque:如果 yes 不透明 no 透明
    // scale 缩放比例 最好是0.0
    UIGraphicsBeginImageContextWithOptions(bgImage.size, NO, 0.0);
  
    //画背景
    [bgImage drawInRect:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height)];
    
    //画水印
    UIImage * waterImage = [UIImage imageNamed:logoImageName];
    CGFloat scale = 0.2;
    CGFloat margin = 5.0;
    CGFloat waterW = bgImage.size.width * scale;
    CGFloat waterH = bgImage.size.width * scale;
    CGFloat waterX = bgImage.size.width - waterW - margin;
    CGFloat waterY = bgImage.size.height - waterH - margin;
    [waterImage drawInRect:CGRectMake(waterX, waterY, waterW, waterH)];
    
    //从上下文中获取绘制好的图片.
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    //结束上下文
    UIGraphicsEndImageContext();
    return newImage;
}

+ (instancetype)circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
    // 1.加载原图
    UIImage *oldImage = [UIImage imageNamed:name];
    
    // 2.开启上下文
    CGFloat imageW = oldImage.size.width + 2 * borderWidth;
    CGFloat imageH = oldImage.size.height + 2 * borderWidth;
    CGSize imageSize = CGSizeMake(imageW, imageH);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    
    // 3.取得当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 4.画边框(大圆)
    [borderColor set];
    CGFloat bigRadius = imageW * 0.5; // 大圆半径
    CGFloat centerX = bigRadius; // 圆心
    CGFloat centerY = bigRadius;
    CGContextAddArc(ctx, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctx); // 画圆
    
    // 5.小圆
    CGFloat smallRadius = bigRadius - borderWidth;
    CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
    // 裁剪(后面画的东西才会受裁剪的影响)
    CGContextClip(ctx);
    
    // 6.画图
    [oldImage drawInRect:CGRectMake(borderWidth, borderWidth, oldImage.size.width, oldImage.size.height)];
    
    // 7.取图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 8.结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}
/**
 *  添加一个带圆环的圆图.
 */
+ (instancetype)circleImageWithImage:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{

    // 2.开启上下文
    CGFloat imageW = image.size.width + 2 * borderWidth;
    CGFloat imageH = image.size.height + 2 * borderWidth;
    CGSize imageSize = CGSizeMake(imageW, imageH);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    
    // 3.取得当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 4.画边框(大圆)
    [borderColor set];
    CGFloat bigRadius = imageW * 0.5; // 大圆半径
    CGFloat centerX = bigRadius; // 圆心
    CGFloat centerY = bigRadius;
    CGContextAddArc(ctx, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctx); // 画圆
    
    // 5.小圆
    CGFloat smallRadius = bigRadius - borderWidth;
    CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
    // 裁剪(后面画的东西才会受裁剪的影响)
    CGContextClip(ctx);
    
    // 6.画图
    [image drawInRect:CGRectMake(borderWidth, borderWidth, image.size.width, image.size.height)];
    
    // 7.取图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 8.结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;

    
    
}

+(instancetype)circleImageWithName:(NSString *)name
{

    // 1.加载原图
    UIImage *oldImage = [UIImage imageNamed:name];
    
    // 2.开启上下文
    UIGraphicsBeginImageContextWithOptions(oldImage.size, NO, 0.0);
    
    // 3.取得当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 4.画圆
    CGRect circleRect = CGRectMake(0, 0, oldImage.size.width, oldImage.size.height);
    CGContextAddEllipseInRect(ctx, circleRect);
    
    // 5.按照当前的路径形状(圆形)裁剪, 超出这个形状以外的内容都不显示
    CGContextClip(ctx);
    
    // 6.画图
    [oldImage drawInRect:circleRect];
    
    // 7.取图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 8.结束
    UIGraphicsEndImageContext();
    
    //返回新图
    return newImage;



}


@end
