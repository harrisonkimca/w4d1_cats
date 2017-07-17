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

@interface FirstViewController ()<UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray <Cats*>*cats;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.dataSource = self;
    
    [self createData];
}

- (void)createData
{
    Cats *cat1 = [[Cats alloc]initWithTitle:@"Chicago" andPhoto:[UIImage imageNamed:@"chicago"]];
    
    self.cats = @[cat1];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    cell.imageView.image = cat.photo;
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
