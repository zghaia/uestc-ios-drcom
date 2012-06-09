//
//  ViewController.h
//  Dr.com
//
//  Created by Wang Rui on 12-6-8.
//  Copyright (c) 2012年. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrcomConnector.h"

@interface ViewController : UIViewController<UITextFieldDelegate,DrcomStatusProtocol>{
	
	IBOutlet UITextField *userNameInput;
	IBOutlet UITextField *IPAdressInput;
	IBOutlet UITextField *passwordInput;
	
	IBOutlet UIButton *saveMessageBtn;
	IBOutlet UIButton *loginBtn;
}

@end
