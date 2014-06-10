//
//  UIImage+fromURL.m
//  BlockExample
//
//  Created by Felipe Carrera on 09/06/14.
//  Copyright (c) 2014 Juan Felipe Carrera Moya. All rights reserved.
//

#import "UIImage+fromURL.h"

@implementation UIImage (fromURL)


+(void) loadImageFromURL:(NSString *) url onCompletion:(void (^)(UIImage *image)) block
{
    NSLog(@"%@",url);
    NSLog(@"init method");
    __block UIImage *imageLoaded;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        
        imageLoaded = [UIImage imageWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            
            block(imageLoaded);
            
        });
    });
}


@end
