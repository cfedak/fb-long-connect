//
//  SMLabJoinRequest.h
//  lab
//
//  Created by Christopher Fedak on 11/16/15.
//  Copyright © 2015 SMART Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle.h>

@interface SMLabJoinRequest : MTLModel<MTLJSONSerializing>
@property NSString *accessCode;
@property NSString *name;
@end
