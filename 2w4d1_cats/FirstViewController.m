//
//  FirstViewController.m
//  2w4d1_cats
//
//  Created by Seantastic31 on 17/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "FirstViewController.h"
#import "Cats.h"
#import "CatCollectionViewCell.h"
#import "DetailViewController.h"
#import "Key.h"
#import "FlickrAPI.h"

@interface FirstViewController ()<UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray <Cats*>*cats;


@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.dataSource = self;
    
    [FlickrAPI getData:^(NSMutableArray *resultsArray) {
        NSLog(@"Flickr data: %@", resultsArray);
        self.cats = [NSArray arrayWithArray:resultsArray];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.collectionView reloadData];
        }];
    }];
}

#pragma mark - Data source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.cats.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CatCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    Cats *cat = self.cats [indexPath.row];
    cell.label.text = cat.imageTitle;
    
    // ***** convert url into image *****
    NSData *data = [NSData dataWithContentsOfURL:cat.url];
    UIImage *image = [UIImage imageWithData:data];
    cell.imageView.image = image;
    return cell;
}

#pragma mark - Prepare for Segueway

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"DetailViewController"])
    {
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:sender];
        Cats *cat = self.cats[indexPath.row];
        DetailViewController *dvc = segue.destinationViewController;
        dvc.cat = cat;
    }
}

@end
