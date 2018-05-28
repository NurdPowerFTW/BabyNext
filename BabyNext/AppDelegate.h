//
//  AppDelegate.h
//  BabyNext
//
//  Created by William on 2014/10/9.
//  Copyright (c) 2014年 Moska Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiboSDK.h"
#import <FacebookSDK.h>
extern NSString *const FBSessionStateChangedNotification;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)sessionStateChanged:(FBSession *)session
                      state:(FBSessionState) state
                      error:(NSError *)error;
@end

