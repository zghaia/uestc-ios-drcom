//
//  LogoutController.m
//  Dr.com
//
//  Created by Wang Rui on 12-6-9.
//  Copyright (c) 2012年 Meet-Future. All rights reserved.
//

#import "LogoutController.h"
#import "ZghaiaDrcom.h"

@implementation LogoutController
@synthesize IPAdress;

- (IBAction)logout:(id)sender{
	
	[ZghaiaDrcom logoutOnSever:self.IPAdress];
	[self.navigationController popViewControllerAnimated:YES];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return interfaceOrientation == UIInterfaceOrientationPortrait;
}

- (void)dealloc{
	[super dealloc];
	[IPAdress release];
}

@end
