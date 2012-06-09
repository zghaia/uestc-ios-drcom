//
//  Zghaia_Dr_com.h
//  Dr.com for IOS
//
//  Created by zghaia@gmail.com on 6/8/12.
//  Copyright (c) 2012 UESTC. All rights reserved.
//

#import <Foundation/Foundation.h>

//用于Dr.com的接口
@interface ZghaiaDrcom

//登陆@参数：服务器；用户名；密码。
+(void)loginOnSever:(NSString*)server userName:(NSString*)user  password:(NSString*)password;

//注销@参数：服务器
+(void)logoutOnSever:(NSString*)server;

@end
