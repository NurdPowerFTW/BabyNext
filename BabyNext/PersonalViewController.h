//
//  PersonalViewController.h
//  BabyNext
//
//  Created by William on 2014/10/14.
//  Copyright (c) 2014年 Moska Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray* titleArray;
@property id cellNib;
@end
