//
//  ViewController.m
//  smartsite
//
//  Created by 何泽的mac on 2020/5/9.
//  Copyright © 2020 何泽的mac. All rights reserved.
//

#import "ViewController.h"
#import "NSC_HZRemoteControlView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSC_HZRemoteControlView *remoteView = [[NSC_HZRemoteControlView alloc]initWithFrame:CGRectMake(50, 100, 200, 200)];
    remoteView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:remoteView];
}


@end
