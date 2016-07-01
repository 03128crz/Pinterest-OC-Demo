//
//  Photos.h
//  Pinterest-OC
//
//  Created by james on 16/7/1.
//  Copyright © 2016年 kfvnx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Photo : NSObject

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, copy) NSString *caption;
@property (nonatomic, copy) NSString *comment;

+ (NSArray *)allPhotos;
- (CGFloat)heightForComment:(UIFont *)font width:(CGFloat)width;

@end
