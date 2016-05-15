//
//  ViewController.m
//  SDDouYu
//
//  Created by shendong on 16/5/12.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "ViewController.h"
#import "SDMultipleCornerView.h"
#import "SDMultipleCollectionView.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    SDCornerView *corner = [[SDCornerView alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    [corner setLocalImage:[UIImage imageNamed:@"douyu"] text:@"shedn"];
//    [self.view addSubview:corner];

    SDMultipleCollectionView *collection = [[SDMultipleCollectionView alloc] initWithFrame:CGRectMake(0, 0, 375, 100)];
    [self.view addSubview:collection];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
