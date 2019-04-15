//
//  JCNetworkRequest.m
//  AFNetworking
//
//  Created by yellow on 2019/4/12.
//

#import "JCNetworkRequest.h"
#import "JCNetworkConfig.h"
#import "JCNetworkConfigManager.h"
#import "JCNetworkManager.h"

@interface JCNetworkRequest ()

@property (nonatomic, strong) JCNetworkConfig *config;

@end


@implementation JCNetworkRequest

- (instancetype)init {
    if (self = [super init]) {
        self.baseUrlString = @"";
        self.urlVersion = @"";
        self.urlPath = @"";
        self.parameters = [NSDictionary dictionary];
    }
    return self;
}

#pragma mark - Public Methods

- (void)requestWithSuccess:(successBlock)success failure:(failureBlock)failure {
    
    NSAssert(success, @"successBlock不能为空");
    NSAssert(failure, @"failureBlock不能为空");
    
    JCNetworkManager *manager = [JCNetworkManager sharedManager];
    
    // API urlString
    NSString *urlString;
    if (self.urlString && self.urlString.length) {
        urlString = self.urlString;
    }else {
        urlString = [NSString stringWithFormat:@"%@%@%@",self.baseUrlString,self.urlVersion,self.urlPath];
    }
    
    if (!self.category) {
        self.category = defaultCategoryKey;
    }
    self.config = [[JCNetworkConfigManager sharedConfigManager] configForCategory:self.category];
    
    [manager requestWithMethod:self.requestMethod url:urlString parameters:self.parameters success:^(id responseObj) {
        
        if (!responseObj) {
            NSError *error = [NSError errorWithDomain:NSURLErrorDomain code:9999 userInfo:@{NSLocalizedDescriptionKey:@"没有返回数据"}];
            failure(error);
            return;
        }
        
        if (![responseObj isKindOfClass:[NSDictionary class]]) {
            success(responseObj);
            return;
        }
        
        NSString *code = [responseObj objectForKey:self.config.codeKey];
        if ([code isEqualToString:self.config.code]) {
            success([responseObj objectForKey:self.config.dataKey]);
        }else {
            NSError *error = [NSError errorWithDomain:NSURLErrorDomain code:[code intValue] userInfo:@{NSLocalizedDescriptionKey:[responseObj objectForKey:self.config.messageKey]}];
            failure(error);
        }
        
    } failure:^(NSError *error) {
        failure(error);
    }];
    
}

@end
