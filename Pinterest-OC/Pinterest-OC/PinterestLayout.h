//
//  PinterestLayout.h
//  Pinterest-OC
//
//  Created by james on 16/7/1.
//  Copyright © 2016年 kfvnx. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PinterestLayoutDelegate <NSObject>

- (CGFloat)collectionView:(UICollectionView *)collectionView heightForPhotoAtIndexPath:(NSIndexPath *)indexPath width:(CGFloat)width;

- (CGFloat)collectionView:(UICollectionView *)collectionView heightForAnnotationAtIndexPath:(NSIndexPath *)indexPath width:(CGFloat)width;

@end

@interface PinterestLayout : UICollectionViewLayout

@property (nonatomic, strong) id<PinterestLayoutDelegate> delegate;

@end
