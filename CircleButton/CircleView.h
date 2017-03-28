//
//  CircleView.h
//  NewProtocal
//
//  Created by zhaoxiafei on 17/3/16.
//  Copyright © 2017年 xigu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleView : UIView
-(instancetype)initWithFrame:(CGRect)frame startAngel:(CGFloat)startAngel endAngel:(CGFloat)endAngel bigRadius:(CGFloat )bigRadius smallRadius:(CGFloat)smallRadius;
-(void)setCircleColor:(UIColor *)fillColor;

@property(nonatomic,strong)UIImageView *imageView;


@property(nonatomic,copy)void(^handleTap)(NSInteger tag);

@end
