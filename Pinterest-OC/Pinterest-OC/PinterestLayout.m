//
//  PinterestLayout.m
//  Pinterest-OC
//
//  Created by james on 16/7/1.
//  Copyright © 2016年 kfvnx. All rights reserved.
//

#import "PinterestLayout.h"
#import "PinterestLayoutAttributes.h"

@interface PinterestLayout ()
@property (nonatomic, assign) int numberOfColumns;
@property (nonatomic, assign) CGFloat cellPadding;
@property (nonatomic, assign) CGFloat contentHeight;
@property (nonatomic, assign) CGFloat contentWidth;
@property (nonatomic, strong) NSMutableArray *cache;
@end

@implementation PinterestLayout

-(void)awakeFromNib {
    _numberOfColumns = 2;
    _cellPadding = 6.0;
    self.collectionView.contentInset = UIEdgeInsetsMake(23, 5, 10, 5);

    _cache = [NSMutableArray arrayWithCapacity:20];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
    }
    
    return self;
}


+ (Class)layoutAttributesClass {
    return [PinterestLayoutAttributes class];
}

-(void)prepareLayout {
    if ([_cache count] != 0) {
        return;
    }
    
    CGFloat columnWidth = self.contentWidth / _numberOfColumns;
    NSMutableArray *xOffset = [NSMutableArray arrayWithCapacity:20];
    
    for (int column = 0; column < _numberOfColumns; column ++) {
        [xOffset addObject: [NSNumber numberWithFloat:(column * columnWidth)]];
    }
    
    int column = 0 ;
    
    NSMutableArray *yOffset = [NSMutableArray arrayWithCapacity:10 ];
    for (int i = 0; i < _numberOfColumns; i++) {
        yOffset[i] = [NSNumber numberWithFloat:0.0];
    }
    
    for (int item = 0; item < [self.collectionView numberOfItemsInSection:0]; item ++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:0];
        CGFloat width = columnWidth - _cellPadding * 2;
        
        CGFloat photoHeight = [_delegate collectionView:self.collectionView heightForPhotoAtIndexPath:indexPath width:width];
        CGFloat annotationHeight = [_delegate collectionView:self.collectionView heightForAnnotationAtIndexPath:indexPath width:width];
        CGFloat height = _cellPadding + photoHeight + annotationHeight + _cellPadding;
        CGRect frame = CGRectMake([xOffset[column] floatValue], [yOffset[column] floatValue], columnWidth, height);
        CGRect insetFrame = CGRectInset(frame, _cellPadding, _cellPadding);
        
        PinterestLayoutAttributes *attributes = [PinterestLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attributes.photoHeight = photoHeight ;
        attributes.frame = insetFrame;
        [_cache addObject:attributes];
        
        _contentHeight = MAX(_contentHeight, CGRectGetMaxY(frame));
        yOffset[column] = [NSNumber numberWithFloat:[yOffset[column] floatValue] + height];
        if (column >= _numberOfColumns - 1) {
            column = 0 ;
        } else {
            column = column + 1;
        }
    }
    
}

-(CGSize)collectionViewContentSize {
    return CGSizeMake(self.contentWidth, _contentHeight);
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSMutableArray *layoutAttributes = [NSMutableArray arrayWithCapacity:10];
    
    for (UICollectionViewLayoutAttributes *attribute in _cache) {
        if (CGRectIntersectsRect(attribute.frame, rect)) {
            [layoutAttributes addObject:attribute];
        }
    }
    
    return layoutAttributes;
}

-(CGFloat)contentWidth {
    UIEdgeInsets insets =  self.collectionView.contentInset;
    return  CGRectGetWidth(self.collectionView.bounds) - insets.left - insets.right;

}

@end
