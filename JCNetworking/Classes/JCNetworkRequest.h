//
//  JCNetworkRequest.h
//  AFNetworking
//
//  Created by yellow on 2019/4/12.
//

#import <Foundation/Foundation.h>

typedef enum : NSInteger {
    JCNetworkRequestMethodGet = 0,
    JCNetworkRequestMethodPost,
} JCNetworkRequestMethod;

typedef void (^successBlock)(id responseObj);
typedef void (^failureBlock)(NSError *error);

@interface JCNetworkRequest : NSObject

/**
 考虑到大型项目中，接口可能会有多个不同的规则，设置请求类别
 */
@property (nonatomic, copy) NSString *category;

/**
 API完整UrlString
 */
@property (nonatomic, copy) NSString *urlString;

/**
 API UrlString通过拼接的方式， 规则 baseUrlString + urlVersion + urlPath
 优先使用完整urlString
 */
@property (nonatomic, copy) NSString *baseUrlString;
@property (nonatomic, copy) NSString *urlVersion;
@property (nonatomic, copy) NSString *urlPath;

/**
 请求参数列表
 */
@property (nonatomic, copy) NSDictionary *parameters;

/**
 请求方法 GET/POST
 */
@property (nonatomic, assign) JCNetworkRequestMethod requestMethod;

/**
 发起请求

 @param success 成功的回调
 @param failure 失败的回调
 */
- (void)requestWithSuccess:(successBlock)success failure:(failureBlock)failure;


@end

