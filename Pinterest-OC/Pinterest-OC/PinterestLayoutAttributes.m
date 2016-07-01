//
//  PinterestLayoutAttributes.m
//  Pinterest-OC
//
//  Created by james on 16/7/1.
//  Copyright © 2016年 kfvnx. All rights reserved.
//

#import "PinterestLayoutAttributes.h"

@implementation PinterestLayoutAttributes

-(id)copyWithZone:(NSZone *)zone {
    PinterestLayoutAttributes *copy = (PinterestLayoutAttributes *)[super copyWithZone:zone];
    copy.photoHeight = _photoHeight;
    return copy;
}

-(BOOL)isEqual:(id)object {
    PinterestLayoutAttributes *attributes = (PinterestLayoutAttributes *)object;
    if (attributes.photoHeight == _photoHeight) {
        return [super isEqual:object];
    }
    
    return false;
}

@end
