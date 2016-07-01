//
//  AnnotatedPhotoCell.m
//  Pinterest-OC
//
//  Created by james on 16/7/1.
//  Copyright © 2016年 kfvnx. All rights reserved.
//

#import "AnnotatedPhotoCell.h"
#import "PinterestLayoutAttributes.h"

@interface AnnotatedPhotoCell ()
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewHeightConstraint;

@end

@implementation AnnotatedPhotoCell

-(void)awakeFromNib {
    self.layer.cornerRadius = 5.0;
    self.layer.masksToBounds = YES;
}

-(void)setPhoto:(Photo *)photo {
 
    _photo = photo;
    _captionLabel.text = photo.caption;
    _commentLabel.text = photo.comment;
    _imageView.image = photo.image;
}

-(void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [super applyLayoutAttributes:layoutAttributes];
    PinterestLayoutAttributes *attributes = (PinterestLayoutAttributes *)layoutAttributes;
    _imageViewHeightConstraint.constant = attributes.photoHeight;
}

@end
