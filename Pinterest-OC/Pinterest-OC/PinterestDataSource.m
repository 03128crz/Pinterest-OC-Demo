//
//  PinterestDataSource.m
//  Pinterest-OC
//
//  Created by james on 16/7/1.
//  Copyright © 2016年 kfvnx. All rights reserved.
//

#import "PinterestDataSource.h"
#import "AnnotatedPhotoCell.h"
#import "Photo.h"
#import <AVFoundation/AVFoundation.h>

@interface PinterestDataSource ()
@property (nonatomic, strong) NSArray *photos;
@end

@implementation PinterestDataSource

- (void)awakeFromNib {
        _photos = [Photo allPhotos];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _photos.count ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    AnnotatedPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([AnnotatedPhotoCell class]) forIndexPath:indexPath];
    cell.photo = _photos[indexPath.item];
    
    return cell;
}

#pragma mark - PinterestLayoutDelegate
- (CGFloat)collectionView:(UICollectionView *)collectionView heightForPhotoAtIndexPath:(NSIndexPath *)indexPath width:(CGFloat)width {
    Photo *photo = _photos[indexPath.item];
    CGRect boundingRect = CGRectMake(0, 0, width, CGFLOAT_MAX);
    CGRect rect = AVMakeRectWithAspectRatioInsideRect(photo.image.size, boundingRect);
    return rect.size.height;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView heightForAnnotationAtIndexPath:(NSIndexPath *)indexPath width:(CGFloat)width {
    CGFloat annotationPadding = 4.0;
    CGFloat annotationHeaderHeight = 12.0;
    Photo *photo = _photos[indexPath.item];
    UIFont *font = [UIFont systemFontOfSize:10];
    CGFloat commentHeight = [photo heightForComment:font width:width];
    
    return annotationPadding + annotationHeaderHeight + commentHeight + annotationPadding;
}

@end
