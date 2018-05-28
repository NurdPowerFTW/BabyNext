//
//  RegisterViewController.h
//  BabyNext
//
//  Created by William on 2014/10/11.
//  Copyright (c) 2014年 Moska Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *nickNameField;
@property (weak, nonatomic) IBOutlet UITextField *genderField;
@property (weak, nonatomic) IBOutlet UITextField *birthdayField;
@property (weak, nonatomic) IBOutlet UITextField *areaField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPwdField;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property NSInteger selectedRow;
@property NSArray* city;
@property NSMutableArray* cityName;
@property NSMutableArray* area;
@property NSDictionary* areaInfo;
@property NSDictionary* userInfo;

@end
