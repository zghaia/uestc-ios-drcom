//
//  DrcomConnector.m
//  Dr.com
//
//  Created by Wang Rui on 12-6-10.
//  Copyright (c) 2012年 . All rights reserved.
//

#import "DrcomConnector.h"

@implementation DrcomConnector
@synthesize isLogined = _isLogined;
@synthesize delegate;

static DrcomConnector *_drcomConnector = nil;

+(DrcomConnector *)defaultDrcomConnector{
	if (!_drcomConnector) {
		_drcomConnector = [[DrcomConnector alloc]init];
	}
	
	return _drcomConnector;
}

- (void)loginOnSever:(NSString*)server userName:(NSString*)user  password:(NSString*)password{
	
	NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@/", server]]; 
    NSMutableURLRequest*  request = [[[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:3] autorelease];
	
    [request setHTTPMethod:@"POST"];  
    [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];  
	
    NSString *bodyStr = [NSString stringWithFormat:@"DDDDD=%@&upass=%@&0MKKey=%B5%C7%C2%BC+Login", 
						 user, password];
	NSData *bodyData = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
	[request setHTTPBody:bodyData];
	
	loginConnection = [[[NSURLConnection alloc] initWithRequest:request delegate:nil] autorelease];
	_drcomConnector.isLogined = YES;
	[[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"UseLoginKey"];
	
	if ([_drcomConnector.delegate respondsToSelector:@selector(drcomDidLoginedSuccessfully)]) {
		[_drcomConnector.delegate drcomDidLoginedSuccessfully];
	}

}

- (void)logoutOnSever:(NSString*)server{
	NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@/F.htm", server]];
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:3] autorelease];
				  
    [request setHTTPMethod:@"GET"];  
	
	logoutConnection = [[[NSURLConnection alloc] initWithRequest:request delegate:nil] autorelease];
	_drcomConnector.isLogined = NO;
	[[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"UseLoginKey"];
	
	if ([_drcomConnector.delegate respondsToSelector:@selector(drcomDidLogoutedSuccessfully)]) {
		[_drcomConnector.delegate drcomDidLogoutedSuccessfully];
	}

}

- (BOOL)isLogined{
	_isLogined = [[NSUserDefaults standardUserDefaults]boolForKey:@"UseLoginKey"];
	
	return _isLogined;
}

/*
#pragma mark - NSURLConnection 

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
	if (connection == loginConnection) {
		_drcomConnector.isLogined = YES;
		[[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"UseLoginKey"];
		
		if ([_drcomConnector.delegate respondsToSelector:@selector(drcomDidLoginedSuccessfully)]) {
			[_drcomConnector.delegate drcomDidLoginedSuccessfully];
		}
	}
	else if(connection == logoutConnection){
		
		_drcomConnector.isLogined = NO;
		[[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"UseLoginKey"];
		
		if ([_drcomConnector.delegate respondsToSelector:@selector(drcomDidLogoutedSuccessfully)]) {
			[_drcomConnector.delegate drcomDidLogoutedSuccessfully];
		}
	}
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"链接出错" message:@"可能是该账号存在问题，稍等一会儿重试几次" 
												   delegate:nil 
										  cancelButtonTitle:@"知道了" 
										  otherButtonTitles:nil, nil];
	[alert show];
	[alert release];
}
*/

@end
