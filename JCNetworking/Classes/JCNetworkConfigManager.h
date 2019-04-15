//
//  JCNetworkConfigManager.h
//  AFNetworking
//
//  Created by yellow on 2019/4/12.
//

#import <Foundation/Foundation.h>

@class JCNetworkConfig;

typedef void(^JCNetworkConfigBlock)(JCNetworkConfig *config);

@interface JCNetworkConfigManager : NSObject

+ (instancetype)sharedConfigManager;

/**
 更新request配置

 @param configBlock 返回对应的request的配置对象
 @param category request的类别
 */
+ (void)updateNetworkConfig:(JCNetworkConfigBlock)configBlock forCategory:(NSString *)category;

- (JCNetworkConfig *)configForCategory:(NSString *)category;

@end


