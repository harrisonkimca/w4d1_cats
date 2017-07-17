//
//  DetailViewController.m
//  2w4d1_cats
//
//  Created by Seantastic31 on 17/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "DetailViewController.h"
#import "Cats.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.label.text = self.cat.imageTitle;
    self.imageView.image = self.cat.photo;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
