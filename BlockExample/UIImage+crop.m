//
//  UIImage+crop.m
//  BlockExample
//
//  Created by Felipe Carrera on 09/06/14.
//  Copyright (c) 2014 Juan Felipe Carrera Moya. All rights reserved.
//

#import "UIImage+crop.h"

@implementation UIImage (crop)


- (UIImage *)crop:(CGRect)rect
{
    
    rect = CGRectMake(rect.origin.x*self.scale,
                      rect.origin.y*self.scale,
                      rect.size.width*self.scale,
                      rect.size.height*self.scale);
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], rect);
    UIImage *result = [UIImage imageWithCGImage:imageRef
                                          scale:self.scale
                                    orientation:self.imageOrientation];
    CGImageRelease(imageRef);
    return result;
}

@end
