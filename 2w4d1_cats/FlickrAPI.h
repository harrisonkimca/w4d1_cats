//
//  FlickrAPI.h
//  2w4d1_cats
//
//  Created by Seantastic31 on 17/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cats.h"
#import "CatCollectionViewCell.h"

@interface FlickrAPI : NSObject

+ (void)getData:(void (^)(NSMutableArray *tmpArray))complete;

@end
