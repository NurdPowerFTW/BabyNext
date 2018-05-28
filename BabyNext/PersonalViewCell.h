//
//  PersonalViewCell.h
//  BabyNext
//
//  Created by William on 2014/10/28.
//  Copyright (c) 2014年 Moska Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *profilePic;
@property (weak, nonatomic) IBOutlet UILabel *profileName;
@property (weak, nonatomic) IBOutlet UILabel *friendProfileName;
@property (weak, nonatomic) IBOutlet UILabel *timeStamp;
@property (weak, nonatomic) IBOutlet UITextView *messageField;
@property (weak, nonatomic) IBOutlet UIImageView *uploadedImg;

@end
