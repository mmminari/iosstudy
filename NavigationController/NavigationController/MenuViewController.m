//
//  MenuViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 20..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "MenuViewController.h"
#import "ShowMenuViewController.h"
#import "MenuCell.h"

typedef NS_ENUM(NSInteger, MenuList)
{
    MenuListPush = 0,
    MenuListEvent,
    MenuListNotice,
    MenuListCustomerCenter,
    MenuListAgreement,
    MenuListUserInfo,
    MenuListVersionNum,
    
};

@interface MenuViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *ivUser;
@property (weak, nonatomic) IBOutlet UIImageView *ivSetting;
@property (weak, nonatomic) IBOutlet UILabel *lbUserName;
@property (weak, nonatomic) IBOutlet UILabel *lbUserId;
@property (strong, nonatomic) NSArray *menuArr;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfMenuView;

@property (weak, nonatomic) IBOutlet UIImageView *ivLine;

@property (weak, nonatomic) IBOutlet UITableView *tvMenu;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcCenterOfLbName;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfIcon;
@property (weak, nonatomic) IBOutlet UIImageView *ivIcon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfTableView;

@end

@implementation MenuViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.ivSetting.image = [UIImage imageNamed:@"menu_setting"];
    self.ivUser.image = [UIImage imageNamed:@"img_profile_menu"];
    
    self.lbUserName.text = [self.userInfo userName];
    self.lbUserId.text = [self.userInfo userId];
    
    self.ivUser.layer.cornerRadius = 50.0f;
    self.ivUser.layer.masksToBounds = YES;

    [self downLoadImage];
    
    self.menuArr = @[@"PUSH 알림", @"이벤트", @"공지사항", @"고객센터", @"이용약관", @"개인정보 취급방침", @"버전정보"];
    
    self.alcWidthOfMenuView.constant = WRATIO_WIDTH(REMAIN_SPACE);
    self.alcCenterOfLbName.constant = self.alcCenterOfLbName.constant - WRATIO_WIDTH(102.0f)/2;
    
    self.ivLine.backgroundColor = [self.util getColorWithRGBCode:@"eeeeee"];
    self.ivIcon.image = [UIImage imageNamed:@"icon_grade_vip"];

    self.tvMenu.rowHeight = WRATIO_WIDTH(155.0f);
    self.alcHeightOfTableView.constant = self.tvMenu.rowHeight * self.menuArr.count;
    
}


-(void)downLoadImage
{
    NSURLSessionDataTask *dataTask;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[self.userInfo profileImg]]];
    dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        UIImage *image = [[UIImage alloc]initWithData:data];

        self.ivUser.image = image;
    }];
    
    [dataTask resume];
    
}

#pragma mark - TableView DataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"menuCell";
    
    MenuCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if(cell == nil)
    {
        cell = [[MenuCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.lbMenuText.text = self.menuArr[indexPath.row];
    cell.contentView.layer.borderColor = [self.util getColorWithRGBCode:@"eeeeee"].CGColor;
    cell.lbMenuText.font = [UIFont systemFontOfSize:WRATIO_WIDTH(47.0f)];
    cell.lbMenuText.textColor = [self.util getColorWithRGBCode:@"424242"];
    
    UIDevice *device = [UIDevice currentDevice];
    
    cell.lbVersion.text = device.systemVersion;

    [cell.swNotice setHidden:YES];
    [cell.lbVersion setHidden:YES];
    
    if(indexPath.row == 0)
    {
        [cell.swNotice setHidden:NO];
    }
    else if(indexPath.row == 6)
    {
        [cell.lbVersion setHidden:NO];
    }

    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.menuArr.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuList menuList = indexPath.row;
    
    NSLog(@"%zd", menuList);
    
    NSString *title = self.menuArr[menuList];
    [self.mainVC performSegueWithIdentifier:@"sgMenuToShow" sender:title];
    
    NSLog(@"title: %@", title);
    

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}

@end