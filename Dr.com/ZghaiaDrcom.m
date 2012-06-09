//
//  Zghaia_Dr_com.m
//  Dr.com for IOS
//
//  Created by zghaia@gmail.com on 6/8/12.
//  Copyright (c) 2012 UESTC. All rights reserved.
//

#import "ZghaiaDrcom.h"

@implementation ZghaiaDrcom

+(void)loginOnSever:(NSString*)server userName:(NSString*)user  password:(NSString*)password
{
    NSMutableURLRequest*  request = [NSMutableURLRequest new];  
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://%@/", server]]];  
    [request setHTTPMethod:@"POST"];  
    [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];  
    [request setHTTPBody:[NSString stringWithFormat:@"DDDDD=%@&upass=%@&0MKKey=%B5%C7%C2%BC+Login", user, password]];  
    //NSData* data =  [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];  
    //NSLog(@"%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
}

+(void)logoutOnSever:(NSString*)server
{
    NSMutableURLRequest*  request = [NSMutableURLRequest new];  
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://%@/F.htm", server]]];  
    [request setHTTPMethod:@"GET"];  
    NSData* data =  [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];  
    NSLog(@"%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
}

@end
