//
//  NSC_HZRemoteControlView.m
//  smartsite
//
//  Created by 何泽的mac on 2020/5/9.
//  Copyright © 2020 何泽的mac. All rights reserved.
//

#import "NSC_HZRemoteControlView.h"
#import <QMUIKit/QMUIKit.h>
#define kRGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define kWidth self.frame.size.width
#define kHeight self.frame.size.height
@interface NSC_HZRemoteControlView()

@end

@implementation NSC_HZRemoteControlView
-(UIButton *)OKButton{
    if (!_OKButton) {
        _OKButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _OKButton.frame = CGRectMake(kWidth / 4, kWidth/4, kWidth / 2, kWidth / 2);
        [_OKButton setTitle:@"OK" forState:UIControlStateNormal];
        [_OKButton setTitleColor:kRGB(51, 51, 51) forState:UIControlStateNormal];
        _OKButton.titleLabel.font = [UIFont systemFontOfSize:20];
        _OKButton.layer.cornerRadius = kWidth / 2 /2;
        _OKButton.layer.masksToBounds = YES;
        _OKButton.backgroundColor = kRGB(186, 202, 252);
    }
    return _OKButton;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *imageArray = @[@"nsc_hz_arrow_up",@"nsc_hz_arrow_right_up",@"nsc_hz_arrow_right",@"nsc_hz_arrow_right_down",@"nsc_hz_arrow_down",@"nsc_hz_arrow_left_down",@"nsc_hz_arrow_left",@"nsc_hz_arrow_left_up"];
        for (int i = 0; i < imageArray.count; i++) {
            [self initWithFrame:frame startAngle:degreesToRadians(-112.5 + (i * 45)) endAngle:degreesToRadians(-67.5 + (i * 45))];
            [self calcCircleCoordinateWithAngle:90 - (i * 45) andWithRadius:self.frame.size.width/2 - kWidth / 6 + 25/2 andImage:imageArray[i]];
        }
        [self addSubview:self.OKButton];
        [_OKButton addTarget:self action:@selector(okButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

#pragma --mark 点击OK按钮的方法
-(void)okButtonAction:(UIButton *)sender{
    
}

-(void)initWithFrame:(CGRect)frame startAngle:(CGFloat)start endAngle:(CGFloat)end{
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    //画圆弧 逆时针半圈
    [bezierPath addArcWithCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:self.frame.size.width/2 startAngle:start endAngle:end clockwise:YES];
    [bezierPath addLineToPoint:CGPointMake(self.frame.size.width/2, self.frame.size.height/2)];
    [bezierPath closePath];
    [bezierPath setLineWidth:1];
    // 描边和填充
    [bezierPath stroke];
    [bezierPath fill];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = self.bounds;
    layer.path = bezierPath.CGPath;
    layer.strokeColor = [UIColor whiteColor].CGColor;
    layer.fillColor = [UIColor colorWithRed:82/255.0 green:123/255.0 blue:249/255.0 alpha:1].CGColor;
    [self.layer addSublayer:layer];
}

#pragma mark 计算圆圈上点在IOS系统中的坐标
-(void) calcCircleCoordinateWithAngle : (CGFloat) angle andWithRadius: (CGFloat) radius andImage:(NSString *)image{
    CGPoint center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    CGFloat x2 = radius*cosf(angle*M_PI/180);
    CGFloat y2 = radius*sinf(angle*M_PI/180);
    CGPoint point = CGPointMake(center.x+x2, center.y-y2);
    UIImageView *imageView =   [[UIImageView alloc]initWithFrame:CGRectMake(point.x - 25 / 2, point.y - 25/2, 25, 25)];
    imageView.image = [UIImage imageNamed:image];
    [self addSubview:imageView];
}

@end
