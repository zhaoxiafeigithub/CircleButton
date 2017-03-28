//
//  BlackBgView.h
//  NewProtocal
//
//  Created by zhaoxiafei on 17/3/17.
//  Copyright © 2017年 xigu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlackBgView : UIView
@property(nonatomic,copy)void(^handleCircleView)(NSInteger viewTag1,NSInteger viewTag2);

@end
