//
//  CircleView.m
//  NewProtocal
//
//  Created by zhaoxiafei on 17/3/16.
//  Copyright © 2017年 xigu. All rights reserved.
//

#import "CircleView.h"
#define ImageViewWidth 30
@interface CircleView ()
@property(nonatomic,assign)CGFloat startAngel,endAngel,bigRadius,smallRadius;
@property(nonatomic,strong)UIColor *fillColor;
@end
@implementation CircleView

-(instancetype)initWithFrame:(CGRect)frame startAngel:(CGFloat)startAngel endAngel:(CGFloat)endAngel bigRadius:(CGFloat)bigRadius smallRadius:(CGFloat)smallRadius
{
    self = [super initWithFrame:frame];
    if (self) {
        self.fillColor = [UIColor whiteColor];
        self.startAngel = startAngel;
        self.endAngel = endAngel;
        self.bigRadius = bigRadius;
        self.smallRadius = smallRadius;
        [self addSubview:self.imageView];
    }
    return self;
}
-(UIImageView *)imageView
{
    if (!_imageView) {
        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,ImageViewWidth , ImageViewWidth)];
        CGPoint point = self.center;
        CGFloat rValue = (self.bigRadius - self.smallRadius) / 2 + self.smallRadius;
        CGFloat radian = (self.endAngel + self.startAngel) / 2;
        _imageView.center = CGPointMake(point.x + rValue * cosf(radian), point.y + rValue * sinf(radian));
       // _imageView.backgroundColor = [UIColor blackColor];
       // _imageView.userInteractionEnabled = YES;
        _imageView.image = [UIImage imageNamed:@"向上"];
        
    }
    return _imageView;
}
-(void)setCircleColor:(UIColor *)fillColor
{
    self.fillColor = fillColor;
    [self setNeedsDisplay];
}
-(void)drawRect:(CGRect)rect
{
    CGPoint center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1);
    CGContextSetFillColorWithColor(context, self.fillColor.CGColor);
    CGContextAddArc(context, self.frame.size.width / 2, self.frame.size.height / 2, self.bigRadius, self.startAngel, self.endAngel, 0);
    CGContextAddLineToPoint(context, self.smallRadius * cosf(self.endAngel) + center.x, center.y + self.smallRadius * sinf(self.endAngel));
    CGContextAddArc(context, self.frame.size.width / 2, self.frame.size.height / 2, self.smallRadius, self.endAngel, self.startAngel, 1);
    CGContextAddLineToPoint(context, center.x + self.bigRadius * cosf(self.startAngel), center.y + self.bigRadius * sinf(self.startAngel));
    CGContextDrawPath(context, kCGPathFillStroke);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
