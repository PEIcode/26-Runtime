//
//  ViewController.m
//  26-Runtime
//
//  Created by sunny&pei on 2018/5/30.
//  Copyright © 2018年 sunny&pei. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "Person.h"
#import "Person+tope.h"
@interface ViewController ()
@end  

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Person *p = [[Person alloc]init];
    p.age = 19;
    p.name = @"lpz";
    NSLog(@"p=%@",p);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
