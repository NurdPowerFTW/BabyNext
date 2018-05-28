//
//  ViewController.h
//  BabyNext
//
//  Created by William on 2014/10/9.
//  Copyright (c) 2014年 Moska Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TencentOpenAPI/TencentOAuth.h>

@class GPPSignInButton;
@interface ViewController : UIViewController{
    NSMutableArray* QQpermission;
    TencentOAuth* tencentOAuth;
}



@end

