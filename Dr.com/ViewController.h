//
//  ViewController.h
//  Dr.com
//
//  Created by Wang Rui on 12-6-8.
//  Copyright (c) 2012年 Meet-Future. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>{
	
	IBOutlet UITextField *userNameInput;
	IBOutlet UITextField *IPAdressInput;
	IBOutlet UITextField *passwordInput;
	
	IBOutlet UIButton *saveMessageBtn;
	IBOutlet UIButton *loginBtn;
}

@end
