//
//  SMLabJoinResponse.h
//  lab
//
//  Created by Christopher Fedak on 11/16/15.
//  Copyright © 2015 SMART Technologies. All rights reserved.
//

#import <Mantle.h>

@interface SMLabJoinResponse : MTLModel<MTLJSONSerializing>
@property NSString *uid;
@property NSString *sessionUrl;
@property NSString *fbAccessToken;
@property NSString *accessCode;
@end
