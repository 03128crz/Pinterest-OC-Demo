//
//  Photos.m
//  Pinterest-OC
//
//  Created by james on 16/7/1.
//  Copyright © 2016年 kfvnx. All rights reserved.
//

#import "Photo.h"


@interface Photo ()

@end

@implementation Photo

- (instancetype)init:(NSDictionary *)dictionary {
    
    if (self = [super init]) {
        _caption = dictionary[@"Caption"];
        _comment = dictionary[@"Comment"];
        NSString *photo = dictionary[@"Photo"];
        _image = [self decompressedImage: [UIImage imageNamed:photo]] ;
    }
    
    return self;
}

+ (NSArray *)allPhotos {
    NSMutableArray *photos = [NSMutableArray arrayWithCapacity:10];
    
   NSURL *url =  [[NSBundle mainBundle] URLForResource:@"Photos" withExtension:@"plist"];
   
    [[NSArray arrayWithContentsOfURL:url] enumerateObjectsUsingBlock:^(NSDictionary  *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Photo *photo = [[Photo alloc] init:obj];
        [photos addObject:photo];
    }];
    
    return photos;
}

- (CGFloat)heightForComment:(UIFont *)font width:(CGFloat)width {
    CGRect rect =   [_comment boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:nil];
    
    return ceil(rect.size.height);
}

- (UIImage *)decompressedImage:(UIImage *)image {
    UIGraphicsBeginImageContextWithOptions(image.size, true, 0);
    [image drawAtPoint:CGPointZero];
    UIImage *decompressedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return decompressedImage;
}

@end
