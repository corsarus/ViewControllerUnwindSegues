//
//  CustomSegue.m
//  CollectionViewAnimatedSegueTransition
//
//  Created by Catalin (iMac) on 22/06/2015.
//  Copyright (c) 2015 Corsarus. All rights reserved.
//

#import "CustomSegue.h"

@implementation CustomSegue

- (void)perform
{
    [self.sourceViewController pushViewController:self.destinationViewController animated:NO];
}

@end
