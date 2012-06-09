//
//  LogoutController.h
//  Dr.com
//
//  Created by Wang Rui on 12-6-9.
//  Copyright (c) 2012年. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrcomConnector.h"

@interface LogoutController : UIViewController<DrcomStatusProtocol>{
	NSString *IPAdress;
}

@property(nonatomic,copy)NSString *IPAdress;
@end
