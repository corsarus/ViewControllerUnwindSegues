//
//  DetailViewController.m
//  CollectionViewAnimatedSegueTransition
//
//  Created by Catalin (iMac) on 22/06/2015.
//  Copyright (c) 2015 Corsarus. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (nonatomic, strong) UIView *detailView;
@property (nonatomic, strong) NSLayoutConstraint *detailViewSizeConstraint;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!CGRectIsEmpty(self.detailViewFrame)) {
        
        self.detailView = [[UIView alloc] initWithFrame:self.detailViewFrame];
        self.detailView.backgroundColor = [UIColor greenColor];
        self.detailView.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self.view addSubview:self.detailView];
        
    }
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(closeDetailView)];
    self.navigationItem.leftBarButtonItem = backButton;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self updateDetailViewConstraints];
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         [self.view layoutIfNeeded];
                     }];
}

- (void)updateDetailViewConstraints
{
    // Offset the detail view by 100 points from the top of the main view
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.detailView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:84.0]];
    
    // In portrait orientation, make the detail view width at most 80% of the main view width
    self.detailViewSizeConstraint = [NSLayoutConstraint constraintWithItem:self.detailView
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.view
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:0.8
                                                                  constant:0.0];
    [self.view addConstraint:self.detailViewSizeConstraint];
    
    
    // Center the detail view horizontally and vertically
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.detailView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    
    // Make the detail view height equal to the width
    [self.detailView addConstraint:[NSLayoutConstraint constraintWithItem:self.detailView
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.detailView
                                                                attribute:NSLayoutAttributeWidth
                                                               multiplier:1.0
                                                                 constant:0.0]];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    // Remove the detail view size constraint
    [self.view removeConstraint:self.detailViewSizeConstraint];
    
    if (size.width < size.height)
        // In portrait orientation, make the detail view width 80% of the main view width
        self.detailViewSizeConstraint = [NSLayoutConstraint constraintWithItem:self.detailView
                                                                     attribute:NSLayoutAttributeWidth
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.view
                                                                     attribute:NSLayoutAttributeWidth
                                                                    multiplier:0.8
                                                                      constant:0.0];
    else
        // In landscape orientation, make the detail view height 60% of the main view width
        self.detailViewSizeConstraint = [NSLayoutConstraint constraintWithItem:self.detailView
                                                                     attribute:NSLayoutAttributeHeight
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.view
                                                                     attribute:NSLayoutAttributeHeight
                                                                    multiplier:0.6
                                                                      constant:0.0];
    
    [self.view addConstraint:self.detailViewSizeConstraint];
}

- (void)closeDetailView
{
    [self performSegueWithIdentifier:@"closeDetailView" sender:self];
}

- (void)resizeDetailViewToThumbnail
{
    self.detailView.frame = self.detailViewFrame;

}

@end
