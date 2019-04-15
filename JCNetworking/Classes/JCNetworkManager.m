//
//  JCNetworkManager.m
//  AFNetworking
//
//  Created by yellow on 2019/4/12.
//

#import "JCNetworkManager.h"
#import "AFNetworking.h"

@interface JCNetworkManager ()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation JCNetworkManager

- (instancetype)init {
    if (self = [super init]) {
        _manager = [AFHTTPSessionManager manager];
        
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        _manager.requestSerializer.timeoutInterval = 60;
        
        _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", nil];
    }
    return self;
}

+ (instancetype)sharedManager {
    static JCNetworkManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[JCNetworkManager alloc] init];
    });
    return _sharedManager;
}

#pragma mark - Public Methods

- (void)requestWithMethod:(JCNetworkRequestMethod)requestMethod url:(NSString *)url parameters:(NSDictionary *)parameters success:(successBlock)success failure:(failureBlock)failure {
    switch (requestMethod) {
        case JCNetworkRequestMethodGet:
        {
            [self.manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    id json = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
                    success(json);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(error);
                }
            }];
        }
            break;
        case JCNetworkRequestMethodPost:
        {
            [self.manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    id json = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
                    success(json);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(error);
                }
            }];
        }
            break;
        default:
            break;
    }
}

@end
