//
//  Cats.m
//  2w4d1_cats
//
//  Created by Seantastic31 on 17/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "Cats.h"

@implementation Cats

- (instancetype)initWithTitle:(NSString *)title andPhoto:(UIImage *)photo
{
    self = [super init];
    if (self) {
        _imageTitle = title;
        _photo = photo;
    }
    return self;
}

@end
