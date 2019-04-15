//
//  JCNetworkConfig.m
//  AFNetworking
//
//  Created by yellow on 2019/4/12.
//

#import "JCNetworkConfig.h"

NSString * const defaultCategoryKey = @"JCNetworkDefaultCategoryKey";

@implementation JCNetworkConfig

- (instancetype)init {
    if (self = [super init]) {
        _codeKey = @"code";
        _dataKey = @"data";
        _messageKey = @"message";
    }
    return self;
}

@end
