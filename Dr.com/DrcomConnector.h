//
//  DrcomConnector.h
//  Dr.com
//
//  Created by Wang Rui on 12-6-10.
//  Copyright (c) 2012年. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DrcomStatusProtocol <NSObject>
@optional
- (void)drcomDidLoginedSuccessfully;
- (void)drcomDidLogoutedSuccessfully;

@end


@interface DrcomConnector : NSObject<NSURLConnectionDelegate>{
	BOOL _isLogined;
	NSURLConnection *loginConnection;
	NSURLConnection *logoutConnection;
}

@property (nonatomic)BOOL isLogined;
@property (nonatomic,assign)id<DrcomStatusProtocol> delegate;

+(DrcomConnector *)defaultDrcomConnector;

//登陆@参数：服务器；用户名；密码。
- (void)loginOnSever:(NSString*)server userName:(NSString*)user  password:(NSString*)password;

//注销@参数：服务器
- (void)logoutOnSever:(NSString*)server;

@end
