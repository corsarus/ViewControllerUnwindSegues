//
//  CustomNavigationController.m
//  ViewControllerUnwindSegue
//
//  Created by Catalin (iMac) on 05/07/2015.
//  Copyright (c) 2015 Corsarus. All rights reserved.
//

#import "CustomNavigationController.h"
#import "CustomCollectionViewController.h"
#import "DetailViewController.h"


@implementation CustomNavigationController


- (UIStoryboardSegue *)segueForUnwindingToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController identifier:(NSString *)identifier
{
    return [UIStoryboardSegue segueWithIdentifier:identifier source:fromViewController destination:toViewController performHandler:^{
        if ([identifier isEqualToString:@"closeDetailView"]) {
            [UIView animateWithDuration:0.3
                             animations:^{
                                 DetailViewController *originViewController = (DetailViewController *)fromViewController;
                                 [originViewController resizeDetailViewToThumbnail];
                             }
                             completion:^(BOOL finished) {
                                 [self popToViewController:toViewController animated:NO];
                             }];
        }
    }];
}

@end
