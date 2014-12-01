//
//  RootViewController.m
//  Circle Image
//
//  Created by lanou on 14-12-1.
//  Copyright (c) 2014年 JS. All rights reserved.
//

#import "RootViewController.h"
#import "UIImage+water.h"
@interface RootViewController ()

@end

@implementation RootViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
   
    UIImageView * imageView = [[UIImageView alloc]init];
    [imageView setFrame:CGRectMake(100, 100, 100, 100)];
    /**
     *  创建一个带环的图片
     *
     *  @param Name 图片的名字
     *  @param borderWidth   环的宽度
     *  @param borderColor   环的颜色
     */
    UIImage * image = [UIImage circleImageWithName:@"icon.png" borderWidth:5 borderColor:[UIColor whiteColor]];
    imageView.image = image;
    [self.view addSubview:imageView];
    
    
    
}



@end
