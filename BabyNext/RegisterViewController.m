//
//  RegisterViewController.m
//  BabyNext
//
//  Created by William on 2014/10/11.
//  Copyright (c) 2014年 Moska Studio. All rights reserved.
//

#import "RegisterViewController.h"
#import <JSONKit.h>
#import <AFNetworking.h>
@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.areaInfo = @{@"0":@[],
                      @"1":@[@"中正區",@"大同區",@"中山區",@"松山區",@"大安區",@"萬華區",@"信義區",@"士林區",@"北投區",@"內湖區",@"南港區",@"文山區"],
                      @"2":@[@"仁愛區",@"信義區",@"中正區",@"中山區",@"安樂區",@"暖暖區",@"七堵區"],
                      @"3":@[@"萬里區",@"金山區",@"板橋區",@"汐止區",@"深坑區",@"石碇區",@"瑞芳區",@"平溪區",@"雙溪區",@"貢寮區",@"新店區",@"坪林區",
                             @"烏來區",@"永和區",@"中和區",@"土城區",@"三峽區",@"樹林區",@"鶯歌區",@"三重區",@"新莊區",@"泰山區",@"林口區",@"蘆洲區",
                             @"五股區",@"八里區",@"淡水區",@"三芝區",@"石門區"],
                      @"4":@[@"宜蘭市",@"頭城鎮",@"礁溪鄉",@"壯圍鄉",@"員山鄉",@"羅東鎮",@"三星鄉",@"大同鄉",@"五結鄉",@"冬山鄉",@"蘇澳鎮",@"南澳鄉"],
                      @"5":@[@"東區",@"北區",@"南區"],
                      @"6":@[@"竹北市",@"湖口鄉",@"新豐鄉",@"新埔鄉",@"關西鎮",@"芎林鄉",@"寶山鄉",@"竹東鎮",@"五峰鄉",@"橫山鄉",@"尖石鄉",@"北埔鄉",
                             @"峨嵋鄉"],
                      @"7":@[@"中壢市",@"平鎮",@"龍潭鄉",@"楊梅鎮",@"新屋鄉",@"觀音鄉",@"桃園市",@"龜山鄉",@"八德市",@"大溪鎮",@"復興鄉",@"大園鄉",
                             @"蘆竹鄉"],
                      @"8":@[@"竹南鎮",@"頭份鎮",@"三灣鄉",@"南庄鄉",@"獅潭鄉",@"後龍鎮",@"通霄鎮",@"苑裡鎮",@"苗栗市",@"造橋鄉",@"頭屋鄉",@"公館鄉",
                             @"大湖鄉",@"泰安鄉",@"鉰鑼鄉",@"三義鄉",@"西湖鄉",@"卓蘭鄉"],
                      @"9":@[@"中區",@"東區",@"南區",@"西區",@"北區",@"北屯區",@"西屯區",@"南屯區",@"太平區",@"大里區",@"霧峰區",@"烏日區",@"豐原區",
                             @"后里區",@"石岡區",@"東勢區",@"和平區",@"新社區",@"潭子區",@"大雅區",@"神岡區",@"大肚區",@"沙鹿區",@"龍井區",@"梧棲區",
                             @"清水區",@"大甲區",@"外圃區",@"大安區"],
                      @"10":@[@"彰化市",@"芬園鄉",@"花壇鄉",@"秀水鄉",@"鹿港鎮",@"福興鄉",@"線西鄉",@"和美鎮",@"伸港鄉",@"員林鎮",@"社頭鄉",@"永靖鄉",
                             @"埔心鄉",@"溪湖鎮",@"大村鄉",@"埔鹽鄉",@"田中鎮",@"北斗鎮",@"田尾鄉",@"埤頭鄉",@"溪州鄉",@"竹塘鄉",@"二林鎮",@"大城鄉",
                             @"芳苑鄉",@"二水鄉"],
                      @"11":@[@"南投市",@"中寮鄉",@"草屯鎮",@"國姓鄉",@"埔里鎮",@"仁愛鄉",@"名間鄉",@"集集鄉",@"水里鄉",@"魚池鄉",@"信義鄉",@"竹山鎮",
                              @"鹿谷鄉"],
                      @"12":@[@"嘉義市"],
                      @"13":@[@"番路鄉",@"梅山鄉",@"竹崎鄉",@"阿里山鄉",@"中埔鄉",@"大埔鄉",@"水上鄉",@"鹿草鄉",@"太保市",@"朴子市",@"東石鄉",@"六腳鄉",
                              @"新港鄉",@"民雄鄉",@"大林鎮",@"漢口鄉",@"義竹鄉",@"布袋鎮"],
                      @"14":@[@"斗南鎮",@"大埤鄉",@"虎尾鎮",@"土庫鎮",@"褒忠鄉",@"東勢鄉",@"臺西鄉",@"崙背鄉",@"麥寮鄉",@"斗六市",@"林內鄉",@"古坑鄉",
                              @"莿桐鄉",@"西螺鎮",@"二崙鄉",@"北港鎮",@"水林鄉",@"口湖鄉",@"四湖鄉",@"元長鄉"],
                      @"15":@[@"中西區",@"東區",@"南區",@"北區",@"安平區",@"安南區",@"永康區",@"歸仁區",@"新化區",@"左鎮區",@"玉井區",@"楠西區",@"南化區",
                              @"仁德區",@"關廟區",@"龍崎區",@"官田區",@"麻豆區",@"佳里區",@"西港區",@"七股區",@"將軍區",@"學甲區",@"北門區",@"新營區",
                              @"後壁區",@"白河區",@"東山區",@"六甲區",@"下營區",@"柳營區",@"鹽水區",@"善化區",@"大內區",@"山上區",@"新市區",@"安定區"],
                      @"16":@[@"新興區",@"前金區",@"苓雅區",@"鹽埕區",@"鼓山區",@"旗津區",@"前鎮區",@"三民區",@"楠梓區",@"小港區",@"左營區",@"仁武區",
                              @"大社區",@"岡山區",@"路竹區",@"阿蓮區",@"田寮區",@"燕巢區",@"橋頭區",@"梓官區",@"彌陀區",@"永安區",@"湖內區",@"鳳山區",
                              @"大寮區",@"林園區",@"鳥松區",@"大樹區",@"旗山區",@"美濃區",@"六龜區",@"內門區",@"杉林區",@"甲仙區",@"桃源區",@"三民區",
                              @"茂林區",@"茄萣區"],
                      @"17":@[@"馬公市",@"西嶼鄉",@"望安鄉",@"七美鄉",@"白沙鄉",@"湖西鄉"],
                      @"18":@[@"屏東市",@"三地門鄉",@"霧臺鄉",@"瑪家鄉",@"九如鄉",@"里港鄉",@"高樹鄉",@"鹽埔鄉",@"長治鄉",@"麟洛鄉",@"竹田鄉",@"內埔鄉",
                              @"萬丹鄉",@"潮州鎮",@"泰武鄉",@"來義鄉",@"萬巒鄉",@"嵌頂鄉",@"新埤鄉",@"南州鄉",@"林邊鄉",@"東港鎮",@"琉球鄉",@"佳冬鄉",
                              @"新園鄉",@"枋寮鄉",@"枋山鄉",@"春日鄉",@"獅子鄉",@"車城鄉",@"牡丹鄉",@"恆春鎮",@"滿州鄉"],
                      @"19":@[@"臺東市",@"綠島鄉",@"蘭嶼鄉",@"延平鄉",@"卑南鄉",@"鹿野鄉",@"關山鎮",@"海端鄉",@"池上鄉",@"東河鄉",@"成功鎮",@"長濱鄉",
                              @"太麻里鄉",@"金峰鄉",@"大武鄉",@"達仁鄉"],
                      @"20":@[@"花蓮市",@"新城鄉",@"秀林鄉",@"吉安鄉",@"壽豐鄉",@"鳳林鎮",@"光復鄉",@"豐濱鄉",@"瑞穗鄉",@"萬榮鄉",@"玉里鎮",@"卓溪鄉",
                              @"富里鄉"],
                      @"21":@[@"金沙鎮",@"金湖鎮",@"金寧鄉",@"金城鎮",@"烈嶼鄉",@"烏坵鄉"],
                      @"22":@[@"南竿鄉",@"北竿鄉",@"莒光鄉",@"東引"],
                      @"23":@[@"東沙",@"西沙"],
                      @"24":@[@"釣魚台列嶼"]
                      };
    NSLog(@"Adding city names");
    self.city = [[NSArray alloc]initWithObjects:@"請選擇城市",@"臺北市",@"基隆市",@"新北市",@"宜蘭縣",@"新竹市",@"新竹縣",@"桃園縣",@"苗栗縣",@"臺中市",@"彰化縣",@"南投縣",@"嘉義市",@"嘉義縣",@"雲林縣",@"臺南市",@"高雄市",@"澎湖縣",@"屏東縣",@"臺東縣",@"花蓮縣",@"金門縣",@"連江縣",@"南海諸島",@"釣魚台列嶼",nil];
    
    
    /*for (int i = 0; i < self.city.count; i++) {
     NSLog(@"%@ contains following regions: %@", [self.city objectAtIndex:0],[self.areaInfo objectForKey:[self.city objectAtIndex:0]]);
     }*/
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)registerAction:(id)sender {
    [[NSUserDefaults standardUserDefaults]setObject:self.firstNameField.text forKey:@"first_name"];
    [[NSUserDefaults standardUserDefaults]setObject:self.lastNameField.text forKey:@"last_name"];
    [[NSUserDefaults standardUserDefaults]setObject:self.nickNameField.text forKey:@"nickname"];
    [[NSUserDefaults standardUserDefaults]setObject:self.genderField.text forKey:@"gender"];
    [[NSUserDefaults standardUserDefaults]setObject:self.birthdayField.text forKey:@"birthday"];
    [[NSUserDefaults standardUserDefaults]setObject:self.areaField.text forKey:@"area"];
    [[NSUserDefaults standardUserDefaults]setObject:self.emailField.text forKey:@"email"];
    [[NSUserDefaults standardUserDefaults]setObject:self.pwdField.text forKey:@"password"];
    [[NSUserDefaults standardUserDefaults]setObject:self.confirmPwdField.text forKey:@"pwd_confirm"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSLog(@"firstName = %@",[[NSUserDefaults standardUserDefaults]objectForKey:@"first_name"]);
    NSLog(@"lastName = %@",[[NSUserDefaults standardUserDefaults]objectForKey:@"last_name"]);
    NSLog(@"nickname = %@",[[NSUserDefaults standardUserDefaults]objectForKey:@"nickname"]);
    NSLog(@"gender = %@",[[NSUserDefaults standardUserDefaults]objectForKey:@"gender"]);
    NSLog(@"birthday = %@",[[NSUserDefaults standardUserDefaults]objectForKey:@"birthday"]);
    NSLog(@"area = %@",[[NSUserDefaults standardUserDefaults]objectForKey:@"area"]);
    NSLog(@"email = %@",[[NSUserDefaults standardUserDefaults]objectForKey:@"email"]);
    NSLog(@"password = %@",[[NSUserDefaults standardUserDefaults]objectForKey:@"password"]);
    NSLog(@"password = %@",[[NSUserDefaults standardUserDefaults]objectForKey:@"pwd_confirm"]);
    
    /*NSMutableDictionary* infoJson = [NSMutableDictionary dictionary];
     [infoJson setObject:self.firstNameField.text forKey:@"first_name"];
     [infoJson setObject:self.lastNameField.text forKey:@"last_name"];
     [infoJson setObject:self.nickNameField.text forKey:@"nickname"];
     [infoJson setObject:self.genderField.text forKey:@"gender"];
     [infoJson setObject:self.birthdayField.text forKey:@"birthday"];
     [infoJson setObject:self.areaField.text forKey:@"area"];
     [infoJson setObject:self.emailField.text forKey:@"email"];
     [infoJson setObject:self.pwdField.text forKey:@"password"];
     [infoJson setObject:self.confirmPwdField.text forKey:@"pwd_confirm"];
     NSString* jsonString = [infoJson JSONString];*/
    
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSMutableDictionary* parameters = [[NSMutableDictionary alloc]init];
    [parameters setObject:[[NSUserDefaults standardUserDefaults]objectForKey:@"email"] forKey:@"account"];
    [parameters setObject:[[NSUserDefaults standardUserDefaults]objectForKey:@"password"] forKey:@"pwd"];
    [parameters setObject:[[NSUserDefaults standardUserDefaults]objectForKey:@"pwd_confirm"] forKey:@"pwd_confirm"];
    [parameters setObject:[[NSUserDefaults standardUserDefaults]objectForKey:@"first_name"] forKey:@"first_name"];
    [parameters setObject:[[NSUserDefaults standardUserDefaults]objectForKey:@"last_name"] forKey:@"last_name"];
    
}
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    
    if (component == 0) {
         return [self.city count];
    }else{
        if (self.selectedRow) {
            return [self.area count];
        }
        return 0;
    }
    
    
    
    
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return [self.city objectAtIndex:row];
    }else
    {
        if (self.selectedRow) {
            return [self.area objectAtIndex:row];
        }
        return nil;
    }
    
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // This method is triggered whenever the user makes a change to the picker selection.
    // The parameter named row and component represents what was selected.
    if (component == 0) {
        self.selectedRow = row;
        [self reloadPickerView];
        [self.pickerView reloadComponent:1];
        [self.pickerView selectRow:0 inComponent:1 animated:YES];
    }
    
    
}
- (void)reloadPickerView {
    NSString* keyValue = [NSString stringWithFormat:@"%ld",(long)self.selectedRow];
    self.area = [NSMutableArray arrayWithArray:[self.areaInfo objectForKey:keyValue]];
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
