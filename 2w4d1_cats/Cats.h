//
//  Cats.h
//  2w4d1_cats
//
//  Created by Seantastic31 on 17/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

@import UIKit;

@interface Cats : NSObject

@property (strong, nonatomic) NSString *imageTitle;
@property (strong, nonatomic) UIImage *photo;
@property (strong, nonatomic) NSURL *url;

- (instancetype)initWithTitle:(NSString*)title andPhoto:(UIImage*)photo;

@end
