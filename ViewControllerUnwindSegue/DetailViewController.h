//
//  DetailViewController.h
//  CollectionViewAnimatedSegueTransition
//
//  Created by Catalin (iMac) on 22/06/2015.
//  Copyright (c) 2015 Corsarus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (nonatomic) CGRect detailViewFrame;

- (void)resizeDetailViewToThumbnail;

@end
