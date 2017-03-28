

//
//  BlackBgView.m
//  NewProtocal
//
//  Created by zhaoxiafei on 17/3/17.
//  Copyright © 2017年 xigu. All rights reserved.
//

#import "BlackBgView.h"
#import "CircleView.h"

@interface BlackBgView ()

@property(nonatomic,assign)NSInteger preciousTag;
@end

@implementation BlackBgView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGRect rect = CGRectMake(0, 0, 300, 300);
        CircleView *circleView1 = [[CircleView alloc]initWithFrame:rect startAngel:- 0.75 * M_PI endAngel:-0.25 * M_PI bigRadius:150 smallRadius:70];
        circleView1.backgroundColor = [UIColor clearColor];
        [self addSubview:circleView1];
        CircleView *circleView2 = [[CircleView alloc]initWithFrame:rect startAngel:- 0.25 * M_PI endAngel:0.25 * M_PI bigRadius:150 smallRadius:70];
        circleView2.backgroundColor = [UIColor clearColor];
        [self addSubview:circleView2];
        CircleView *circleView3 = [[CircleView alloc]initWithFrame:rect startAngel:0.25 * M_PI endAngel:0.75 * M_PI bigRadius:150 smallRadius:70];
        circleView3.backgroundColor = [UIColor clearColor];
        [self addSubview:circleView3];
        CircleView *circleView4 = [[CircleView alloc]initWithFrame:rect startAngel:0.75 * M_PI endAngel:1.25 * M_PI bigRadius:150 smallRadius:70];
        circleView4.backgroundColor = [UIColor clearColor];
        [self addSubview:circleView4];
        circleView1.tag = 101;
        circleView2.tag = 102;
        circleView3.tag = 103;
        circleView4.tag = 104;
    }
    return self;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    CGPoint point = [touches.allObjects.firstObject locationInView:self];
    NSInteger preciousTag = self.preciousTag;
    NSInteger currentTag = 0;
   // NSLog(@"%@--%ld",NSStringFromCGPoint(point),self.subviews.count);
    for (CircleView *view in self.subviews) {
       CGFloat Rvalue = [self getColorWithView:view location:point];
        if (Rvalue > 0) {
            currentTag = view.tag;
            self.preciousTag = currentTag;
        }
    }
    if (currentTag > 100) {
        self.handleCircleView(preciousTag,currentTag);
    }
}
//获取颜色
-(CGFloat)getColorWithView:(UIView *)view location:(CGPoint)point
{
    unsigned char pixel[4] = {0};
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(pixel, 1, 1, 8, 4, colorSpace, (CGBitmapInfo)kCGImageAlphaPremultipliedLast);
    CGContextTranslateCTM(context, -point.x, -point.y);
    [view.layer renderInContext:context];
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    return (CGFloat)(pixel[0] / 255.0);
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
