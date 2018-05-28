//
//  PersonalViewController.m
//  BabyNext
//
//  Created by William on 2014/10/14.
//  Copyright (c) 2014年 Moska Studio. All rights reserved.
//

#import "PersonalViewController.h"
#import <JHSidebarViewController.h>
#import "ConfigureViewController.h"
#import "PersonalViewCell.h"
@interface PersonalViewController ()<JHSidebarDelegate>

@end

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.sidebarViewController setDelegate:self];
    [self.sidebarViewController setSlideMainViewWithLeftSidebar:YES];
    [self.sidebarViewController enableTapGesture];
    [self.sidebarViewController enablePanGesture];
    //[self checkLoginStatus];
    self.navigationController.navigationBarHidden = YES;
    
    self.titleArray = [[NSMutableArray alloc]initWithObjects:@"1", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(onLoggingOutNotification:)
                                                name:LoggingOutNotification
                                              object:nil];
    [self checkLoginStatus];
}
- (void)sidebar:(JHSidebarSide)side stateChanged:(JHSidebarState)state {
    NSLog(@"%@ is %@", (side == JHSidebarLeft ? @"Left Sidebar" : @"Right Sidebar"), (state == JHSidebarOpen ? @"Open" : @"Close"));
}
- (void)onLoggingOutNotification:(NSNotification*)notification
{
    //[self.sidebarViewController toggleLeftSidebar];
    NSLog(@"Canceling left bar ");
}

- (void)checkLoginStatus
{
    if ([[NSUserDefaults standardUserDefaults]objectForKey:@"email"] != nil && [[NSUserDefaults standardUserDefaults]objectForKey:@"first_name"] != nil) {
        NSLog(@"User %@ is logged-in!",[[NSUserDefaults standardUserDefaults]objectForKey:@"first_name"]);
    }else{
        NSLog(@"Switching to Login View");
        [self performSegueWithIdentifier:@"showLogin" sender:self];
    }
        
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}


// Customize the number of rows in the table view.

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return [self.titleArray count];
    
}


// Customize the appearance of table view cells.

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* CellIdentifier = @"wallTableCell";
    
    // 宣告一個
    PersonalViewCell* cell = (PersonalViewCell*) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell)
    {
        if (!self.cellNib)
        {
            // 把 CustomCell.xib 讀進來
            self.cellNib = [UINib nibWithNibName:@"PersonalViewCell" bundle:nil];
        }
        
        NSArray* bundleObjects = [self.cellNib instantiateWithOwner:self options:nil];
        cell = [bundleObjects objectAtIndex:0];
    }
    
    // Set up the cell...
    
    cell.messageField.text = @"學校信箱是一種人與人情感交流的好地方……記得有次打開發現「聖家族」組長的愛心餅干，充滿了南神大家庭的溫馨；又有次打開信箱，發現了「南客社」來的問候與關心是否已適應學生生活…這是南神一直給我的溫馨感受。而今早，與幾位同學、學長姐一樣，收到了未署名的「紙卡」，上頭寫著聖經經句與堂皇言詞，字字控訴著收件人…好吧！姑且叫它「黑函」。";
    
    
    return cell;
    
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //self.tappedItem =[NSNumber numberWithInteger:indexPath.row];
    //self.tappedSection = [NSNumber numberWithInteger:indexPath.section];
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
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
