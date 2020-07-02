//
//  ViewController.m
//  SJCoreGraphic
//
//  Created by Katherine on 2020/7/2.
//  Copyright © 2020 JiuwenDragon. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    MyView *mys = [[MyView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:mys];
    
    
    
}




@end
