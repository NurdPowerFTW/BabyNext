//
//  LeftBarViewController.m
//  BabyNext
//
//  Created by William on 2014/10/14.
//  Copyright (c) 2014年 Moska Studio. All rights reserved.
//

#import "LeftBarViewController.h"
#import "ConfigureViewController.h"
#import <JHSidebarViewController.h>
#import "LeftBarTableViewCell.h"
@interface LeftBarViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation LeftBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    leftTableItem = @{@"" : @[@"Welcome",@"設定",@"登出"],};
    titleArray = [leftTableItem allKeys];
    //self.tableView.backgroundColor =  [UIColor darkGrayColor];
    self.tableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
       shouldReceiveTouch:(UITouch *)touch
{
    if([touch.view class] == self.tableView.class){
        NSLog(@"This tap belongs to tableview cell tap");
        return YES;
        
    }else
        
        return NO;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 && indexPath.section == 0)
        return 88.0f;
    else
        return 60.0f;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [titleArray count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [titleArray objectAtIndex:section];
}

// Customize the number of rows in the table view.

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSString* sectionTitle = [titleArray objectAtIndex:section];
    NSArray* sectionArray = [leftTableItem objectForKey:sectionTitle];
    return [sectionArray count];
    
}


// Customize the appearance of table view cells.

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString* CellIdentifier = @"leftBarViewCell";
    
    // 宣告一個
    LeftBarTableViewCell* cell = (LeftBarTableViewCell*) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell)
    {
        if (!self.cellNib)
        {
            // 把 CustomCell.xib 讀進來
            self.cellNib = [UINib nibWithNibName:@"LeftBarTableViewCell" bundle:nil];
        }
        
        NSArray* bundleObjects = [self.cellNib instantiateWithOwner:self options:nil];
        cell = [bundleObjects objectAtIndex:0];
    }
    
    
    // Set up the cell...
    
    
    NSString* sectionTitle = [titleArray objectAtIndex:indexPath.section];
    NSArray* sectionArray = [leftTableItem objectForKey:sectionTitle];
    NSString* itemString = [sectionArray objectAtIndex:indexPath.row];
    cell.textLabel.text = itemString;
    //cell.backgroundColor = [UIColor darkGrayColor];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cellTapped:)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    tapGestureRecognizer.numberOfTouchesRequired = 1;
    cell.tag = indexPath.section*10 + indexPath.row;
    [cell addGestureRecognizer:tapGestureRecognizer];
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //self.tappedItem =[NSNumber numberWithInteger:indexPath.row];
    //self.tappedSection = [NSNumber numberWithInteger:indexPath.section];
    NSString* sectionTitle = [titleArray objectAtIndex:indexPath.section];
    NSArray* sectionArray = [leftTableItem objectForKey:sectionTitle];
    NSString* itemString = [sectionArray objectAtIndex:indexPath.row];
    NSLog(@"You have selected %@", itemString);

    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
-(void)cellTapped:(UITapGestureRecognizer*)tap
{
    // Your code here
    //NSURL *exnternalApp = [NSURL URLWithString:@"fb512716882102488://"];
    //NSNumber* userRequestPage;
    NSInteger tagValue = tap.view.tag;
    NSInteger sectionValue = tagValue/10;
    NSInteger rowValue = tagValue%10;
    NSLog(@"Cell tapped");
    NSLog(@"section %ld",(long)sectionValue);
    NSLog(@"row %ld",(long)rowValue);
    NSString* sectionTitle = [titleArray objectAtIndex:sectionValue];
    NSArray* sectionArray = [leftTableItem objectForKey:sectionTitle];
    NSString* itemString = [sectionArray objectAtIndex:rowValue];
    NSLog(@"You have selected %@", itemString);
    
    if (sectionValue == 0) {
       
        switch (rowValue) {
            case 0:
                /*[self.sidebarViewController toggleLeftSidebar];
                 userRequestPage = [NSNumber numberWithInt:4];
                 [[NSNotificationCenter defaultCenter]postNotificationName:onTabBarItemChanged object:userRequestPage];*/
                break;
            case 1:
                //[self.sidebarViewController toggleLeftSidebar];
                /*userRequestPage = [NSNumber numberWithInt:2];
                 [[NSNotificationCenter defaultCenter]postNotificationName:onTabBarItemInstruction object:userRequestPage];*/
                [self.sidebarViewController toggleLeftSidebar];
                [self performSegueWithIdentifier:@"showConfigure" sender:self];
                
                break;
            default:
                break;
        }
    }
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
