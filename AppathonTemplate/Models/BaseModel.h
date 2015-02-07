//
//  BaseModel.h
//  OPX
//
//  Created by Sharma Elanthiraiyan on 03/06/14.
//  Copyright (c) 2014 Market Simplified. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Error.h"
#import "AppData.h"
@class BaseViewController;
#import "JSONModelBaseProtocol.h"

@protocol BaseModelDeleGate <NSObject>

- (void)logoutForInvalidSession;
- (void)noResponse:(Error*)error;

@end

@interface BaseModel : NSObject

@property (nonatomic, strong) NSString *svcName;
@property (nonatomic, weak) id <BaseModelDeleGate> baseModelDelegate;

//@property (nonatomic) BOOL showInvalidSession;

- (void)sendRequest:(id<JSONModelBaseProtocol>)request;
- (void)handleResponse:(NSDictionary*)response;
- (void)handleError:(Error *)errorObj;
- (NSDictionary*)getDataPartFrom:(NSDictionary *)response;
- (void)sendLogoutRequestForSessionTimeOut;
@end