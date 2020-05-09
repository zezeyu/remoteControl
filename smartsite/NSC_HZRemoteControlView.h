//
//  NSC_HZRemoteControlView.h
//  smartsite
//
//  Created by 何泽的mac on 2020/5/9.
//  Copyright © 2020 何泽的mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#define degreesToRadians(x) (M_PI*(x)/180.0) //把角度转换成PI的方式
NS_ASSUME_NONNULL_BEGIN

@interface NSC_HZRemoteControlView : UIView

@property(nonatomic,strong)UIButton *OKButton;

@end

NS_ASSUME_NONNULL_END
