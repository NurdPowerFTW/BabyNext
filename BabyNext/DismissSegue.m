//
//  DismissSegue.m
//  BabyNext
//
//  Created by William on 2014/10/17.
//  Copyright (c) 2014年 Moska Studio. All rights reserved.
//

#import "DismissSegue.h"

@implementation DismissSegue

- (void)perform {
    UIViewController *sourceViewController = self.sourceViewController;
    [sourceViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
