//
//  GCDViewController.h
//  iOS-Sample
//
//  Created by 荣守振 on 2018/4/15.
//  Copyright © 2018年 macRong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef int(^Blk)(int);

@interface GCDViewController : UIViewController

@property (nonatomic, copy) Blk blk;
@property (nonatomic,assign) int age;

@end
