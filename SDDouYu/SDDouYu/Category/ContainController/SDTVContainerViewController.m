
//
//  SDTVContainerViewController.m
//  SDDouYu
//
//  Created by shendong on 16/5/16.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDTVContainerViewController.h"
#import "SDTVNavigationView.h"

static NSString *const kcellIdentifier = @"kcellIdentifier";

@interface SDTVContainerViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray *viewControllers;
@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowlayout;
@property (nonatomic, strong) SDTVNavigationView *navigaitonView;

@end

@implementation SDTVContainerViewController
+ (instancetype)TVContainterViewControllers:(NSArray<UIViewController *> *)childs parentController:(UIViewController *)controller{
    SDTVContainerViewController *containter = [[self alloc] init];
    [containter setViewControllers:childs];
    [containter setParentController:controller];
    
    __block NSMutableArray *array = [NSMutableArray arrayWithCapacity:childs.count];
    [childs enumerateObjectsUsingBlock:^(UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [containter addChildViewController:obj];
        [array addObject:obj.title ? : @""];
    }];
    [containter navigaitonView].items = array.copy;
    [containter navigaitonView].selectedItemIndex = 0;
    return containter;
}
- (instancetype)init{
    if (self = [super init]) {
        UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
        _flowlayout = flowlayout;
        flowlayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowlayout.minimumInteritemSpacing = 0;
        flowlayout.minimumLineSpacing = 0;
        
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowlayout];
        _collectionView = collectionView;
        collectionView.pagingEnabled = YES;
        [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kcellIdentifier];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.backgroundColor = [UIColor whiteColor];
//        collectionView.showsHorizontalScrollIndicator = NO;
        [self.view addSubview:collectionView];
        __weak typeof(self)weakself = self;
        SDTVNavigationView *navView =[SDTVNavigationView TVNavigationViewWithItems:nil itemSelected:^(NSInteger selectedIndex) {
            [weakself setSelectedIndex:selectedIndex];
        }];
        navView.itemWidth = SCREEN_WIDTH/4;
        navView.itemMargin = 0;
        [self setNavigaitonView:navView];
        [self.view addSubview:navView];
        
    }
    return self;
}
- (void)setParentController:(UIViewController *)parentController{
    _parentController = parentController;
    [parentController addChildViewController:self];
    [parentController.view addSubview:self.view];
}
- (void)setSelectedIndex:(NSInteger)selectedIndex{
    _selectedIndex                    = selectedIndex;
    CGFloat offsetX                   = self.view.bounds.size.width * selectedIndex;
    self.collectionView.contentOffset = CGPointMake(offsetX, 0);
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    CGFloat topNav = 64;
    CGFloat bottomTab = 49;
    if (self.navigationController) {
        self.navigaitonView.frame = CGRectMake(0, topNav, width, SDTVNavigationViewItemHeight);
        self.collectionView.frame = CGRectMake(0, topNav+SDTVNavigationViewItemHeight, width, height-SDTVNavigationViewItemHeight-topNav-bottomTab);
    }else{
        self.navigaitonView.frame = CGRectMake(0, 0, width, SDTVNavigationViewItemHeight);
    }
    self.flowlayout.itemSize = self.collectionView.bounds.size;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.collectionView.scrollsToTop          = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.viewControllers.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kcellIdentifier forIndexPath:indexPath];
    UIView *view = [self.viewControllers[indexPath.item] view];
    [cell.contentView addSubview:view];
    view.frame = cell.bounds;
    return cell;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x / self.view.bounds.size.width;
    self.navigaitonView.selectedItemIndex = index;
}
@end
