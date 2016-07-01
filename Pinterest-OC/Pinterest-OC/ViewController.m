//
//  ViewController.m
//  Pinterest-OC
//
//  Created by james on 16/7/1.
//  Copyright © 2016年 kfvnx. All rights reserved.
//

#import "ViewController.h"
#import "PinterestDataSource.h"
#import "PinterestLayout.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImage *image = [UIImage imageNamed:@"Pattern"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    PinterestLayout *layout =  (PinterestLayout *)_collectionView.collectionViewLayout ;
    PinterestDataSource *dataSource = (PinterestDataSource *)_collectionView.dataSource;
    
    layout.delegate = dataSource;
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
