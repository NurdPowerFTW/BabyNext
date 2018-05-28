//
//  BarViewController.m
//  BabyNext
//
//  Created by William on 2014/10/14.
//  Copyright (c) 2014年 Moska Studio. All rights reserved.
//

#import "BarViewController.h"

@interface BarViewController ()

@end

@implementation BarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITabBar* tabBar = self.tabBar;
    UITabBarItem* tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem* tabBarItem2 = [tabBar.items objectAtIndex:1];
    UITabBarItem* tabBarItem3 = [tabBar.items objectAtIndex:2];
    UITabBarItem* tabBarItem4 = [tabBar.items objectAtIndex:3];
    
    tabBarItem1.title = @"動態";
    tabBarItem2.title = @"交友邀請";
    tabBarItem3.title = @"訊息";
    tabBarItem4.title = @"通知";
    
    [tabBarItem1 setImage:[[UIImage imageNamed:@"img_newsfeed_off.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [tabBarItem1 setSelectedImage:[[UIImage imageNamed:@"img_newsfeed_on.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [tabBarItem2 setImage:[[UIImage imageNamed:@"img_requests_off.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [tabBarItem2 setSelectedImage:[[UIImage imageNamed:@"img_requests_on.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [tabBarItem3 setImage:[[UIImage imageNamed:@"img_messenger_off.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [tabBarItem3 setSelectedImage:[[UIImage imageNamed:@"img_messenger_on.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [tabBarItem4 setImage:[[UIImage imageNamed:@"img_notification_off.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [tabBarItem4 setSelectedImage:[[UIImage imageNamed:@"img_notification_on.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
