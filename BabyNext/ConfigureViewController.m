//
//  ConfigureViewController.m
//  BabyNext
//
//  Created by William on 2014/10/14.
//  Copyright (c) 2014年 Moska Studio. All rights reserved.
//

#import "ConfigureViewController.h"
#import <FacebookSDK.h>
#import <JHSidebarViewController.h>
#import <GooglePlus/GooglePlus.h>
#import <GoogleOpenSource/GoogleOpenSource.h>
NSString* LoggingOutNotification = @"LoggingOutNotification";
@interface ConfigureViewController ()
@property (weak, nonatomic) IBOutlet UIButton *logoutButton;

@end

@implementation ConfigureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (FBSessionStateOpen) {
        //self.logoutButton.titleLabel.text = @"登出Facebook帳號";
        [self.logoutButton setTitle:@"登出Facebook帳號" forState:UIControlStateNormal];
    }
    
    if ([[GPPSignIn sharedInstance]authentication])
    {
        //self.logoutButton.titleLabel.text = @"登出Google+帳號";
        [self.logoutButton setTitle:@"登出Google+帳號" forState:UIControlStateNormal];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signOut:(id)sender {
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"email"];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"first_name"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    if (FBSessionStateOpen) {
        FBSession* session = [FBSession activeSession];
        [session closeAndClearTokenInformation];
        [session close];
        [FBSession setActiveSession:nil];
    }
    
    if ([[GPPSignIn sharedInstance]authentication]) {
        [[GPPSignIn sharedInstance] signOut];
    }
    
    [[NSNotificationCenter defaultCenter]postNotificationName:LoggingOutNotification object:nil];
    [self performSegueWithIdentifier:@"dismissConfigure" sender:self];
    
}
- (IBAction)backButton:(id)sender {
    [self performSegueWithIdentifier:@"dismissConfigure" sender:self];
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
