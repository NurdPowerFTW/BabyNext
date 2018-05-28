//
//  LeftBarViewController.h
//  BabyNext
//
//  Created by William on 2014/10/14.
//  Copyright (c) 2014年 Moska Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftBarViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSDictionary *leftTableItem;
    NSArray* titleArray;
}
@property id cellNib;
@end
