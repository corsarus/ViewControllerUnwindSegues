//
//  CustomCollectionViewController.m
//  CollectionViewAnimatedSegueTransition
//
//  Created by Catalin (iMac) on 21/06/2015.
//  Copyright (c) 2015 Corsarus. All rights reserved.
//

#import "CustomCollectionViewController.h"
#import "DetailViewController.h"
#import "CustomSegue.h"
@interface CustomCollectionViewController () <UICollectionViewDelegateFlowLayout>

@end

@implementation CustomCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    
    
    // Do any additional setup after loading the view.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 80;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor greenColor];
    // Configure the cell
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *selectedCell = [self.collectionView cellForItemAtIndexPath:indexPath];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailViewController *detailViewController = (DetailViewController *)[storyboard instantiateViewControllerWithIdentifier:@"detailVC"];
    CustomSegue *customSegue = [[CustomSegue alloc] initWithIdentifier:@"showDetail" source:self.navigationController destination:detailViewController];
    detailViewController.detailViewFrame = CGRectMake(selectedCell.frame.origin.x - self.collectionView.contentOffset.x, selectedCell.frame.origin.y - self.collectionView.contentOffset.y, selectedCell.frame.size.width, selectedCell.frame.size.height);

    [customSegue perform];
}

- (IBAction)handleUnwindFromDetailView:(UIStoryboardSegue *)segue
{
    
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(20.0, 20.0, 0.0, 20.0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 20.0f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 20.0f;
}

@end
