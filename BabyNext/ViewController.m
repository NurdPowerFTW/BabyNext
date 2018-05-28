//
//  ViewController.m
//  BabyNext
//
//  Created by William on 2014/10/9.
//  Copyright (c) 2014年 Moska Studio. All rights reserved.
//

#import "ViewController.h"
#import <GooglePlus/GooglePlus.h>
#import <GoogleOpenSource/GoogleOpenSource.h>
#import <FacebookSDK.h>
#import "WeiboSDK.h"
#import <TencentOpenAPI/TencentOAuthObject.h>
#import <TencentOpenAPI/TencentMessageObject.h>
#import <TencentOpenAPI/sdkdef.h>
#import "AppDelegate.h"
#import "RegisterViewController.h"
#import "BarViewController.h"
#import <JHSidebarViewController.h>

#define kRedirectURI @"http://www.sina.com";
static NSString * const kClientId = @"9365674440-qqbevdhlhsjng1i46ccfotr9egmcu1lj.apps.googleusercontent.com";
@interface ViewController ()<GPPSignInDelegate,FBLoginViewDelegate,JHSidebarDelegate>


@property (weak, nonatomic) IBOutlet UIButton *QQLoginButton;
@property NSDictionary* userInfo;

- (IBAction)fbSignIn:(id)sender;
- (IBAction)gPlusSignIn:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    GPPSignIn *signIn = [GPPSignIn sharedInstance];
    // You previously set kClientId in the "Initialize the Google+ client" step
    signIn.clientID = kClientId;
    signIn.scopes = [NSArray arrayWithObjects:
                     kGTLAuthScopePlusLogin, // defined in GTLPlusConstants.h
                     nil];
    signIn.shouldFetchGoogleUserEmail = YES;
    signIn.delegate = self;
    
    /*QQpermission = [NSMutableArray arrayWithObjects:
     kOPEN_PERMISSION_GET_USER_INFO,
     kOPEN_PERMISSION_GET_SIMPLE_USER_INFO,
     nil];*/
    
    //self.FBLoginView.delegate = self;
    //self.FBLoginView.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    AppDelegate *appDelegate = (AppDelegate *)
    [[UIApplication sharedApplication] delegate];
    NSLog(@"Testing Xcode 6.1");
}

- (void)viewWillAppear:(BOOL)animated{
    //[self refreshInterfaceBasedOnSignIn];
    // Open session with public_profile (required) and user_birthday read permissions
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) loginViewFetchedUserInfo:(FBLoginView*) loginView
                             user:(id<FBGraphUser>) user
{
    
        self.userInfo = [[NSDictionary alloc] initWithDictionary:(NSDictionary*) user];
        //[[NSUserDefaults standardUserDefaults]setObject:[self.userInfo objectForKey:@"first_name"] forKey:@"first_name"];
        //[[NSUserDefaults standardUserDefaults]setObject:[self.userInfo objectForKey:@"email"] forKey:@"email"];
        //NSLog(@"%@",[self.userInfo objectForKey:@"email"]);
        [self performSegueWithIdentifier:@"showRegister" sender:self];
        NSLog(@"Showing register view controller");
   // }
    
}
- (void) prepareForSegue:(UIStoryboardSegue*) segue sender:(id) sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"showRegister"])
    {
        // Get reference to the destination view controller
        RegisterViewController* vc = [segue destinationViewController];
        [vc setUserInfo:self.userInfo];
        //[vc setAccessToken:[[FBSession.activeSession accessTokenData] accessToken]];
    }
    
    
}
- (void)finishedWithAuth: (GTMOAuth2Authentication *)auth
                   error: (NSError *) error
{
    NSLog(@"Received error %@ and auth object %@",error, auth);
    if (error) {
        // Do some error handling here.
    } else {
        [self refreshInterfaceBasedOnSignIn];
    }
}


-(void)refreshInterfaceBasedOnSignIn
{
    
    if ([[GPPSignIn sharedInstance] authentication]) {
        // The user is signed in.
        
            
            GTLServicePlus* plusService = [[GTLServicePlus alloc]init];
            plusService.retryEnabled = YES;
            
            [plusService setAuthorizer:[GPPSignIn sharedInstance].authentication];
            GTLQueryPlus *query = [GTLQueryPlus queryForPeopleGetWithUserId:@"me"];
            
            [plusService executeQuery:query
                    completionHandler:^(GTLServiceTicket *ticket,
                                        GTLPlusPerson *person,
                                        NSError *error) {
                        if (error) {
                            GTMLoggerError(@"Error: %@", error);
                        } else {
                            // Retrieve the display name and "about me" text
                            NSLog(@"Google user name = %@",person.name.familyName);
                            NSLog(@"Google user info = %@",person.gender);
                            NSLog(@"Google user email = %@",[GPPSignIn sharedInstance].authentication.userEmail);
                            self.userInfo = [[NSDictionary alloc]initWithObjectsAndKeys:person.name.givenName,@"first_name",
                                             [GPPSignIn sharedInstance].authentication.userEmail,@"email",nil];
                            [self performSegueWithIdentifier:@"showRegister" sender:self];
                        }
                    }];
        
        
    }else {
        
    }
}
- (void)signOut {
    [[GPPSignIn sharedInstance] signOut];
}

