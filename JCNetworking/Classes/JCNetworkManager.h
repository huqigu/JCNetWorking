//
//  JCNetworkManager.h
//  AFNetworking
//
//  Created by yellow on 2019/4/12.
//

#import <Foundation/Foundation.h>
#import "JCNetworkRequest.h"


@interface JCNetworkManager : NSObject

+ (instancetype)sharedManager;


/**
 发起网络请求

 @param requestMethod 请求方法 GET/POST
 @param url API URLString
 @param parameters API 参数字典
 @param success 成功的回调
 @param failure 失败的回调
 */
- (void)requestWithMethod:(JCNetworkRequestMethod)requestMethod
                    url:(NSString *)url
             parameters:(NSDictionary *)parameters
                success:(successBlock)success
                failure:(failureBlock)failure;

@end

