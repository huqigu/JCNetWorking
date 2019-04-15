//
//  FirstRequest.m
//  JCNetworking_Example
//
//  Created by yellow on 2019/4/15.
//  Copyright © 2019 huqigu. All rights reserved.
//

#import "FirstRequest.h"

NSString * const kFirstRequestCategoryKey = @"kFirstRequestCategoryKey";

@implementation FirstRequest

- (JCNetworkRequestMethod)requestMethod {
    return JCNetworkRequestMethodGet;
}

- (NSString *)baseUrlString {
    return @"https://api.5wuli.com/";
}

- (NSString *)urlVersion {
    return @"v2/";
}

- (NSString *)urlPath {
    return @"message/list";
}

- (NSDictionary *)parameters {
    return @{
        @"channelId" : @"30",
        @"cursor" : @"0",
        @"slipType" : @"DOWN",
    };
}

- (NSString *)category {
    return kFirstRequestCategoryKey;
}

@end