- (void)disconnect {
    [[GPPSignIn sharedInstance] disconnect];
}

- (void)didDisconnectWithError:(NSError *)error {
    if (error) {
        NSLog(@"Received error %@", error);
    } else {
        // The user is signed out and disconnected.
        // Clean up user data as specified by the Google+ terms.
    }
}
- (IBAction)weiboLogin:(id)sender {
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = @"http://www.sina.com";
    request.scope = @"all";
    request.userInfo = @{@"SSO_From": @"SendMessageToWeiboViewController",
                         @"Other_Info_1": [NSNumber numberWithInt:123],
                         @"Other_Info_2": @[@"obj1", @"obj2"],
                         @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
    [WeiboSDK sendRequest:request];
}

- (void)request:(WBHttpRequest *)request didFinishLoadingWithResult:(NSString *)result
{
    NSString *title = nil;
    UIAlertView *alert = nil;
    
    title = @"收到网络回调";
    alert = [[UIAlertView alloc] initWithTitle:title
                                       message:[NSString stringWithFormat:@"%@",result]
                                      delegate:nil
                             cancelButtonTitle:@"确定"
                             otherButtonTitles:nil];
    [alert show];
    //[alert release];
}

- (void)request:(WBHttpRequest *)request didFailWithError:(NSError *)error;
{
    NSString *title = nil;
    UIAlertView *alert = nil;
    
    title = @"请求异常";
    alert = [[UIAlertView alloc] initWithTitle:title
                                       message:[NSString stringWithFormat:@"%@",error]
                                      delegate:nil
                             cancelButtonTitle:@"确定"
                             otherButtonTitles:nil];
    [alert show];
    //[alert release];
}
- (IBAction)qqLogin:(id)sender {
    //[tencentOAuth authorize:QQpermission inSafari:NO];
}

- (IBAction)fbSignIn:(id)sender {
    // If the session state is any of the two "open" states when the button is clicked
    if (FBSession.activeSession.state == FBSessionStateOpen
        || FBSession.activeSession.state == FBSessionStateOpenTokenExtended) {
        
        // Close the session and remove the access token from the cache
        // The session state handler (in the app delegate) will be called automatically
        [FBSession.activeSession closeAndClearTokenInformation];
        
        // If the session state is not any of the two "open" states when the button is clicked
    } else {
        // Open a session showing the user the login UI
        // You must ALWAYS ask for public_profile permissions when opening a session
        [FBSession openActiveSessionWithReadPermissions:@[@"public_profile"]
                                           allowLoginUI:YES
                                      completionHandler:
         ^(FBSession *session, FBSessionState state, NSError *error) {
             
             // Retrieve the app delegate
             AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
             // Call the app delegate's sessionStateChanged:state:error method to handle session state changes
             [appDelegate sessionStateChanged:session state:state error:error];
             [self checkFbSignStatus];
         }];
    }
}
- (void)checkFbSignStatus
{
    if (FBSession.activeSession.isOpen) {
        
        [[FBRequest requestForMe] startWithCompletionHandler:
         ^(FBRequestConnection *connection,
           NSDictionary<FBGraphUser> *user,
           NSError *error) {
             if (!error) {
                 NSString *firstName = user.first_name;
                 NSString *lastName = user.last_name;
                 NSString *facebookId = user.id;
                 NSString *email = [user objectForKey:@"email"];
                 NSString *imageUrl = [[NSString alloc] initWithFormat: @"http://graph.facebook.com/%@/picture?type=large", facebookId];
                 self.userInfo = [[NSDictionary alloc] initWithDictionary:(NSDictionary*) user];
                 //[[NSUserDefaults standardUserDefaults]setObject:[self.userInfo objectForKey:@"first_name"] forKey:@"first_name"];
                 //[[NSUserDefaults standardUserDefaults]setObject:[self.userInfo objectForKey:@"email"] forKey:@"email"];
                 //NSLog(@"%@",[self.userInfo objectForKey:@"email"]);
                 [self performSegueWithIdentifier:@"showRegister" sender:self];
             }
         }];
    }
}
- (IBAction)gPlusSignIn:(id)sender {
    [[GPPSignIn sharedInstance]authenticate];
}
- (IBAction)register:(id)sender {
    [self performSegueWithIdentifier:@"showRegister" sender:self];
}
@end
