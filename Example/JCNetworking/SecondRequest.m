//
//  SecondRequest.m
//  JCNetworking_Example
//
//  Created by yellow on 2019/4/15.
//  Copyright © 2019 huqigu. All rights reserved.
//

#import "SecondRequest.h"

NSString * const kSecondRequestCategoryKey = @"kSecondRequestCategoryKey";

@implementation SecondRequest

- (JCNetworkRequestMethod)requestMethod {
    return JCNetworkRequestMethodGet;
}

- (NSString *)urlString {
    return @"https://api.github.com/users/huqigu/repos";
}

- (NSDictionary *)parameters {
    return @{
             
             };
}

- (NSString *)category {
    return kSecondRequestCategoryKey;
}


@end
