//
//  CatViewController.m
//  iOS-Sample
//
//  Created by macRong on 2018/5/7.
//  Copyright © 2018年 macRong. All rights reserved.
//

#import "CatViewController.h"
#import "Cat.h"
#import <objc/runtime.h>

@interface CatViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CatViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    Cat *cat = [Cat new];
    cat.name = @"sd";
    [cat eat];
    NSLog(@"====== 走了吗");
    
    cat.name = @"lastname";
    NSLog(@"======cat.name=%@",cat.name);
}


@end
