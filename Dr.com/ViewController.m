//
//  ViewController.m
//  Dr.com
//
//  Created by Wang Rui on 12-6-8.
//  Copyright (c) 2012年 Meet-Future. All rights reserved.
//

#import "ViewController.h"
#import "InfoViewController.h"
#import "ZghaiaDrcom.h"
#import "LogoutController.h"

@implementation ViewController


- (void)saveUserInfoToLocal:(BOOL)isSave{
	if (isSave) {
		[[NSUserDefaults standardUserDefaults]setValue:IPAdressInput.text forKey:@"IPAdress"];
		[[NSUserDefaults standardUserDefaults]setValue:userNameInput.text forKey:@"UserName"];
		[[NSUserDefaults standardUserDefaults]setValue:passwordInput.text forKey:@"UserPassword"];
	}
	else {
		[[NSUserDefaults standardUserDefaults]removeObjectForKey:@"IPAdress"];
		[[NSUserDefaults standardUserDefaults]removeObjectForKey:@"UserName"];
		[[NSUserDefaults standardUserDefaults]removeObjectForKey:@"UserPassword"];
	}
}

- (void)loadUserInfoFromLocal{
	IPAdressInput.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"IPAdress"];
	userNameInput.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"UserName"];
	passwordInput.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"UserPassword"];
}

#pragma mark - UserAction

- (IBAction)getMoreInfo:(id)sender{
	
	NSString *nibname = nil;
	
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
		nibname =  @"InfoViewController";
	}else {
		nibname =  @"InfoViewController_iPhone";
	}
	
	InfoViewController *ctr = [[InfoViewController alloc]initWithNibName:nibname bundle:nil];
	ctr.modalPresentationStyle = UIModalPresentationFormSheet;
	[self presentModalViewController:ctr animated:YES];
	[ctr release];
}

- (IBAction)saveInputedMessage:(id)sender{
	UIButton *btn = (UIButton *)sender;
	[btn setSelected:!btn.selected];
	
	[self saveUserInfoToLocal:btn.selected];
}


- (IBAction)login:(id)sender{
	
	NSString *nibname = nil;
	
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
		nibname =  @"LogoutController";
	}else {
		nibname =  @"Logout_iPhone";
	}

	[ZghaiaDrcom loginOnSever:IPAdressInput.text userName:userNameInput.text password:passwordInput.text];
	
	LogoutController *ctr = [[LogoutController alloc]initWithNibName:nibname bundle:nil];
	ctr.IPAdress = IPAdressInput.text;
	[self.navigationController pushViewController:ctr animated:YES];
	[ctr release];
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
	[textField resignFirstResponder];
	
	return YES;
}

#pragma mark - ViewCycle
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	[self loadUserInfoFromLocal];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewWillAppear:(BOOL)animated{
	[self.navigationController setNavigationBarHidden:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return interfaceOrientation == UIInterfaceOrientationPortrait;
}

@end
