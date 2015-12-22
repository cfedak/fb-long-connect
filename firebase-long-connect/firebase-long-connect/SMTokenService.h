//
//  SMTokenService.h
//  firebase-long-connect
//
//  Created by Christopher Fedak on 12/22/15.
//  Copyright © 2015 SMART Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMLabJoinRequest.h"

@interface SMTokenService : NSObject
@property NSURL *classlabAPIURL;
@property NSOperationQueue *callbackQueue;
@property NSURLSession *urlSession;

- (instancetype)initWithClasslabAPIURL:(NSURL *)url;

- (void)fetchAccessToken:(NSString *)accessCode
                 success:(void (^)(NSString *token))success
                 failure:(SMLabServiceFailureCallback)failureCallback;

- (void)joinSession:(NSString *)accessToken
            request:(SMLabJoinRequest *)request
            success:(void (^)(SMLabJoinResponse *response))success
            failure:(SMLabServiceFailureCallback)failureCallback;
@end
