//
//  JCViewController.m
//  BlockExample
//
//  Created by Felipe Carrera on 09/06/14.
//  Copyright (c) 2014 Juan Felipe Carrera Moya. All rights reserved.
//

#import "JCViewController.h"
#import "UIImage+fromURL.h"
#import "UIImage+crop.h"

@interface JCViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageFromURL;
@end

@implementation JCViewController

@synthesize imageFromURL = _imageFromURL;

- (void)viewDidLoad
{
    [super viewDidLoad];

    [UIImage loadImageFromURL:@"http://surfvideos.cl/wp-content/uploads/2014/03/133643b190934dba95ea31d0ec33bec1JH59XM1.jpg" onCompletion:^(UIImage *image)
    {
        NSLog(@"aloo");
        _imageFromURL.image = image;
        
        UIImage *imageToCrop = image;
        CGRect cropRect = CGRectMake(0, 0, 1500, 1300);
        
        UIImage *croppedImage = [imageToCrop crop:cropRect];
        _imageFromURL.image = croppedImage;
        /*
    
        CGImageRef imageRef = CGImageCreateWithImageInRect(image.CGImage, CGRectMake(0, 0, 1500, 500));
        UIImage *result = [UIImage imageWithCGImage:imageRef];
        CGImageRelease(imageRef);
        _imageFromURL.image = result;*/
    }];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
